" ========================================
" Code Keymaps (<leader>c)
" ========================================

let g:WhichKeyDesc_code_action = "<leader>ca Refactor This"
nmap <leader>ca <Action>(RefactoringMenu)
vmap <leader>ca <Action>(RefactoringMenu)

let g:WhichKeyDesc_source_action = "<leader>cA Show Context Actions"
nmap <leader>cA <Action>(ShowIntentionActions)

let g:WhichKeyDesc_rename = "<leader>cr Rename Symbol"
nmap <leader>cr <Action>(RenameElement)

let g:WhichKeyDesc_rename_file = "<leader>cR Rename File"
nmap <leader>cR <Action>(RenameFile)
if g:is_ide_rider | nmap <leader>cR <Action>(RiderRenameFile) | endif

let g:WhichKeyDesc_format = "<leader>cf Reformat Code"
nmap <leader>cf <Action>(ReformatCode)
vmap <leader>cf <Action>(ReformatCode)

let g:WhichKeyDesc_optimize_imports = "<leader>co Optimize Imports"
nmap <leader>co <Action>(OptimizeImports)

let g:WhichKeyDesc_diagnostics_line = "<leader>cd Error Description"
nmap <leader>cd <Action>(ShowErrorDescription)

let g:WhichKeyDesc_code_structure = "<leader>cl File Structure"
nmap <leader>cl <Action>(FileStructurePopup)

let g:WhichKeyDesc_code_complete = "<leader>cc Complete Statement"
nmap <leader>cc <Action>(EditorCompleteStatement)

let g:WhichKeyDesc_extract_method = "<leader>ce Extract Method"
nmap <leader>ce <Action>(ExtractMethod)
vmap <leader>ce <Action>(ExtractMethod)

let g:WhichKeyDesc_inline = "<leader>ci Inline"
nmap <leader>ci <Action>(Inline)

let g:WhichKeyDesc_move = "<leader>cm Move"
nmap <leader>cm <Action>(Move)

let g:WhichKeyDesc_introduce_variable = "<leader>cv Introduce Variable"
nmap <leader>cv <Action>(IntroduceVariable)
vmap <leader>cv <Action>(IntroduceVariable)

let g:WhichKeyDesc_safe_delete = "<leader>cx Safe Delete"
nmap <leader>cx <Action>(SafeDelete)
