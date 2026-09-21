" ========================================
" Debug Keymaps (<leader>d)
" ========================================

let g:WhichKeyDesc_debug_breakpoint = "<leader>db Toggle Breakpoint"
nmap <leader>db <Action>(ToggleLineBreakpoint)

let g:WhichKeyDesc_debug_breakpoint_condition = "<leader>dB Breakpoint Condition"
nmap <leader>dB <Action>(AddConditionalBreakpoint)

let g:WhichKeyDesc_debug_continue = "<leader>dc Resume Program"
nmap <leader>dc <Action>(Resume)

let g:WhichKeyDesc_debug_cursor = "<leader>dC Run to Cursor"
nmap <leader>dC <Action>(ForceRunToCursor)

let g:WhichKeyDesc_debug_step_into = "<leader>di Step Into"
nmap <leader>di <Action>(StepInto)

let g:WhichKeyDesc_debug_last = "<leader>dl Debug Current Configuration"
nmap <leader>dl <Action>(Debug)

let g:WhichKeyDesc_debug_step_out = "<leader>do Step Out"
nmap <leader>do <Action>(StepOut)

let g:WhichKeyDesc_debug_step_over = "<leader>dO Step Over"
nmap <leader>dO <Action>(StepOver)

let g:WhichKeyDesc_debug_pause = "<leader>dP Pause"
nmap <leader>dP <Action>(Pause)

let g:WhichKeyDesc_debug_repl = "<leader>dr Debug Tool Window"
nmap <leader>dr <Action>(ActivateDebugToolWindow)

let g:WhichKeyDesc_debug_terminate = "<leader>dt Stop Debugging"
nmap <leader>dt <Action>(Stop)

let g:WhichKeyDesc_debug_breakpoints = "<leader>dw Breakpoints"
nmap <leader>dw <Action>(ViewBreakpoints)

let g:WhichKeyDesc_debug_eval = "<leader>de Evaluate Expression"
nmap <leader>de <Action>(EvaluateExpression)
vmap <leader>de <Action>(EvaluateExpression)
