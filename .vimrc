" Pathogen "
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#runtime_append_all_bundles("bundle-autoupdate")
call pathogen#helptags()
""""""""""""

filetype on
filetype plugin on
filetype indent on


" Testing "
set encoding=utf-8
set scrolloff=3
set scrolljump=6
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set noswapfile
"""""""""""

set nocompatible
set noswapfile
set number
" set relativenumber " (Don't like too much after trying)

"-- Default Indenting --"
set tabstop=4
set shiftwidth=4
"---------------"

"-- Searching --"
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
" set gdefault "FUCKIN WITH MY SUBSTITUTIN
set incsearch
set showmatch
set nohlsearch
nnoremap <leader><space> :noh<cr>
"---------------"

set showmatch
colors desert256
set gfn=Inconsolata\ Medium\ 11
set linespace=1
syntax enable

" Highlighting the cursor
set cursorline 
set cursorcolumn
set list
set listchars=tab:»\ ,trail:·

" PHP settings.
let php_sql_query=1
let php_htmlInStrings=1

" Fold toggling with <Space> if a fold exists at the cursor.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

" 256 Color support in the terminal
set t_Co=256

" Enter inserts inserts blank lines without entering insert mode.
nmap [<space> O<Esc>
nmap ]<space> o<Esc>

" Map ctrl-movement keys to window switching & resizing
nmap <C-k> <C-w><Up>
nmap <C-j> <C-w><Down>
nmap <C-l> <C-w><Right>
nmap <C-h> <C-w><Left>
" Resizing windows. (doesn't work)
" nmap <M-h> <C-w>+
" nmap <M-j> <C-w>-
" nmap <M-h> <C-w><
" nmap <M-l> <C-w>>

" NERDTree
imap <F8> <Esc>:NERDTreeToggle<CR>
nmap <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']

" Run the script based on the filetype with <F5>
autocmd FileType python map <F5> <Esc>:!python %<CR>
autocmd FileType perl map <F5> <Esc>:!perl %<CR>
autocmd FileType ruby map <F5> <Esc>:!ruby %<CR>

" Remove GUI from GVIM
set guioptions=

" AckGrep.vim
" let g:ackprg="ack-grep -H --nocolor --nogroup "
let g:ackprg="ack-grep -H"

" NERD_Commenter.vim settings
let NERDSpaceDelims = 1
let NERDCompactSexyComs = 1

""" TagList.vim settings
let Tlist_Ctags_Cmd="ctags-exuberant"
let Tlist_Process_File_Always=1
map <F7> <Esc>:TlistToggle<CR>
map <F6> :!/usr/bin/ctags-exuberant -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" Tags -- add new ones with `ctags -R -f ~/.vim/tags/language.ctags /location/to/tag/from
" set tags+=$HOME/.vim/tags/python.ctags
" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

set completeopt=menuone,longest

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#CompleteCpp

"========= VIM DIFF ========="
function! s:DiffAllWindows(on) " {{{2 
    windo call <SID>DiffThisWindow(a:on) 
endfunc 
 
function! s:DiffThisWindow(on) " {{{2 
    if a:on 
        silent! set diff scrollbind fdm=diff 
    else 
        silent! set nodiff noscrollbind fdm=syntax 
    end 
endfunc 
 
function! s:DiffThese(file1, file2) " {{{2 
    exe "tabedit " . a:file1 
    exe "vsplit " . a:file2 
    call <SID>DiffAllWindows(1) 
endfunc 
 
 
command! -nargs=0 DiffThis call <SID>DiffThisWindow(1) 
command! -nargs=0 DiffOff call <SID>DiffThisWindow(0) 
command! -nargs=0 DiffToggle call <SID>DiffThisWindow(!&diff) 
command! -nargs=0 DiffAll call <SID>DiffAllWindows(1) 
command! -nargs=0 DiffAllOff call <SID>DiffAllWindows(0) 
command! -nargs=* -complete=file DiffThese call <SID>DiffThese(<f-args>) 
"====== END VIM DIFF ========"
