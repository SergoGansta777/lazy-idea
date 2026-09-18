" ========================================
" Diagnostics/Quickfix Keymaps (<leader>x)
" ========================================

let g:WhichKeyDesc_location_list = "<leader>xl Problems"
nmap <leader>xl <Action>(ActivateProblemsViewToolWindow)

let g:WhichKeyDesc_quickfix_list = "<leader>xq Problems"
nmap <leader>xq <Action>(ActivateProblemsViewToolWindow)

let g:WhichKeyDesc_quickfix_todo = "<leader>xt TODO Tool Window"
nmap <leader>xt <Action>(ActivateTODOToolWindow)

let g:WhichKeyDesc_quickfix_todo_fixme = "<leader>xT TODO Tool Window"
nmap <leader>xT <Action>(ActivateTODOToolWindow)
