call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" Plug 'w0rp/ale'
" Plug 'prettier/vim-prettier'

call plug#end()

" theme
syntax enable
set background=dark
colorscheme agscala
let g:airline_theme='light'
let g:airline_powerline_fonts=1
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

set linespace=1

set signcolumn=yes
set backspace=indent,eol,start
set cursorcolumn
set cursorline
set encoding=utf-8
set hidden
set laststatus=2
" set lazyredraw
set nocompatible
set noswapfile
set number
set ruler
set scrolloff=3
set shortmess=a
set showcmd
set showmode
set sidescroll=1
set sidescrolloff=10
set splitbelow
set splitright
set ttyfast
set visualbell
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildmenu
set wildmode=list:longest

set list
set listchars=tab:»\ ,trail:·

" " indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
filetype indent plugin on
syntax on

" searching
set ignorecase
set smartcase
set incsearch
set showmatch
set nohlsearch

nnoremap j gj
nnoremap k gk

" CoC - Conquer of Completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Rainbow Parenthesis:
 let g:rainbow_active = 1


" Print out the syntax groups under the cursor for debugging colorschemes
map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Don't save deleted text
vnoremap p "_dP

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_ignore_groups = []
"let g:easy_align_ignore_groups = ['Comment', 'String']

" Remember last cursor position when opening a file
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


"---------------"
"
let mapleader = ","




" Show Git Diff in window split when committing
autocmd FileType gitcommit DiffGitCached | wincmd p | :resize 15





" Fold toggling with <Space> if a fold exists at the cursor.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

" 256 Color support in the terminal
set t_Co=256

" Enter inserts inserts blank lines without entering insert mode.
nmap [<space> O<Esc>
nmap ]<space> o<Esc>

" Map ctrl-movement keys to window switching & resizing
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

" Fix [<section> commands so that it matches both formats of function braces
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" NERDTree
imap <F8> <Esc>:NERDTreeToggle<CR>
nmap <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']

" Run the script based on the filetype with <F5>
autocmd FileType python map <F5> <Esc>:!python %<CR>
autocmd FileType perl map <F5> <Esc>:!perl %<CR>
autocmd FileType ruby map <F5> <Esc>:!ruby %<CR>

" Show trailing whitepace and spaces before a tab:
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" Shortcut to sudo write a file
cmap w!! %!sudo tee > /dev/null %

" Remove GUI from GVIM
set guioptions=

" AckGrep.vim
" let g:ackprg="ack-grep -H --nocolor --nogroup "
let g:ackprg="ack-grep -H"

" NERD_Commenter.vim settings
let NERDSpaceDelims = 1
let NERDCompactSexyComs = 1

" Startify.vim settings
let g:startify_change_to_dir = 0
autocmd FileType startify setlocal buftype=

" EasyMotion.vim settings
" let g:EasyMotion_leader_key = '<Leader>'

""" Powerline.vim
" let g:Powerline_symbols = 'fancy'

""" CommandT.vim
map <F6> <Esc>:CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

""" Supertab.vim
" let g:SuperTabDefaultCompletionType = "context"

""" MRU (Most Recently Used)
map <F9> <Esc>:CtrlPMRUFiles<CR>
map <C-@> <Esc>:CtrlP<CR>
" map <F9> <Esc>:MRU<CR>
" let MRU_Max_Menu_Entries = 20
"
" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


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
"====== END VIM DIFF ========

