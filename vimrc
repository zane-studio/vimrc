" vundle setup {{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'fatih/vim-go'
  Plugin 'Quramy/vim-js-pretty-template'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'vim-syntastic/syntastic'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'NLKNguyen/papercolor-theme'
  Plugin 'tomasiser/vim-code-dark'
call vundle#end()

filetype plugin indent on
" }}

" Basic settings {{
set nospell
set nu

if has("gui")
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
  set guioptions-=T
endif

set relativenumber
set ffs=unix,dos,mac
set hlsearch
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set fileformats=unix,dos,mac
set linespace=0             " No extra spaces between rows
set showmatch               " Show matching brackets/parenthesis
set confirm                 " Confirm before vim exit
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif
set nobackup
set noswapfile
set nowritebackup
set iskeyword-=_,.,=,-,:,
set foldmethod=indent
set tabstop=4
set guifont=Monaco:h12
set autoread
set wildignore=*.o,*~,*.pyc,*.swp,*.bak,*.class
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif
set lazyredraw      " don't update the display while executing macros
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set wildmenu
set copyindent
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,>h,[,]   " Backspace and cursor keys wrap too
if !&scrolloff
  set scrolloff=1           " Minimum lines to keep above and below cursor
endif
if !&sidescrolloff
  set scrolloff=5
endif
set display+=lastline
set nowrap      " Do not wrap long lines
set backspace=eol,start,indent
if has('syntax')
  syntax enable
endif
" set textwidth=80
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
set colorcolumn=+1
set autoindent
set smartindent
set tabstop=4 " tabs are at proper location
set expandtab " don't use actual tab character
set shiftwidth=4 " indenting is 4 spaces
set cindent " stricter rules for c programs
set smarttab
set ruler
if has("gui_macvim")            "autocmd GUIEnter * set fullscreen
  set fuoptions=maxvert,maxhorz
endif

set cursorline
highlight CursorLine term=reverse

set autochdir
set laststatus=2  " always show statusline
set showtabline=2 " always show tabline
set hidden
" enables filetype based indentation
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
set noerrorbells novisualbell t_vb=
set autowrite
set autowriteall "Auto-write all file changes
" autocompletion with dictionary help
set dictionary+=/usr/share/dict/words
set dictionary+=~/.vim/dict/
set statusline+=%*
set statusline+=%#warningmsg#
filetype on
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set showmode                        " Display current mode
set showcmd                         " Show partial commands in status line and
                                  " Selected characters/lines in visual mode
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore " used with caution of breaking plugins
set completeopt=menuone,menu,preview,longest
set tags=./tags;/,~/.vimtags
" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
  let &tags = &tags . ',' . gitroot . '/.git/tags'
endif
set background=dark
" colorscheme codedark
" colorscheme solarized
colorscheme PaperColor
set t_Co=256
set nofoldenable                  " Auto fold code
set foldlevel=1
set foldlevelstart=99
set nomodeline                  " disable mode lines (security measure)
" allow mouse select and etc operation
set mouse=a
set history=1000
" no annoying sound on errors
set timeoutlen=500
set formatoptions+=t
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment chars when join comment lines
endif
set formatoptions-=l " wrap long lines
set wrapmargin=2 " 2 chars wrap margin from the right window border, hard wrap
set nolist
syntax on
" }}

" autocmd {{
autocmd! GUIEnter * set vb t_vb= " disable bell
" }}

" Mappings {{
let mapleader=','
map <C-w>1 :only<CR>
" }}

" plugin setting {{
" nerdtree
map <C-b> :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
" }}
