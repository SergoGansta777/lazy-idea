" ========================================
" Plugin Configurations
" ========================================
" https://github.com/JetBrains/ideavim/wiki/IdeaVim-Plugins
" https://www.lazyvim.org/plugins

" Commentary - gcc and gc<action> mappings
set commentary
let g:WhichKeyDesc_comment = "gc +Toggle Comment"
let g:WhichKeyDesc_comment_line = "gcc Toggle Comment Line"
let g:WhichKeyDesc_comment_below = "gco Add Comment Below"
nmap gco o<c-o>gcc

let g:WhichKeyDesc_comment_above = "gcO Add Comment Above"
nmap gcO O<c-o>gcc

" Surround - Emulate LazyVim mini.surround mappings
set surround
let g:surround_no_mappings = 1
let g:WhichKeyDesc_surround = "gs +surround"
let g:WhichKeyDesc_surround_add = "gsa Add Surrounding"
nmap gsa <Plug>YSurround
xmap gsa <Plug>VSurround

let g:WhichKeyDesc_surround_delete = "gsd Delete Surrounding"
nmap gsd <Plug>DSurround

let g:WhichKeyDesc_surround_replace = "gsr Replace Surrounding"
nmap gsr <Plug>CSurround

" Sneak - bundled with IdeaVim and consistent in every JetBrains IDE.
" Use s{char}{char}, S{char}{char}, then ;/, to repeat.
set sneak
let g:WhichKeyDesc_sneak = "s Sneak Forward"
let g:WhichKeyDesc_sneak_back = "S Sneak Backward"

" NERDTree - File Explorer (as a substitute for NeoTree)
set NERDTree
let g:NERDTreeMapActivateNode = "l"
let g:NERDTreeMapNewFile = "a"
let g:NERDTreeMapNewDir = "A"
let g:NERDTreeMapOpenSplit = "S"
let g:NERDTreeMapPreviewSplit = "gS"
let g:NERDTreeMapOpenVSplit = "s"
let g:NERDTreeMapPreviewVSplit = "gs"
let g:NERDTreeMapCloseDir = "h"
let g:NERDTreeMapCloseChildren = "z"

" Which-Key - Key binding hints
set which-key

" matchit - Extended matching
set matchit

" highlightedyank - Highlights the yanked region
set highlightedyank

" Navigate by indentation levels: [-/]- lesser, [+/]+ greater, [=/]= equal.
set indentwise

" JetBrains PSI-aware text objects (IdeaVim 2.36+).
" am/aM/im select a method or function; ac selects a class/type definition.
set functextobj
set classtextobj

" Function-oriented aliases for Go/Rust and modern Neovim conventions.
" Keep the native method-oriented am/im mappings available as well.
let g:WhichKeyDesc_textobj_function_a = "af function"
xmap af am
omap af am

let g:WhichKeyDesc_textobj_function_i = "if inner function"
xmap if im
omap if im

" Current-line objects: al includes whitespace, il selects its content.
set textobj-line

" crs/crc/crm/cru convert identifiers between common naming styles.
set abolish

" cx{motion}, cxx and X exchange two regions without using registers.
set exchange

" Tab/S-Tab navigate JetBrains completion while its popup is visible.
set youcompleteme

" Vim-aware multiple carets. Keep Alt-n/Alt-p available for reference
" navigation and use the original plugin's Ctrl mappings.
let g:multi_cursor_use_default_mapping = 0
set multiple-cursors
nmap <C-n> <Plug>NextWholeOccurrence
xmap <C-n> <Plug>NextWholeOccurrence
nmap g<C-n> <Plug>NextOccurrence
xmap g<C-n> <Plug>NextOccurrence
xmap <C-x> <Plug>SkipOccurrence
xmap <C-p> <Plug>RemoveOccurrence

" textobj-indent - Indent text objects (ai, ii, aI, iI)
set textobj-indent
" Remap ai to behave like aI to match LazyVim behavior
" (LazyVim's vai includes closing lines)
let g:WhichKeyDesc_textobj_indent = "ai indent"
xmap ai <Plug>textobj-indent-aI
omap ai <Plug>textobj-indent-aI

" textobj-entire - Entire file text objects (ag, ig)
set textobj-entire
let g:WhichKeyDesc_textobj_a_entire = "ag entire file"
xmap ag <Plug>textobj-entire-a
omap ag <Plug>textobj-entire-a

let g:WhichKeyDesc_textobj_i_entire = "ig entire file"
xmap ig <Plug>textobj-entire-i
omap ig <Plug>textobj-entire-i

" mini-ai - Extended text objects for quotes and blocks
set mini-ai
let g:WhichKeyDesc_textobj_aq = "aq `\"' quote"
let g:WhichKeyDesc_textobj_iq = "iq `\"' quote"
let g:WhichKeyDesc_textobj_ab = "ab )]} block"
let g:WhichKeyDesc_textobj_ib = "ib )]} block"
