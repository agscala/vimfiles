
call plug#begin('~/.vim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'kchmck/vim-coffee-script'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-git'
Plug 'junegunn/vim-easy-align'
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'

Plug 'rosstimson/scala-vim-support'
Plug 'wavded/vim-stylus'
Plug 'fatih/vim-go'
Plug 'lunaru/vim-less'

call plug#end()

" theme
syntax enable
set background=dark
colorscheme agscala
let g:airline_theme='light'
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

set linespace=1

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

" indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
filetype indent plugin on

" searching
set ignorecase
set smartcase
set incsearch
set showmatch
set nohlsearch

nnoremap j gj
nnoremap k gk

" Rainbow Parenthesis:
 let g:rainbow_active = 1

" Omnisharp:
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'ctrlp'
" Use the stdio OmniSharp-roslyn server

let g:OmniSharp_server_stdio = 1



" Set the type lookup function to use the preview window instead of echoing it

"let g:OmniSharp_typeLookupInPreview = 1



" Timeout in seconds to wait for a response from the server

let g:OmniSharp_timeout = 5



" Don't autoselect first omnicomplete option, show options even if there is only

" one (so the preview documentation is accessible). Remove 'preview' if you

" don't want to see any documentation whatsoever.

set completeopt=longest,menuone,preview



" Fetch full documentation during omnicomplete requests.

" By default, only Type/Method signatures are fetched. Full documentation can

" still be fetched when you need it with the :OmniSharpDocumentation command.

"let g:omnicomplete_fetch_full_documentation = 1



" Set desired preview window height for viewing documentation.

" You might also want to look at the echodoc plugin.

set previewheight=5



" Tell ALE to use OmniSharp for linting C# files, and no other linters.

let g:ale_linters = { 'cs': ['OmniSharp'] }



" Update semantic highlighting on BufEnter and InsertLeave

let g:OmniSharp_highlight_types = 2



augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>

" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>

" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1


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

