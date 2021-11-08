call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'chaoren/vim-wordmotion'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'raimondi/delimitmate'
Plug 'janko-m/vim-test'
Plug 'ap/vim-css-color'
Plug 'sbdchd/neoformat'
Plug 'chrisbra/unicode.vim'

"" LANGUAGES
Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
Plug 'lukaszkorecki/CoffeeTags'
"Plug 'fishbullet/deoplete-ruby'
Plug 'tpope/rbenv-ctags'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'pearofducks/ansible-vim'
"Plug 'quramy/tsuquyomi'
"Plug 'leafgarland/typescript-vim'
"Plug 'prettier/vim-prettier', { 'do': 'npm install' }
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/spellsitter.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Python
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'tell-k/vim-autopep8'

" C#
Plug 'OmniSharp/omnisharp-vim'

"" COLORS
Plug 'jnurmine/zenburn'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
"
"" WRITING MODE
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'vimoutliner/vimoutliner'

call plug#end()

set rtp+=/usr/local/opt/fzf

:lua << EOF
    require('lsp_config')
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" enable deoplete
"let g:deoplete#enable_at_startup = 1

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
au FileType ts setl sw=2 sts=2 ts=2 et
au FileType typescript setl sw=2 sts=2 ts=2 et
au FileType typescript.tsx setl sw=2 sts=2 ts=2 et
"au Filetype gitcommit setl textwidth=72

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

" Wrapping shouldn't break words
set linebreak

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
"" Command auto-completion
""
set wildmenu
set wildmode=full
" auto complete dictionary words
set spell
set complete+=kspell

""
"" User-defined Commands and Customizations
""
command! C bp|bd # "close current buffer without closing window
command! FormatJson :%!python -m json.tool
command! FormatXml :%!xmllint --format -
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close vim if NerdTree is all that's left.
autocmd BufNewFile,BufRead *.coffee setlocal makeprg=cd\ ~/Development/repos/eFlex\ &&\ webApp/node_modules/coffeelint/bin/coffeelint\ -f\ coffeelint.json\ %
autocmd BufWritePost * ALEFix
noremap <c-p> :FZF<CR>
noremap ; :Buffers<CR>
noremap ' :Ag<CR>
nnoremap <S-Right> <c-w>l
nnoremap <S-Left> <c-w>h
nnoremap <S-Up> <c-w>k
nnoremap <S-Down> <c-w>j
nnoremap <leader>] <C-]>
nnoremap <leader>[ <C-o>

""
"" NEO Format
""
let g:autopep8_disable_show_diff=1

let g:neoformat_typescriptreact_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'typescript', '--config', './.prettierrc'],
        \ 'stdin': 1
        \ }
let g:neoformat_enabled_typescriptreact = ['tsfmt', 'prettier']

nnoremap <leader>p :Neoformat prettier<CR>
autocmd FileType python nnoremap <leader>p :Autopep8<CR>
autocmd FileType cs nnoremap <leader>p :!dotnet format --include %<CR>
autocmd BufWritePre *.js,*.ts,*.tsx,*.jsx Neoformat

""
"" Vim-Test
""
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
let test#strategy = "neovim"

"let test#ruby#minitest#file_pattern = 'test_.*\.rb'
"let g:test#ruby#minitest#executable = '/Users/mtb000/.rvm/rubies/jruby-9.1.13.0/bin/ruby'

""
"" Tags for Ruby
""
set tags+=.tags
nnoremap <leader>ct :silent ! ctags -R --languages=ruby --exclude=.git --exclude=log -f tags<cr>

let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

"" autosave / autoread
set autoread

augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END

"" ALE
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}

let g:ale_fix_on_save = 1

"" VIM-PRETTIER
"let g:prettier#exec_cmd_async = 1
"let g:prettier#autoformat_config_present = 1
"let g:prettier#quickfix_enabled = 0

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" console.log inserter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <Leader>L "ayiwOconsole.log('<C-R>a:', <C-R>a);<Esc>
"xnoremap <Leader>L "ayOconsole.log('<C-R>a:', <C-R>a);<Esc>
"nnoremap gll oconsole.log("LINE: =line('.')","")F"i

" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
