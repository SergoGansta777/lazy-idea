" ========================================
" Search Keymaps (<leader>s)
" ========================================

let g:WhichKeyDesc_search_registers = '<leader>s" Registers'
nmap <leader>s" :registers<cr>

let g:WhichKeyDesc_search_buffer = "<leader>sb Switcher"
nmap <leader>sb <Action>(Switcher)

let g:WhichKeyDesc_search_command_history = "<leader>sc Command History"
nmap <leader>sc :history<cr>

let g:WhichKeyDesc_search_commands = "<leader>sC Find Action"
nmap <leader>sC <Action>(GotoAction)

let g:WhichKeyDesc_search_everywhere = "<leader>se Search Everywhere"
nmap <leader>se <Action>(SearchEverywhere)

let g:WhichKeyDesc_search_diagnostics = "<leader>sd Problems"
nmap <leader>sd <Action>(ActivateProblemsViewToolWindow)

let g:WhichKeyDesc_search_diagnostics_workspace = "<leader>sD Problems"
nmap <leader>sD <Action>(ActivateProblemsViewToolWindow)

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

let g:WhichKeyDesc_search_location_list = "<leader>sl Problems"
nmap <leader>sl <Action>(ActivateProblemsViewToolWindow)

let g:WhichKeyDesc_search_marks = "<leader>sm Marks"
nmap <leader>sm :marks<cr>

let g:WhichKeyDesc_search_man = "<leader>sM Quick Documentation"
nmap <leader>sM <Action>(ShowHoverInfo)

let g:WhichKeyDesc_search_notifications = "<leader>sn +Notifications"
let g:WhichKeyDesc_search_notifications_all = "<leader>sna All"
nmap <leader>sna <Action>(ActivateNotificationsToolWindow)

let g:WhichKeyDesc_search_notifications_dismiss = "<leader>snd Dismiss All"
nmap <leader>snd <Action>(ClearAllNotifications)

let g:WhichKeyDesc_search_notifications_history = "<leader>snh History"
nmap <leader>snh <Action>(ActivateNotificationsToolWindow)

let g:WhichKeyDesc_search_options = "<leader>so Settings"
nmap <leader>so <Action>(ShowSettings)

let g:WhichKeyDesc_search_quickfix = "<leader>sq Problems"
nmap <leader>sq <Action>(ActivateProblemsViewToolWindow)

let g:WhichKeyDesc_search_resume = "<leader>sR Find in Files"
nmap <leader>sR <Action>(FindInPath)

let g:WhichKeyDesc_search_symbol = "<leader>ss File Structure"
nmap <leader>ss <Action>(FileStructurePopup)

let g:WhichKeyDesc_search_symbol_workspace = "<leader>sS Go to Symbol in Project"
nmap <leader>sS <Action>(GotoSymbol)

let g:WhichKeyDesc_search_todo = "<leader>st TODO Tool Window"
nmap <leader>st <Action>(ActivateTODOToolWindow)

let g:WhichKeyDesc_search_todo_fixme = "<leader>sT TODO Tool Window"
nmap <leader>sT <Action>(ActivateTODOToolWindow)

let g:WhichKeyDesc_search_word = "<leader>sw Find Word in Files"
nmap <leader>sw mzviw<Action>(FindInPath)<esc>`z
vmap <leader>sw <Action>(FindInPath)
