call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'shougo/deoplete.nvim'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'chaoren/vim-wordmotion'
Plug 'lukaszkorecki/CoffeeTags'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
"" COLORS
Plug 'jnurmine/zenburn'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
"" WRITING MODE
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-colors-pencil'

Plug 'andrewradev/switch.vim'


Plug 'vimoutliner/vimoutliner'

call plug#end()

" enable deoplete
let g:deoplete#enable_at_startup = 1

syntax on " activate syntax highlighting for various files (used on conjunction w/ vim-polyglot)
filetype plugin indent on

" Hide default mode marker + stuff
set laststatus=2
set noshowmode
set showtabline=2 " Show buffers in top bar

set number " always show line numbers
set timeoutlen=1000 ttimeoutlen=0 " decrease the lag when entering normal mode

" Automatically read file when updated unless buffer has unsaved changes
set autoread

" yank into paste from system clipboard
"set clipboard=unnamed

" Indentation-related
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set smarttab

au FileType python setl sw=2 sts=2 ts=2 et
au FileType coffee setl sw=2 sts=2 ts=2 et
au FileType javascript setl sw=2 sts=2 ts=2 et
au FileType javascript set sw=2 sts=2 ts=2 et
au FileType ruby setl sw=2 sts=2 ts=2 et
au FileType stylus setl sw=2 sts=2 ts=2 et
au FileType yml setl sw=2 sts=2 ts=2 et
au FileType cs setl sw=4 sts=4 ts=4 et
au FileType pug setl sw=2 sts=2 ts=2 et

" Use monokai theme from https://github.com/sickill/vim-monokai
"colorscheme monokai

"colorscheme gruvbox
"let g:gruvbox_contrast_dark='hard'
"set background=dark

"colorscheme zenburn
"set t_Co=256

colorscheme badwolf
function! s:goyo_enter()
    colorscheme pencil
    set background=dark
endfunction

function! s:goyo_leave()
    colorscheme badwolf
    set background&
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Ack/Ag integration
let g:ackprg = 'ag --nogroup --nocolor --column' " mapping to use silver surfer from ack
set shellpipe=> " hide ag terminal overflow

" Ctrl P
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"let g:ctrlp_user_command = 'rg %s -S -l --files -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Give backspace more power
set backspace=indent,eol,start

" Swap, backup, and undo
set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/swap//
set undofile
set undodir=~/.vim/undo
set undolevels=5000

" remap arrow keys
 nnoremap <Left> :bprev<CR>
 nnoremap <Right> :bnext<CR>

""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
highlight Search ctermbg=yellow
highlight Search ctermfg=black
nnoremap <leader><space> :nohlsearch<CR>

""
"" Toggling (switch.vim)
""
let g:switch_mapping = "-"
let g:switch_reverse_mapping = '0'
let g:switch_custom_definitions =
    \ [
    \   ['it', 'it\.only']
    \ ]

""
"" Command auto-completion
""
set wildmenu
set wildmode=full
" auto complete dictionary words
set spell
set complete+=kspell

""
"" CoffeeScript
""
"let g:coffee_linter = '/Users/themikejr/Development/repos/eFlex/webApp/node_modules.coffeelint/bin/coffeelint'
"let g:coffee_lint_options = '-f coffeelint.json'

""
"" User-defined Commands and Customizations
""
command! C bp|bd # "close current buffer without closing window

autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close vim if NerdTree is all that's left.
autocmd BufNewFile,BufRead *.coffee setlocal makeprg=cd\ ~/Development/repos/eFlex\ &&\ webApp/node_modules/coffeelint/bin/coffeelint\ -f\ coffeelint.json\ %
"autocmd! BufWritePost *coffee make
noremap <c-p> :FZF<CR>
noremap ; :Buffers<CR>
noremap ' :Ag<CR>

let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

"" autosave / autoread
set autoread

augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END
