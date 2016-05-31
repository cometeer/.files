set nocompatible              " be iMproved, required
filetype off                  " required
set relativenumber
set colorcolumn=80            " bar at 80 chars
set wrap
set linebreak
set nolist                    " List disables linebreak
syntax on
filetype plugin indent on
colorscheme smyck
" set guifont=Source\ Code\ Pro\ Light:h12
set guifont=Menlo:h12
set shiftwidth=0
set expandtab
set tabstop=2
" set softtabstop=2
set shiftround
" set smarttab
set smartindent
set hlsearch                  " Highlight search
set incsearch                 " Show search term while typing
set visualbell                " don't beep
set noerrorbells              " don't beep
set guioptions=egm            " remove scrollbar in gui
set encoding=utf-8
set diffopt+=vertical

" My keys
let mapleader = ","
:nnoremap <leader>e :lnext
" fix filetypes/syntax

" syntastics linter stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" watch .vimrc for changes
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" use 256 colors in terminal

if !has("gui_running")
  set t_Co=256
  set term=screen-256color
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'
Plugin 'jamessan/vim-gnupg'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'elzr/vim-json'
Plugin 'Slava/vim-spacebars'
Plugin 'marijnh/tern_for_vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/csv.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
Plugin 'jiangmiao/auto-pairs'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'scrooloose/nerdtree'
Plugin 'gregsexton/MatchTag'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'luochen1990/rainbow'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Shougo/vinarise'
Plugin 'skammer/vim-css-color'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['jscs', 'eslint']
let g:syntastic_typescript_checkers=['tslint']
let g:syntastic_html_checkers = ['Handlebars']
let g:syntastic_loc_list_height=5

" Airline
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

" NERDTree & related
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✗",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:rainbow_active = 0

au FileType javascript call JavaScriptFold()
au BufRead,BufNewFile *.ts set filetype=typescript
