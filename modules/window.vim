" ========================================
" Window Keymaps (<leader>w)
" ========================================

let g:WhichKeyDesc_split_below = "<leader>- Split Editor Below"
nmap <leader>- <c-w>s

let g:WhichKeyDesc_split_right = "<leader>| Split Editor Right"
nmap <leader><bar> <c-w>v

let g:WhichKeyDesc_window_delete = "<leader>wd Close Split"
nmap <leader>wd <Action>(Unsplit)

let g:WhichKeyDesc_window_maximize = "<leader>wm Maximize Editor Split"
nmap <leader>wm <Action>(MaximizeEditorInSplit)

let g:WhichKeyDesc_window_only = "<leader>wo Close Other Splits"
nmap <leader>wo <Action>(UnsplitAll)
