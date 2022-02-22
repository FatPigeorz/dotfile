set nocompatible "no vi compatible



" -------------------
"  Appearance and UI
" -------------------

syntax on
set showmatch "show matching braces when cursor(text indicator) is over them

"highlighting the current line , but only in the active window
augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
" set t_Co=256
if has('gui_running')
    colorscheme molokai
    let g:lightline = {'colorscheme': 'molokai'}
elseif &t_Co < 256
    colorscheme default
    set nocursorline " looks bad in this mode
else
    set background=dark
    let g:solarized_termcolors=256 " instead of 16 color with mapping in terminal
    colorscheme molokai
    " customized colors
    highlight SignColumn ctermbg=234
    highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
    highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
    let g:lightline = {'colorscheme': 'dark'}
    highlight SpellBad cterm=underline
    " patches
    highlight CursorLineNr cterm=NONE
endif

filetype plugin indent on " enable file type detection
    
set autoindent


" set directory=$HOME/.vim/swap// " prevent the swap files from poluting the home direct
set nu " number lines
set rnu " relative line numbering
" Enable searching as you type, rather than waiting till you press enter.

" set hls " highlight search
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
" set noshowmode " hide mode
set showmode     " default to showmode, explicitly emphasize, it's helpful
set laststatus=2


"----------------------
" Basic Editing Config
" ---------------------

" enable undo file to save the undo log
set undofile
if !isdirectory($HOME."/.vim/undodir")
  call mkdir($HOME."/.vim/undodir")
endif
set undodir=$HOME/.vim/undodir

set noswapfile " disable the swap file

set incsearch " incremental search (as string is being typed)

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start " allow backspacing over everything

set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences

" tabs and spaces"
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a " enable mouse mode (scrolling, selection, etc)
if &term =~ '^screen'
    " tmux knows the extended mouse mode
        set ttymouse=xterm2
endif

" folding
set nofoldenable " disable folding by default
set foldmethod=indent
"it's useful when coding on Python and standard-formated c or cpp
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" ----------------
"   Key Bindings
" ----------------

" Q in normal mode enters Ex mode. You almose never want this
nmap Q <Nop>
" unbind for tmux
nmap <c-a> <Nop>
nmap <c-a> <Nop>

" quikly operate on windows
"""""""""""""""""""""""""""

" quikly switch windows
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" quikly arrange windows
" noremap <c-H> <c-w><c-H>
" noremap <c-J> <c-w><c-J>
" noremap <c-K> <c-w><c-K>
" noremap <c-L> <c-w><c-L>

" quikly remove window
" noremap <c-q> <c-w><c-q>
" deferent from :q, the key bindind doesn't shut down the buffer of the window

" keep only the current window
" noremap <c-o> <c-w><c-o>
" can alse use :only or :on



" ----------
"  Plugings
" ----------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.vim'
call plug#end()
