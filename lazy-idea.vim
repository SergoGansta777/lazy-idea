" ========================================
" Lazy-idea: LazyVim Keybindings for JetBrains IDEs
" ========================================
" https://github.com/cufarvid/lazy-idea
"
" This configuration replicates LazyVim keybindings in JetBrains IDEs
" through IdeaVim, making it feel like home for LazyVim users.
"
" Installation:
"   git clone https://github.com/cufarvid/lazy-idea.git ~/.config/lazy-idea
"
" To track Action-IDs:
"   :action VimFindActionIdAction

" ========================================
" Load Configuration Modules
" ========================================

" Core settings (leader keys, visual settings, Neovim compatibility)
source ~/.config/lazy-idea/modules/settings.vim

" Plugin configurations (commentary, surround, sneak, which-key, text objects)
source ~/.config/lazy-idea/modules/plugins.vim

" Non-leader navigation keymaps (<C-hjkl>, [d, ]d, etc.)
source ~/.config/lazy-idea/modules/navigation.vim

" LSP keymaps (gd, gr, gI, etc.)
source ~/.config/lazy-idea/modules/lsp.vim

" Leader key groups (organized by WhichKey groups)
let g:WhichKeyDesc_leader_b = "<leader>b +editor tabs"
source ~/.config/lazy-idea/modules/buffer.vim

let g:WhichKeyDesc_leader_c = "<leader>c +code"
source ~/.config/lazy-idea/modules/code.vim

let g:WhichKeyDesc_leader_d = "<leader>d +debug"
source ~/.config/lazy-idea/modules/debug.vim

let g:WhichKeyDesc_leader_f = "<leader>f +files"
source ~/.config/lazy-idea/modules/file.vim

let g:WhichKeyDesc_leader_g = "<leader>g +version control"
source ~/.config/lazy-idea/modules/git.vim

let g:WhichKeyDesc_leader_s = "<leader>s +search"
source ~/.config/lazy-idea/modules/search.vim

let g:WhichKeyDesc_leader_t = "<leader>t +run/test"
source ~/.config/lazy-idea/modules/test.vim

let g:WhichKeyDesc_leader_u = "<leader>u +view"
source ~/.config/lazy-idea/modules/ui.vim

let g:WhichKeyDesc_leader_w = "<leader>w +editor splits"
source ~/.config/lazy-idea/modules/window.vim

let g:WhichKeyDesc_leader_x = "<leader>x +problems"
source ~/.config/lazy-idea/modules/diagnostics.vim

let g:WhichKeyDesc_leader_tab = "<leader><tab> +tabs"
source ~/.config/lazy-idea/modules/tabs.vim

" Neovim defaults, smart selection, and misc keymaps
source ~/.config/lazy-idea/modules/defaults.vim
