" ========================================
" UI Keymaps (<leader>u)
" ========================================

let g:WhichKeyDesc_redraw_clear = "<leader>ur Clear Search Highlight"
nmap <leader>ur :nohlsearch<CR>

let g:WhichKeyDesc_ui_inspections = "<leader>us Inspection Settings"
nmap <leader>us <Action>(EditInspectionSettings)

let g:WhichKeyDesc_ui_wrap = "<leader>uw Toggle Wrap"
nmap <leader>uw :setlocal wrap!<CR>

let g:WhichKeyDesc_ui_relative_number = "<leader>uL Toggle Relative Number"
nmap <leader>uL :set relativenumber!<CR>

let g:WhichKeyDesc_ui_line_numbers = "<leader>ul Toggle Line Numbers"
nmap <leader>ul :set number!<CR>

let g:WhichKeyDesc_ui_sticky_lines = "<leader>uc Toggle Sticky Lines"
nmap <leader>uc <Action>(EditorGutterToggleGlobalStickyLines)

let g:WhichKeyDesc_ui_inlay_hints = "<leader>uh Toggle Inlay Hints"
nmap <leader>uh <Action>(ToggleInlayHintsGloballyAction)

let g:WhichKeyDesc_inspect_pos = "<leader>ui Structure Tool Window"
nmap <leader>ui <Action>(ActivateStructureToolWindow)

let g:WhichKeyDesc_ui_colorscheme = "<leader>uC Switch Theme"
nmap <leader>uC <Action>(QuickChangeScheme)

let g:WhichKeyDesc_ui_zen = "<leader>uz Toggle Zen Mode"
nmap <leader>uz <Action>(ToggleZenMode)
