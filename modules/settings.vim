" ========================================
" LazyVim Default Settings
" ========================================
" https://www.lazyvim.org/configuration/general

let mapleader=" "
let maplocalleader="\\"

" IDE detection (used by modules with IDE-specific mappings)
let g:is_ide_rider = &ide == 'JetBrains Rider'

set formatoptions=jcroqlnt
" Print line number
set number
" Relative line numbers
set relativenumber
" Lines of context
set scrolloff=4
" Highlight matches with last search pattern
set hlsearch
" Show where search pattern typed so far matches
set incsearch
" Preview substitutions live as you type (requires IdeaVim >= 2.39.0)
set inccommand=nosplit

" IdeaVim persists the last search across IDE restarts. Keep hlsearch useful
" after an intentional search, but never restore stale highlights on a file.
augroup lazy_idea_search
  autocmd!
  autocmd BufEnter * nohlsearch
augroup END
" Ignore case in search patterns
set ignorecase
" Override ignorecase if search pattern has uppercase
set smartcase
" Round indent
set shiftround
" Columns of context
set sidescrolloff=8
" Keep unfinished leader sequences active so Which-Key stays visible.
" Its appearance delay is configured independently below.
set notimeout
set undolevels=10000
" Disable line wrap
set nowrap
" Enable copy/paste to/from system keyboard
set clipboard+=unnamedplus
set clipboard+=ideaput

" Prefer JetBrains' structural editing behavior where it is stronger.
set ideajoin
set ideamarks
set idearefactormode=keep

" Which Key Lazy reads its 300 ms popup delay and appearance settings from
" ~/.whichkey-lazy.json. 'notimeout' above keeps the sequence active.

" ========================================
" Neovim Compatibility Settings
" ========================================
" https://neovim.io/doc/user/vim_diff.html#_default-mappings
" https://github.com/mikeslattery/nvim-defaults.vim/blob/main/plugin/.vimrc

set backspace=indent,eol,start
set listchars=tab:>\ ,trail:-,nbsp:+
set shortmess=filnxtToOF
