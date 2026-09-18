" ========================================
" Tab Management Keymaps (<leader><tab>)
" ========================================
" JetBrains editor tabs are the closest native equivalent to Vim tab pages.

let g:WhichKeyDesc_tab_last = "<leader><tab>l Last Tab"
nmap <leader><tab>l <Action>(GoToLastTab)

let g:WhichKeyDesc_tab_close_others = "<leader><tab>o Close Other Tabs"
nmap <leader><tab>o <Action>(CloseAllEditorsButActive)

let g:WhichKeyDesc_tab_first = "<leader><tab>f First Tab"
nmap <leader><tab>f <Action>(GoToTab1)

let g:WhichKeyDesc_tab_new = "<leader><tab><tab> New Tab"
nmap <leader><tab><tab> <Action>(NewElementSamePlace)

let g:WhichKeyDesc_tab_next = "<leader><tab>] Next Tab"
nmap <leader><tab>] <Action>(NextTab)

let g:WhichKeyDesc_tab_previous = "<leader><tab>[ Previous Tab"
nmap <leader><tab>[ <Action>(PreviousTab)

let g:WhichKeyDesc_tab_close = "<leader><tab>d Close Tab"
nmap <leader><tab>d <Action>(CloseContent)
