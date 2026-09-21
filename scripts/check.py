#!/usr/bin/env python3
"""Validate lazy-idea mappings against local JetBrains installations."""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
HOME = Path.home()
ACTION_RE = re.compile(r"<Action>\(([^)]+)\)")
COLON_ACTION_RE = re.compile(r":action\s+([^\s<]+)", re.IGNORECASE)
MAP_RE = re.compile(r"^\s*([nvox]?(?:nore)?map)\s+(\S+)")
DESCRIPTION_RE = re.compile(r'''^\s*let\s+g:WhichKeyDesc_\S+\s*=\s*(["'])(.*?)\1\s*$''')
LEADER_MAP_RE = re.compile(r"^\s*(?:[nvox]?(?:nore)?map)\s+(<leader>\S+)\s+(.+)", re.IGNORECASE)
# These actions are registered in code rather than plugin.xml resources.
DYNAMIC_ACTIONS = {
    "ActivateNotificationsToolWindow",
    "ActivateTODOToolWindow",
    "WelcomeScreen.Plugins",
}


def fail(message: str) -> None:
    print(f"FAIL  {message}")


def ok(message: str) -> None:
    print(f"OK    {message}")


def ide_apps() -> list[Path]:
    roots = (HOME / "Applications", Path("/Applications"))
    names = ("GoLand.app", "RustRover.app")
    return [root / name for root in roots for name in names if (root / name).is_dir()]


def actions_in_app(app: Path) -> set[str]:
    actions: set[str] = set()
    for jar in (app / "Contents").rglob("*.jar"):
        try:
            with zipfile.ZipFile(jar) as archive:
                for name in archive.namelist():
                    if not name.endswith(".xml"):
                        continue
                    data = archive.read(name)
                    if b"action" not in data and b"group" not in data:
                        continue
                    text = data.decode("utf-8", errors="ignore")
                    actions.update(re.findall(r'<(?:action|group)\b[^>]*\bid=["\']([^"\']+)', text))
        except (OSError, zipfile.BadZipFile, RuntimeError):
            continue
    return actions


def run_git(remote: bool) -> bool:
    clean = True
    if remote:
        result = subprocess.run(["git", "fetch", "--quiet", "origin"], cwd=ROOT)
        if result.returncode:
            fail("could not fetch origin")
            return False
        ok("fetched origin")

    upstream = subprocess.run(
        ["git", "rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{upstream}"],
        cwd=ROOT, text=True, capture_output=True,
    )
    if upstream.returncode:
        fail("current branch has no Git upstream")
        return False
    counts = subprocess.check_output(
        ["git", "rev-list", "--left-right", "--count", f"HEAD...{upstream.stdout.strip()}"],
        cwd=ROOT, text=True,
    ).split()
    ahead, behind = counts
    ok(f"Git upstream {upstream.stdout.strip()}: {ahead} ahead, {behind} behind")
    return clean


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--remote", action="store_true", help="fetch origin before checking Git status")
    args = parser.parse_args()
    good = True
    config: dict = {}

    try:
        config = json.loads((ROOT / "config/.whichkey-lazy.json").read_text())
        ok("Which Key Lazy JSON is valid")
    except (OSError, json.JSONDecodeError) as error:
        fail(f"invalid Which Key Lazy JSON: {error}")
        good = False

    vim_files = sorted(ROOT.glob("*.vim")) + sorted((ROOT / "modules").glob("*.vim"))
    actions: set[str] = set()
    mappings: dict[tuple[str, str], list[str]] = {}
    descriptions: list[tuple[str, str]] = []
    raw_leader_mappings: set[str] = set()
    for path in vim_files:
        for number, line in enumerate(path.read_text().splitlines(), 1):
            if not line.lstrip().startswith('"'):
                actions.update(ACTION_RE.findall(line))
                actions.update(COLON_ACTION_RE.findall(line))
            description = DESCRIPTION_RE.match(line)
            if description:
                value = description.group(2)
                _, separator, text = value.partition(" ")
                if separator:
                    descriptions.append((f"{path.name}:{number}", text))
            leader_mapping = LEADER_MAP_RE.match(line)
            if (
                leader_mapping
                and "<action>" not in leader_mapping.group(2).lower()
                and not COLON_ACTION_RE.search(leader_mapping.group(2))
            ):
                suffix = leader_mapping.group(1)[len("<leader>"):].replace("<bar>", "|")
                raw_leader_mappings.add(suffix)
            match = MAP_RE.match(line)
            if match:
                mode = match.group(1)[0] if match.group(1)[0] in "nvox" else ""
                mappings.setdefault((mode, match.group(2)), []).append(f"{path.name}:{number}")
    duplicates = {key: places for key, places in mappings.items() if len(places) > 1}
    if duplicates:
        for (mode, key), places in sorted(duplicates.items()):
            fail(f"duplicate mapping {mode or 'all'}:{key}: {', '.join(places)}")
        good = False
    else:
        ok(f"{len(mappings)} mappings have no mode/key collisions")

    overrides = config.get("overrides", {})
    for key, override in overrides.items():
        if isinstance(override, dict) and isinstance(override.get("description"), str):
            descriptions.append((f"config override {key}", override["description"]))
    missing_descriptions = sorted(
        key for key in raw_leader_mappings
        if not isinstance(overrides.get(key), dict) or not overrides[key].get("description")
    )
    if missing_descriptions:
        fail(f"leader mappings expose raw commands: {', '.join(missing_descriptions)}")
        good = False
    else:
        ok("all non-action leader mappings have display descriptions")

    invalid_descriptions = []
    for location, text in descriptions:
        visible = text.removeprefix("+")
        first_letter = next((char for char in visible if char.isalpha()), "")
        if first_letter and first_letter.islower():
            invalid_descriptions.append(location)
        if re.search(r"<(?:cr|esc|tab|bs|leader)>", text, re.IGNORECASE):
            invalid_descriptions.append(location)
    if invalid_descriptions:
        fail(f"nonstandard display descriptions: {', '.join(sorted(set(invalid_descriptions)))}")
        good = False
    else:
        ok(f"all {len(descriptions)} descriptions use consistent display text")

    apps = ide_apps()
    if not apps:
        fail("no local GoLand or RustRover installation found")
        good = False
    for app in apps:
        registered = actions_in_app(app)
        relevant = {action for action in actions if not action.startswith("Rider")}
        missing = sorted(relevant - registered - DYNAMIC_ACTIONS)
        if missing:
            fail(f"{app.stem} does not expose: {', '.join(missing)}")
            good = False
        else:
            ok(f"all {len(relevant)} relevant actions exist in {app.stem}")

    plugin_roots = [HOME / "Library/Application Support/JetBrains" / f"{name}2026.2/plugins" for name in ("GoLand", "RustRover")]
    for root in plugin_roots:
        if (root / "IdeaVIM").is_dir() and (root / "which-key-lazy").is_dir():
            ok(f"required plugins installed for {root.parent.name}")
        else:
            fail(f"missing IdeaVIM or which-key-lazy under {root}")
            good = False

    good = run_git(args.remote) and good
    return 0 if good else 1


if __name__ == "__main__":
    sys.exit(main())
