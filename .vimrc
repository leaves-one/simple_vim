set number
set relativenumber
set showcmd
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set smartindent
set autoindent

set hlsearch
set incsearch
set ignorecase

set autoread
set mouse=a
set scrolloff=10

set nocompatible

"filetype on
filetype plugin on
filetype indent on

set writebackup
set nobackup
set noswapfile

set viminfo+=!
set iskeyword+=_,$,@,%,#,-,.
set termencoding=utf-8
set encoding=utf-8
"set fileencoding=utf-8,ucs-bom,gbk,cp936,gb2313,gb18030,default,latin1

imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

nmap cS :%s/\s\+$//g<CR>:noh<CR>
nmap cM :%s/\r$//g<CR>:noh<CR>
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

au BufRead,BufNewFile,BufEnter * cd %:p:h

autocmd BufNewFile *.py exec ":call SetTitle()"
func SetTitle()
    call setline(1, "#!/usr/bin/env python")
    call append(line("."), "# -*- coding=utf8 -*-")
    call append(line(".")+1,"")
    normal G
    normal o
endfunc


map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Align'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/neocomplete.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'repeat.vim'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'taglist.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'msanders/snipmate.vim'

call vundle#end()    "required
filetype plugin on
filetype plugin indent on   "reqiured

"indentLine
"=====================================
let g:indentLine_char = '┊'
nmap <leader>il :IndentLinesToggle<CR>
let g:indentline_color_term = 239
"=====================================

"neocomplete
"=====================================
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
let g:acp_enableAtStarup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" let g:neocomplete_disable_auto_complete = 1
" ====================================

"jedi-vim
"=====================================
autocmd FileType python3 setlocal omnifunc=jedi#Complete
"
"
"=====================================

"nerdcommenter
"=====================================
"<leader>ci "Line
"<leader>cm 
"<leader>cc
"<leader>cu
"<leader>ca
"<leader>cA

let NERDSpaceDelims = 1
"=====================================

"nerdtree
"=====================================
nmap <F2> :NERDTreeToggle<CR>
"=====================================

"tagbar
"=====================================
nmap tb :TlistClose<CR>:TagbarToggle<CR>
let g:tagbar_width = 30
" let g:tagbar_left = 1 "show at the left
" ====================================

"TagList
"=====================================
nmap tl :TagbarClose<CR>:Tlist<CR>

let Tlist_Show_One_File = 1
" let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_WinWidth = 30
let Tlist_Use_Right_Window = 1
"=====================================

"<leader> = '\'
" let mapleader = ';'
