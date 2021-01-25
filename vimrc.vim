" Enable Syntax highlighting
syntax on

" Standard vim options
set autoindent            " always set autoindenting on
set autoread              " automatically load files when they change
set backspace=2           " allow backspacing over everything in insert mode
set cindent               " c code indenting
set diffopt=filler,iwhite " keep files synced and ignore whitespace
set expandtab             " Get rid of tabs altogether and replace with spaces
set foldcolumn=2          " set a column in case we need it
set foldlevel=0           " show contents of all folds
set foldmethod=indent     " use indent unless overridden
set guioptions-=m         " Remove menu from the gui
set guioptions-=T         " Remove toolbar
set hidden                " hide buffers instead of closing
set history=10000         " keep 10000 (the max) lines of command line history
set ignorecase            " Do case insensitive matching
set incsearch             " Incremental search
set laststatus=2          " always have status bar
set linebreak             " This displays long lines as wrapped at word boundries
set matchtime=10          " Time to flash the brack with showmatch
set nobackup              " Don't keep a backup file
set nocompatible          " Use Vim defaults (much better!)
set nofen                 " disable folds
set notimeout             " i like to be pokey
set ttimeout              " timeout on key-codes
set ttimeoutlen=100       " timeout on key-codes after 100ms
set scrolloff=1           " dont let the curser get too close to the edge
set shiftwidth=4          " Set indention level to be the same as softtabstop
set tabstop=4             " Set size for tab character
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set softtabstop=4         " Why are tabs so big?  This fixes it
set textwidth=0           " Don't wrap words by default
set textwidth=80          " This wraps a line with a break when you reach 80 chars
set virtualedit=block     " let blocks be in virutal edit mode
set wildmenu              " This is used with wildmode(full) to cycle options
set ruler                 " the ruler on the bottom is useful
set number                " Show number of the current line
set relativenumber        " Show relative numbers
set exrc                  " Allow local .vimrc and .gvimrc
set nowrap                " Disable wrapping
set report=0              " Report every change in the file
set hlsearch              " Highlight search matches
set incsearch             " Enable incremental search
set mouse=a               " Enable mouse in all modes (see help mouse)
set encoding=UTF-8

"Longer Set options
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-   " useful for cscope in quickfix
set listchars=tab:>-,trail:-                 " prefix tabs with a > and trails with -
set tags+=./.tags;/,./tags;/                 " set ctags
set whichwrap+=<,>,[,],h,l,~                 " arrow keys can wrap in normal and insert modes
set wildmode=list:longest,full               " list all options, match to the longest

set helpfile=$VIMRUNTIME/doc/help.txt
set guifont=Courier\ 10\ Pitch\ 10
set path+=.,..,../..,../../..,../../../..,/usr/include

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files I am not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class

"Disabled options
"set list                    " Make tabs and trails explicit
"set noswapfile              " this guy is really annoyoing sometimes
"set wrapmargin=80           " When pasteing, use this, because textwidth becomes 0
                             " wrapmargin inserts breaks if you exceed its value
"set cscopeprg=~/bin/cscope  "set cscope bin path

" viminfo options
" read/write a .viminfo file, don't store more than
" 50 lines of registers
set viminfo='20,\"50

" Different cursor shape for different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Install vim-plug if it is not installed.
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" vim-code-dark https://github.com/tomasiser/vim-code-dark#installation
Plug 'tomasiser/vim-code-dark'

" vim-prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'itchyny/lightline.vim'

" NERDTree and friends
" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" editorconfig vim plugin
Plug 'editorconfig/editorconfig-vim'

" rust.vim
Plug 'rust-lang/rust.vim'

" python-syntax: Improved synatx highlighting for Python.
let g:python_highlight_all = 1
Plug 'vim-python/python-syntax'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-capslock'


" coc plugin
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" Set colorscheme to vim-code dark, which is similar to VSCode. This depends on
" the 'tomasiser/vim-code-dark' plugin added above.
colorscheme codedark

" vim-prettier config
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" vim-airline configuration
let g:airline_theme = 'luna'                    " Airline theme. See: https://github.com/vim-airline/vim-airline-themes
let g:airline#extensions#tabline#enabled = 1    " automatically display all buffers when there's only one tab open.
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_statusline_ontop = 1              " status line on top, making room for other plugins to use the status line.
let g:airline_powerline_fonts = 1               " integrate with powerline fonts - require installation of a patched powerline font.

" fzf config
" C-P to open fzf
nnoremap <silent> <c-p> :Files<CR>
" F2 to open buffers
nnoremap <silent> <F2> :Buffers<CR>
" F3 to search file contents
nnoremap <silent> <F3> :Ag<CR>
" F4 to search in the lines of the current buffer
nnoremap <silent> <F4> :BLines<CR>

" NERDTree config: F11 to toggle the tree. Also, close vim if the only window left is NERDTreeClose vim if the only window left is NERDTree
nnoremap <silent> <F11> :NERDTreeToggle<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" bugexplorer config: explore/next/previous: F2, F3, F4
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Enable mouse reporting through SGR if available.
" https://iterm2.com/faq.html
if has('mouse_sgr')
    set ttymouse=sgr
endif

:so ~/smart-shell/coc.vim

