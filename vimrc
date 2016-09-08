" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

"==================================================
"|             Vundle Plugin Manager              |
"==================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Let vundle manage itself
Plugin 'gmarik/Vundle.vim'

"My Plugins
"Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"Color Schemes
Plugin 'Oisota/kotoria'
Plugin 'altercation/vim-colors-solarized'
"Syntax Files"
Plugin 'sudar/vim-arduino-syntax'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on
"==================================================


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
    syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch        " Highlight matches
set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

"turn on line numbers
set number
set relativenumber
set autoindent
"set cursorline

"set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"disable line wrapping
set nowrap

"set color scheme
"colorscheme kotoria
colorscheme solarized

"set t_Co=16

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
  "source /etc/vim/vimrc.local
"endif

"Code Folding
"set foldenable
"set foldlevelstart=1
"set foldnestmax=20
"set foldmethod=indent

"File Explorer
let g:netrw_liststyle = 3

"Show file name in title bar
set title

set term=screen-256color
