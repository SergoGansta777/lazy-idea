" ========================================
" Run Keymaps (<leader>r)
" ========================================

let g:WhichKeyDesc_run_last = "<leader>rl Rerun Last Configuration"
nmap <leader>rl <Action>(Rerun)
if g:is_ide_rider | nmap <leader>rl <Action>(RiderUnitTestRunCurrentSessionAction) | endif

let g:WhichKeyDesc_run_output = "<leader>ro Run Tool Window"
nmap <leader>ro <Action>(ActivateRunToolWindow)
if g:is_ide_rider | nmap <leader>ro <Action>(ActivateUnitTestsToolWindow) | endif

let g:WhichKeyDesc_run_current = "<leader>rr Run Current Configuration"
nmap <leader>rr <Action>(Run)

let g:WhichKeyDesc_run_context = "<leader>rc Run Context"
nmap <leader>rc <Action>(ContextRun)
if g:is_ide_rider | nmap <leader>rc <Action>(RiderUnitTestRunContextAction) | endif

let g:WhichKeyDesc_run_stop = "<leader>rs Stop Process"
nmap <leader>rs <Action>(Stop)

let g:WhichKeyDesc_run_file = "<leader>rt Run Current File"
nmap <leader>rt <Action>(RunClass)
if g:is_ide_rider | nmap <leader>rt <Action>(RiderUnitTestRunContextAction) | endif

let g:WhichKeyDesc_run_select = "<leader>rC Select Run Configuration"
nmap <leader>rC <Action>(ChooseRunConfiguration)
if g:is_ide_rider | nmap <leader>rC <Action>(RiderUnitTestRunSolutionAction) | endif

let g:WhichKeyDesc_run_failed = "<leader>rf Rerun Failed Tests"
nmap <leader>rf <Action>(RerunFailedTests)

let g:WhichKeyDesc_run_debug = "<leader>rd Debug Context"
nmap <leader>rd <Action>(ContextDebug)
if g:is_ide_rider | nmap <leader>rd <Action>(RiderUnitTestDebugContextAction) | endif
