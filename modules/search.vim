" ========================================
" Search Keymaps (<leader>s)
" ========================================

let g:WhichKeyDesc_search_registers = '<leader>s" Registers'
nmap <leader>s" :registers<cr>

let g:WhichKeyDesc_search_command_history = "<leader>sc Command History"
nmap <leader>sc :history<cr>

let g:WhichKeyDesc_search_commands = "<leader>sC Find Action"
nmap <leader>sC <Action>(GotoAction)

let g:WhichKeyDesc_search_everywhere = "<leader>se Search Everywhere"
nmap <leader>se <Action>(SearchEverywhere)

let g:WhichKeyDesc_search_grep = "<leader>sg Find in Files"
nmap <leader>sg <Action>(FindInPath)

let g:WhichKeyDesc_search_help = "<leader>sh Help Topics"
nmap <leader>sh <Action>(HelpTopics)

let g:WhichKeyDesc_search_highlights = "<leader>sH Highlight Usages"
nmap <leader>sH <Action>(HighlightUsagesInFile)

let g:WhichKeyDesc_search_jumps = "<leader>sj Recent Locations"
nmap <leader>sj <Action>(RecentLocations)

let g:WhichKeyDesc_search_keymaps = "<leader>sk Vim Mappings"
nmap <leader>sk :map<cr>

let g:WhichKeyDesc_search_marks = "<leader>sm Marks"
nmap <leader>sm :marks<cr>

let g:WhichKeyDesc_search_notifications = "<leader>sn +Notifications"
let g:WhichKeyDesc_search_notifications_all = "<leader>sna All"
nmap <leader>sna <Action>(ActivateNotificationsToolWindow)

let g:WhichKeyDesc_search_notifications_dismiss = "<leader>snd Dismiss All"
nmap <leader>snd <Action>(ClearAllNotifications)

let g:WhichKeyDesc_search_notifications_history = "<leader>snh History"
nmap <leader>snh <Action>(ActivateNotificationsToolWindow)

let g:WhichKeyDesc_search_options = "<leader>so Settings"
nmap <leader>so :action ShowSettings<CR>

let g:WhichKeyDesc_search_symbol_workspace = "<leader>sS Go to Symbol in Project"
nmap <leader>sS <Action>(GotoSymbol)

let g:WhichKeyDesc_search_word = "<leader>sw Find Word in Files"
nmap <leader>sw mzviw<Action>(FindInPath)<esc>`z
vmap <leader>sw <Action>(FindInPath)
