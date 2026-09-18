" ========================================
" LSP Keymaps (gd, gr, gI, etc.)
" ========================================

" ========================================
" Code Navigation
" ========================================

let g:WhichKeyDesc_goto_definition = "gd Go to Definition"
nmap gd <Action>(GotoDeclaration)

let g:WhichKeyDesc_references = "gr References"
nmap gr <Action>(FindUsages)

let g:WhichKeyDesc_goto_implementation = "gI Go to Implementation"
nmap gI <Action>(GotoImplementation)

let g:WhichKeyDesc_goto_type = "gy Go to Type Definition"
nmap gy <Action>(GotoTypeDeclaration)

let g:WhichKeyDesc_goto_declaration = "gD Go to Declaration"
nmap gD <Action>(GotoDeclarationOnly)

let g:WhichKeyDesc_hover = "K Quick Documentation"
nmap K <Action>(ShowHoverInfo)

let g:WhichKeyDesc_signature_help = "gK Signature Help"
nmap gK <Action>(ParameterInfo)

let g:WhichKeyDesc_signature_help_alt = "<C-k> Signature Help"
imap <C-k> <C-o><Action>(ParameterInfo)

" ========================================
" Reference Navigation
" ========================================

let g:WhichKeyDesc_reference_next = "]] Next Reference"
nmap ]] <Action>(GotoNextElementUnderCaretUsage)

let g:WhichKeyDesc_reference_prev = "[[ Prev Reference"
nmap [[ <Action>(GotoPrevElementUnderCaretUsage)

let g:WhichKeyDesc_reference_next_alt = "<A-n> Next Reference"
nmap <a-n> <Action>(GotoNextElementUnderCaretUsage)

let g:WhichKeyDesc_reference_prev_alt = "<A-p> Prev Reference"
nmap <a-p> <Action>(GotoPrevElementUnderCaretUsage)
