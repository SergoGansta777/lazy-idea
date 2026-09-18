" ========================================
" Buffer Keymaps (<leader>b)
" ========================================

let g:WhichKeyDesc_buffer_switch = "<leader>bb Alternate File"
nnoremap <leader>bb <C-^>

let g:WhichKeyDesc_buffer_switch_alt = "<leader>` Alternate File"
nnoremap <leader>` <C-^>

let g:WhichKeyDesc_buffer_delete = "<leader>bd Close Editor"
nmap <leader>bd <Action>(CloseContent)

let g:WhichKeyDesc_buffer_delete_window = "<leader>bD Close Editor"
nmap <leader>bD <Action>(CloseContent)

let g:WhichKeyDesc_buffer_delete_others = "<leader>bo Close Other Editors"
nmap <leader>bo <Action>(CloseAllEditorsButActive)

let g:WhichKeyDesc_buffer_delete_clean = "<leader>bc Close Unmodified Editors"
nmap <leader>bc <Action>(CloseAllUnmodifiedEditors)

let g:WhichKeyDesc_buffer_left = "<leader>bl Close Editors to the Left"
nmap <leader>bl <Action>(CloseAllToTheLeft)

let g:WhichKeyDesc_buffer_pin = "<leader>bp Pin/Unpin Editor Tab"
nmap <leader>bp <Action>(PinActiveTabToggle)

let g:WhichKeyDesc_buffer_pin_delete = "<leader>bP Close Unpinned Editors"
nmap <leader>bP <Action>(CloseAllUnpinnedEditors)

let g:WhichKeyDesc_buffer_right = "<leader>br Close Editors to the Right"
nmap <leader>br <Action>(CloseAllToTheRight)

let g:WhichKeyDesc_buffer_reopen = "<leader>bR Reopen Closed Tab"
nmap <leader>bR <Action>(ReopenClosedTab)

let g:WhichKeyDesc_buffer_explorer = "<leader>be Switcher"
nmap <leader>be <Action>(Switcher)
