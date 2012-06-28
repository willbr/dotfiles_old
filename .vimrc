call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, becAUSE It changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
    set backupdir=~/.tmp,~/,.
endif

set directory=~/.tmp,~/,.

set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

syntax on
let mapleader = ","
set nowrap
set ai
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab
set guioptions-=T

let g:slime_target = "tmux"
let g:slime_send_key = "<leader>c"
nnoremap <leader>v ggVG,c''

set hidden
set ignorecase
set smartcase
set title
set scrolloff=3

" readline mappings
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

inoremap <C-n> <Down>
inoremap <C-p> <Up>

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

nnoremap <leader>Q :qall!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

nnoremap <leader>m :make<CR>
nnoremap <leader>M :make<space>

set listchars=tab:>-,trail:.,eol:$
"nnoremap <silent> <leader>s :set list!<CR>

nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>r :TagbarToggle<CR>
nnoremap <silent> <leader>t :CommandT<CR>

set shortmess=atI

set visualbell

set laststatus=2
set t_Co=256

inoremap jk <Esc>

set tags=./tags;/

nnoremap <leader>d :bp<CR>
nnoremap <leader>f :bn<CR>

set clipboard=unnamed

set wildmenu
set wildmode=longest,list,full

"vnoremap <tab> >gv
"vnoremap <s-tab> <gv

"nnoremap <tab> >>
"nnoremap <s-tab> <<

nnoremap = mpgg=G'p

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:snipMate = {}
let g:snipMate['snippet_dirs'] = ["~/.vim/"]

set cino+=(0

let g:pad_dir = "/Users/william/Dropbox/notes"

let g:easytags_updatetime_autodisable = 1

set guifont=Inconsolata-dz:h28

inoremap <nul> _
inoremap <C-Space> _

if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    au BufNewFile *.h call s:InsertCHeader()
endif

function! s:InsertCHeader()
    let fname = '_' . expand('%:t')
    let fname = toupper(fname)
    let fname = substitute(fname, '\.', '_', 'g')
    call setline(line('.'), "#ifndef " . fname)
    call append(line('$'), "#define " . fname)
    call append(line('$'), "")
    call append(line('$'), "")
    call append(line('$'), "")
    call append(line('$'), "#endif")
    normal GGkk
endfunction

inoremap <C-h> [
inoremap <C-j> (
imap <C-k> <SPACE><BS>)
imap <C-l> <SPACE><BS>]

inoremap <C-o> {

nnoremap <silent> <leader>of :FSHere<CR>
