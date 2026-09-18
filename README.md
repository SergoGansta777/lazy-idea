# lazy-idea

[LazyVim](https://github.com/LazyVim/LazyVim) key mappings for JetBrains IDEs. Making [IdeaVim](https://github.com/JetBrains/ideavim) feel like home.

## Prerequisites

Required plugins from the [JetBrains Marketplace](https://plugins.jetbrains.com):

- [IdeaVim](https://github.com/JetBrains/ideavim) (>= 2.39.0, for `inccommand` support)
- [Which Key Lazy](https://plugins.jetbrains.com/plugin/30446-which-key-lazy)

The configuration uses IdeaVim's bundled Sneak extension, so EasyMotion and
AceJump are not required. Type `s` followed by two characters to jump forward,
or `S` followed by two characters to jump backward.

Which Key Lazy is configured through `~/.whichkey-lazy.json`. The popup waits
450 ms before appearing; `set notimeout` keeps it visible until the mapping is
completed or cancelled.

## Installation

Clone the repository to `~/.config/lazy-idea`:

**Unix/Linux/macOS**

```bash
git clone https://github.com/SergoGansta777/lazy-idea.git ~/.config/lazy-idea
```

**Windows (PowerShell)**

```powershell
git clone https://github.com/SergoGansta777/lazy-idea.git "$HOME/.config/lazy-idea"
```

Run the idempotent installer:

```bash
~/.config/lazy-idea/install.sh
```

It links the tracked IdeaVim entrypoint and Which Key Lazy configuration into
your home directory. Existing files are moved to
`~/.local/state/lazy-idea/backups/<timestamp>` before linking.

Install IdeaVim and Which Key Lazy from the Marketplace, then restart the IDE.
Future configuration changes only require a Git pull and `:source ~/.ideavimrc`.

## Migration to a new computer

```bash
git clone https://github.com/SergoGansta777/lazy-idea.git ~/.config/lazy-idea
~/.config/lazy-idea/install.sh
```

Then install the two required IDE plugins. JetBrains Settings Sync can restore
the plugins automatically; the repository remains the source of truth for
IdeaVim mappings and Which Key Lazy behavior.

The original `cufarvid/lazy-idea` repository remains configured as `upstream`
for selectively incorporating future improvements.

## Maintenance

Run the local compatibility check after updating a JetBrains IDE or changing
mappings:

```bash
~/.config/lazy-idea/check.sh
```

It checks JSON syntax, duplicate mappings, required plugins, and every mapped
JetBrains action against the action registries in the locally installed
GoLand and RustRover versions. It includes both Git file history (`Space g f`)
and JetBrains Local History (`Space g H`).

Configure automatic formatting through
`Settings → Tools → Actions on Save`. JetBrains exposes this as a setting,
not as a stable cross-IDE action, so the configuration does not emulate a
toggle keymap.

To fetch the configured Git remote and report whether the current branch is
ahead or behind its upstream, run:

```bash
~/.config/lazy-idea/check.sh --remote
```

### Which Key Lazy fork

The maintained fork lives at
[`SergoGansta777/which-key-lazy`](https://github.com/SergoGansta777/which-key-lazy).
Its `fix/configurable-popup-behavior` branch implements the configured delay,
row and column limits, and popup placement. Clone it to
`~/.config/which-key-lazy`.

To rebuild and install it into every local GoLand and RustRover version, set
`JAVA_HOME` to JDK 21 and run:

```bash
~/.config/lazy-idea/scripts/install-which-key-lazy-fork.sh
```

Use `--no-build` to reinstall the most recent verified local archive.

## Development

### Notes and Caveats

- Not all mappings have been thoroughly tested
- Potential ctrl key conflicts: 6, b, e, f, h, j, k, l, o, r, s, v, w
  - See [IdeaVim sethandler documentation](https://github.com/JetBrains/ideavim/blob/master/doc/sethandler.md)

### Roadmap

- [x] Improve Todo comments functionality
- [x] Add Which-Key labels for all mappings
- [ ] Test all mappings side-by-side with LazyVim

### Future Considerations

Potential integrations with LazyVim features:

- Flash
- Noice
- Trouble
- Mini.diff
- Harpoon
- Outline
- Markdown Preview

## Issues and Limitations

- Local leader key mappings are not currently supported by IdeaVim
- Some LazyVim features don't have direct equivalents in JetBrains IDEs
- The TODO navigation keymaps (`<leader>st`, `<leader>xt`) use IDEA's built-in TODO tool window. To support additional patterns beyond `TODO` (like `FIX` or `PERF`), configure them in `Settings → Editor → TODO → Patterns`.

## Credits

- [Original gist](https://gist.github.com/mikeslattery/d2f2562e5bbaa7ef036cf9f5a13deff5) by [@mikeslattery](https://github.com/mikeslattery)
- [LazyVim](https://github.com/LazyVim/LazyVim) by [@folke](https://github.com/folke)
