set nocompatible	     " Disable compatibility to old-time vi
set showmatch		     " Show matching brackets
set ignorecase		     " Do case insensitive matching
set mouse=v		         " middle-click paste with mouse
set hlsearch		     " highlight search results
set tabstop=4		     " number of columns occupied by a tab character
set softtabstop=4	     " see multiple spaces as tab stops <BS> does the right thing
set expandtab            " converts tabs to white space
set shiftwidth=4         " width for auto indents
set autoindent           " indent a new line the same amount as the line just typed
set number               " add line numbers
set wildmode=longest,list    " get bash-like tab completions
set cc=80                    " set an 80 column border for good coding style
set nowritebackup
set noswapfile
set nobackup
set cursorline               " hightline cursor line
" set cursorcolumn

" set leader
let mapleader = ','

" toggle spelling
nnoremap <leader>s :set invspell<CR> 

" color scheme
let g:solarized_use16 = 1
set background=dark
colorscheme solarized8

" file type
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'     " let Vundle manage Vundle, required
Plugin 'vim-syntastic/syntastic'  " syntax checking
Plugin 'airblade/vim-gitgutter'   " vim gitgutter
Plugin 'scrooloose/nerdtree'      " nerdtree
Plugin 'Valloric/YouCompleteMe'   " complete
Plugin 'itchyny/lightline.vim'    " light status line
Plugin 'terryma/vim-multiple-cursors'  " multiple cursors
Plugin 'editorconfig/editorconfig-vim'  " editor config
Plugin 'mxw/vim-jsx'                    " jsx
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'styled-components/vim-styled-components'

Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'        " js
Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'Quramy/vim-dtsm'
Plugin 'mhartington/vim-typings'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on  " allows auto-indenting depending on file type

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_exe = 'python3 -m pylint3'

" nerdtree 
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
" The ignore patterns are regular expression strings and seprated by comma
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', 'node_modules']
" nerdtree statusline
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

" multi cursor
let g:multi_cursor_use_default_mapping  = 0
let g:multi_cursor_start_word_key       = '<C-n>'
let g:multi_cursor_select_all_word_key  = '<A-n>'
let g:multi_cursor_start_key            = 'g<C-n>'
let g:multi_cursor_select_all_key       = 'g<A-n>'
let g:multi_cursor_next_key             = '<C-n>'
let g:multi_cursor_prev_key             = '<C-p>'
let g:multi_cursor_skip_key             = '<C-x>'
let g:multi_cursor_quit_key             = '<Esc>'

" ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_map = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" javascript library syntax
let g:used_javascript_libs = 'jquery,react,requiredjs,vue,'

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align-line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
  \ 'c': {'left': '/**', 'right': '*/'}, 
  \ 'js': {'left': '/*', 'right': '*/'}, 
  \ 'tsx': {'left': '/*', 'right': '*/'},
  \ }

" status line
set statusline+=%#warningmsg#
set statusline+=%*
" set statusline+=%{SyntasticStatuslineFlag()}

" typescript 
let g:typescript_indent_disable = 1

