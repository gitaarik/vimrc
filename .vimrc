execute pathogen#infect()

filetype plugin indent on
syn on
colorscheme default

set hidden " hide abandoned buffers
set bg=dark " dark background, for real programmers
set nocompatible " don't be compatible with older VIM, because it makes other things don't work well
set ruler " shows at which line/column you are at the bottom right
set showcmd " show how many characters/lines are selected in visual mode
set backspace=indent,eol,start " fix all backspaces (see help 'backspace')
set nocursorline " ensures the cursorline goes away after you opened a file via a directory
set is " incsearch: directly show search results
set ic " ignore case for search
set scs " enable smart case search - will enable case sensitive search when the pattern contains uppercase characters
set ai " automatically start new lines on current indent level
set scrolloff=2 " This ensures you have at least 2 lines of context around your cursor
set nonu " nonumber: no numbers before lines
set tpm=100 " maximum number of tab pages to open for -p and 'tab all'
set shiftwidth=4 " set the shift width to 4 spaces
set tabstop=4 " set the tabstops width to 4 spaces
set expandtab " use spaces instead of tab character
set winminheight=0 " when using splits, this will only show the titlebar of the file and not the title + one line contents of the file
set winminwidth=0 " when using splits, this will only show the vertical split bar and not one column of contents of the splitted file
set nojoinspaces " don't add 2 spaces after joining lines that and with . ! and ?
set diffopt+=iwhite " ignore whitespaces for vimdiff
set wildmode=list:longest " More bash-like filename autocompletion

" Folding
set foldmethod=indent
set foldlevel=1
set nofoldenable

" Options
let mapleader = ","
let python_version_2 = 1
let python_highlight_all = 1

" Easy tab navigation
nnoremap <silent> <C-h> :tabp<CR>
nnoremap <silent> <C-l> :tabn<CR>

" Close tab on ,c
nnoremap <silent> <Leader>c :tabc<CR>

" Easy split navigation
nnoremap <silent> <Esc>h <C-w>h
nnoremap <silent> <Esc>j <C-w>j
nnoremap <silent> <Esc>k <C-w>k
nnoremap <silent> <Esc>l <C-w>l

" Jumping 5 lines
nnoremap <silent> <Esc>[ 5k
nnoremap <silent> <Esc>] 5j

" Nice tab colors
highlight TabLine term=bold cterm=bold ctermfg=7 ctermbg=4
highlight TabLineSel term=bold ctermfg=7 ctermbg=1
highlight TabLineFill term=bold cterm=bold ctermbg=4

" map '%%' to current path of file editing in vim (http://vim.wikia.com/wiki/VimTip2)
cabbr <expr> %% expand('%:p:h')

" delete to black hole ("_) so it won't overwrite the last yank
nnoremap <silent> \d "_d
nnoremap <silent> \D "_D
nnoremap <silent> \x "_x
nnoremap <silent> \X "_X
nnoremap <silent> \s "_s
nnoremap <silent> \S "_S
nnoremap <silent> \c "_c
nnoremap <silent> \C "_C
vnoremap <silent> \p "_dP
vnoremap <silent> \P "_dP

" instand hg blame on highlighted text
vmap ,b :<C-U>!hg blame -u <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" NERDTree bindings
nnoremap <silent> <Leader>r :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>

" Ignore pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Tagbar
nnoremap <silent> <Leader>t :TagbarToggle<CR>
