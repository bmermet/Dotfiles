set nocompatible               " be iMproved
filetype off                   " required!

"Vundle configuration
set rtp+=~/.vim/bundle/vundle/
let g:vundle_default_git_proto = 'git'
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'mbbill/undotree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/tabman.vim'
Bundle 'sjl/clam.vim'

" vim-scripts repos
Bundle 'bufexplorer.zip'

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" ================== General settings ======================
set autoread             " Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn on syntax highlighting
syntax on

" Remap leader to ','
let mapleader = ","

set scrolloff=3
set number
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set autowrite           " Automatically save before commands like :next and :make
set cursorline          " highlights the current line

" "No sound
set noerrorbells
" "Share the clipboard with the current window manager
set clipboard+=unnamed

" Always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

set history=1000        " remember more commands and search history
set viminfo='50,\"500   " remember copy registers after quitting in the .viminfo
                        " file -- 50 jump links, regs up to 500 lines'

"Persistent undo history
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
set undolevels=1000     " use many levels of undo

" Define color theme
set t_Co=256
colorscheme wombat

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a


" ================== Search tweaks =========================

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set infercase
set hlsearch
set gdefault            " this makes search/replace global by default


" ================ Indentation ============================

set smartindent
set autoindent          " on new lines, match indent of previous line
set copyindent          " copy the previous indentation on autoindenting
set cindent             " smart indenting for c-like code
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab " Replace tabs with spaces

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ================ Completion =============================

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
" Sweet zsh-like autocompletion menu
set wildmenu

" Vim branch in status bar
"set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]%=\ %{fugitive#statusline()}
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2 "always show the statusline


"set statusline=%{fugitive#statusline()}
" " Add Calc function which calls Python (requires Python support)
if has("python")
  command! -nargs=+ Calc :py print <args>
  py from math import *
endif

"Global settings for c autcomplete with YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"Launch NerdTree at startup
"au VimEnter *  NERDTree
"Set NERDTree width, default is 31
let g:NERDTreeWinSize = 15

"" Easier split navigation
"" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> <c-Up> :wincmd k<CR>
nmap <silent> <c-Down> :wincmd j<CR>
nmap <silent> <c-Left> :wincmd h<CR>
nmap <silent> <c-Right> :wincmd l<CR>

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null

" Undo Tree 
nnoremap ,u :UndotreeToggle<CR>

" UltiSnips 
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"

" You complete me
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

" <leader>v brings up .vimrc
" <leader>V reloads it and makes all changes active (file has to be saved first)
noremap <leader>v :e! $MYVIMRC<CR>
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of extra
" whitespace
set pastetoggle=,p

"Clam remap
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>
