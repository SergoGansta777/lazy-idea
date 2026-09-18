" ========================================
" Git Keymaps (<leader>g)
" ========================================

let g:WhichKeyDesc_git_ui = "<leader>gg Commit / Local Changes"
nmap <leader>gg <Action>(ActivateCommitToolWindow)

let g:WhichKeyDesc_git_blame = "<leader>gb Git Blame Line"
nmap <leader>gb <Action>(Annotate)

let g:WhichKeyDesc_git_hunks = "<leader>gh +hunks"
let g:WhichKeyDesc_git_hunk_preview = "<leader>ghp Preview Hunk"
nmap <leader>ghp <Action>(VcsShowCurrentChangeMarker)

let g:WhichKeyDesc_git_hunk_diff = "<leader>ghd Diff Hunk"
nmap <leader>ghd <Action>(Vcs.ShowDiffChangedLines)

let g:WhichKeyDesc_git_hunk_reset = "<leader>ghr Roll Back Hunk"
nmap <leader>ghr <Action>(Vcs.RollbackChangedLines)

let g:WhichKeyDesc_git_browse = "<leader>gB Git Browse (open)"
nmap <leader>gB <Action>(Vcs.Browse)

let g:WhichKeyDesc_git_file_history = "<leader>gf Git File History"
nmap <leader>gf <Action>(Vcs.ShowTabbedFileHistory)

let g:WhichKeyDesc_git_local_history = "<leader>gH Local File History"
nmap <leader>gH <Action>(LocalHistory.ShowHistory)

let g:WhichKeyDesc_git_log = "<leader>gl Git Log"
nmap <leader>gl <Action>(Vcs.Show.Log)

let g:WhichKeyDesc_git_commits = "<leader>gc Git Log"
nmap <leader>gc <Action>(Vcs.Show.Log)

let g:WhichKeyDesc_git_status = "<leader>gs Git Status"
nmap <leader>gs <Action>(ActivateCommitToolWindow)

let g:WhichKeyDesc_git_explorer = "<leader>ge Git Explorer"
nmap <leader>ge <Action>(ActivateVersionControlToolWindow)
