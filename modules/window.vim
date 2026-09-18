" ========================================
" Window Keymaps (<leader>w)
" ========================================

let g:WhichKeyDesc_split_below = "<leader>- Split Window Below"
nmap <leader>- <c-w>s

let g:WhichKeyDesc_split_right = "<leader>| Split Window Right"
nmap <leader><bar> <c-w>v

let g:WhichKeyDesc_window_delete = "<leader>wd Delete Window"
nmap <leader>wd <Action>(Unsplit)

let g:WhichKeyDesc_window_maximize = "<leader>wm Toggle Zoom Mode"
nmap <leader>wm <Action>(MaximizeEditorInSplit)

let g:WhichKeyDesc_window_only = "<leader>wo Close Other Windows"
nmap <leader>wo <Action>(UnsplitAll)

let g:WhichKeyDesc_window_zen = "<leader>wz Toggle Zen Mode"
nmap <leader>wz <Action>(ToggleZenMode)
