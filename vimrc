set nocompatible              " be iMproved, required
filetype off                  " required

"Backup
set backup
if has('win32')
    set backupdir=$HOME/vimfiles/temp//
    set directory=$HOME/vimfiles/temp//
    set undodir=$HOME/vimfiles/temp//
else
    set backupdir=$HOME/.vim/temp//
    set directory=$HOME/.vim/temp//
    set undodir=$HOME/.vim/temp//
endif

" set the runtime path to include Vundle and initialize
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
if has('win32')
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$HOME/vimfiles/bundle/') "vundle#begin()
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" the sparkup vim script is in a subdirectory of this repo called vim.
" pass the path to set the runtimepath properly.
" plugin 'rstacruz/sparkup', {'rtp': 'vim'}
" avoid a name conflict with l9
" plugin 'user/l9', {'name': 'newl9'}

"my plugins
Plugin 'tpope/vim-repeat' " more functionallity to the '.' command
Plugin 'tpope/vim-fugitive' " git commands for vim
Plugin 'tpope/vim-surround' " shortcuts to easily manipulate surrounded code
Plugin 'tpope/vim-unimpaired' " more shortcuts for moving :help unimpaired
Plugin 'tpope/vim-abolish' " :subvert/child{,ren}/adult{,s}/g
Plugin 'tpope/vim-commentary' " helps with commenting
"alternative commenter plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-speeddating' " date manipulation <c-a> and <c-x>
Plugin 'easymotion/vim-easymotion' " changes vim cursor movement (read more about it)
Plugin 'ervandew/supertab' " use tab for completion
Plugin 'shougo/unite.vim' " extensive file explorer needs to be set up
Plugin 'vim-airline/vim-airline' " more info on bottom of editor
Plugin 'raimondi/delimitmate' " autoclose brackets, parenthesis, etc.
Plugin 'majutsushi/tagbar' " class outline viewer

Plugin 'scrooloose/syntastic' " syntax checker
Plugin 'mattn/emmet-vim' " fast coding for html
Plugin 'junegunn/goyo.vim' " fullscreen clean mode

"all programming languages bundle, must test
Plugin 'sheerun/vim-polyglot'
Plugin 'shutnik/jshint2.vim' " javascript bug check
"color schemes
Plugin 'xolox/vim-colorscheme-switcher' " colorscheme changer
Plugin 'xolox/vim-misc'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'rakr/vim-rakr-light'
Plugin 'ehartc/Spink'
Plugin 'vim-scripts/greenvision'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"jshint
let jshint2_command = 'C:\Users\zpectral\AppData\Roaming\npm\jshint'

"GUI options
set guioptions=e
set lines=999 columns=90

"mapleader
let mapleader = ","

"General options
set history=1000
nmap <leader>w :w!<cr>

"Run in browser
nnoremap <silent> <leader>v :!start "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" file://%:p<CR>


"UI options
set so=7
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set cursorline
set noshowmode
set wildmenu
set wildignore=*~,.git,tmp,_site,*.log,*.jpg,*.png,*.gif
set lazyredraw
set nu

"Tab and indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set ai
set si
set wrap
set backspace=indent,eol,start

"Moving around
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"EasyMotion

"unite
nnoremap <Leader>q :Unite file<CR>
nnoremap <Leader>qq :Unite -start-insert file<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"Font
if has('gui_running')
  set guifont=Lucida_Console:h11
endif
set encoding=utf8

"color schemes
syntax enable
colorscheme molokai

"change background
" let g:colorscheme_switcher_exclude = ['default', 'test']
let g:colorscheme_switcher_exclude_builtins = 1


"supertab
let g:SuperTabMappingForward = '<c-tab>'
let g:SuperTabMappingBackward = '<s-tab>'
let g:SuperTabMappingTabLiteral = '<tab>'

"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key = '<C-x>'


"tagbar
nnoremap <silent> <F5> :TagbarToggle<CR>

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"airline
set laststatus=2

"Fullscreen and Goyo

let g:fullScreened = 0
function Fullscreen()
  if g:fullScreened == 0
    let g:fullScreened = 1
    simalt ~x
  else
    let g:fullScreened = 0
    simalt ~r
  endif
endfunction

map <F10> <Esc>:call Fullscreen()<CR>
map <F11> <Esc>:Goyo<CR>
map <F12> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>


"additinal commands and functions

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

"diff function
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

