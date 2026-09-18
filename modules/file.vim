" ========================================
" File/Find Keymaps (<leader>f)
" ========================================

let g:WhichKeyDesc_find_buffers = "<leader>fb Switcher"
nmap <leader>fb <Action>(Switcher)

let g:WhichKeyDesc_find_config = "<leader>fc Edit IdeaVim Config"
nmap <leader>fc :edit ~/.config/lazy-idea/lazy-idea.vim<cr>

let g:WhichKeyDesc_find_files_alt = "<leader>ff Go to File"
nmap <leader>ff <Action>(GotoFile)

let g:WhichKeyDesc_find_recent = "<leader>fr Recent Files"
nmap <leader>fr <Action>(RecentFiles)

let g:WhichKeyDesc_file_new = "<leader>fn New Element"
nmap <leader>fn <Action>(NewElementSamePlace)

let g:WhichKeyDesc_explorer_alt = "<leader>fe Project Tool Window"
nmap <leader>fe <Action>(ActivateProjectToolWindow)

let g:WhichKeyDesc_explorer_cwd_alt = "<leader>fE Select in Project View"
nmap <leader>fE <Action>(SelectInProjectView)

let g:WhichKeyDesc_terminal = "<leader>ft Terminal"
nmap <leader>ft <Action>(ActivateTerminalToolWindow)
