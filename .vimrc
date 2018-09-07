execute pathogen#infect()

filetype plugin indent on

syntax on

" Set the background to dark
set background=dark

" Very nice colorscheme - https://github.com/reedes/vim-colors-pencil
colorscheme pencil

" Disable the backgroud color so we can see the original terminal background
" through vim. If you set a background image or transparency in the terminal
" emulator, you will see that instead of a black background.
highlight Normal guibg=NONE ctermbg=NONE

set hidden " hide abandoned buffers
set nocompatible " don't be compatible with older VIM, because it makes other things don't work well
set ruler " shows at which line/column you are at the bottom right
set showcmd " show how many characters/lines are selected in visual mode
set backspace=indent,eol,start " fix all backspaces (see help 'backspace')
set nocursorline " ensures the cursorline goes away after you opened a file via a directory
set incsearch " directly show search results
set ignorecase " ignore case for search
set smartcase " enable smart case search - will enable case sensitive search when the pattern contains uppercase characters
set autoindent " automatically start new lines on current indent level
set scrolloff=2 " This ensures you have at least 2 lines of context around your cursor
set nonumber " don't show numbers before lines
set tabpagemax=100 " maximum number of tab pages to open for -p and 'tab all'
set shiftwidth=4 " set the shift width to 4 spaces
set tabstop=4 " set the tabstops width to 4 spaces
set softtabstop=4
set expandtab " use spaces instead of tab character
set winminheight=0 " when using splits, this will only show the titlebar of the file and not the title + one line contents of the file
set winminwidth=0 " when using splits, this will only show the vertical split bar and not one column of contents of the splitted file
set nojoinspaces " don't add 2 spaces after joining lines that and with . ! and ?
set diffopt+=iwhite " ignore whitespaces for vimdiff
set wildmode=list:longest " More bash-like filename autocompletion
set autoread " autmatically reload open files that haven't been changed
set history=50 " keep 50 lines of command line history
set mouse=a " enable mouse support
set ttymouse=xterm2 " enables mouse dragging inside tmux
set undofile " Safe undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set backup " keep a backup file
set backupdir=$HOME/.vim/backups " keep a backup file
set laststatus=2 " always enable vim airline (https://github.com/bling/vim-airline)
set completeopt=menu " for autocomplete suggestions, only use the menu (pops up in insert mode at the cursor location) and not the preview window (which shows up on top of the screen)

" Enable the matchit.vim plugin
runtime macros/matchit.vim

" Airline configuration:

    " Use powerline fonts
    let g:airline_powerline_fonts = 1

    " Don't show buffers in the tabline
    let g:airline#extensions#tabline#show_buffers = 0

    " Do show tabs in the tabline
    let g:airline#extensions#tabline#enabled = 1

    " Use the pencil theme for airline
    let g:airline_theme = 'pencil'

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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Folding
set foldmethod=indent
set foldlevel=1
set nofoldenable

" Options
let mapleader = "\<Space>"
let python_version_2 = 0
let python_highlight_all = 1

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']

augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Move by visual line instead of whole line
nnoremap j gj
nnoremap k gk

" Keep selection when indenting
vnoremap > >gv
vnoremap < <gv

" Easy tab navigation
nnoremap <silent> <C-l> gt
nnoremap <silent> <C-h> gT

" Easy tab moving
nnoremap <silent> <leader>h :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <leader>l :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Close tab on ,c
nnoremap <silent> <leader>c :tabc<CR>

" Easy split navigation
nnoremap <silent> <Esc>h <C-w>h
nnoremap <silent> <Esc>j <C-w>j
nnoremap <silent> <Esc>k <C-w>k
nnoremap <silent> <Esc>l <C-w>l

" Jumping 5 lines
"nnoremap <silent> <Esc>[ 5k
"nnoremap <silent> <Esc>] 5j

" Faster scrolling
nnoremap <silent> <Esc>e 5<C-e>
nnoremap <silent> <Esc>y 5<C-y>

" Paste toggle
set pt=<Esc>t

" Nice tab colors
highlight TabLine term=bold cterm=bold ctermfg=7 ctermbg=4
highlight TabLineSel term=bold ctermfg=7 ctermbg=1
highlight TabLineFill term=bold cterm=bold ctermbg=4

" map '%%' to current path of file editing in vim (http://vim.wikia.com/wiki/VimTip2)
cabbr <expr> %% expand('%:p:h')

" delete to black hole ("_) so it won't overwrite the last yank
noremap \dd "_dd

nnoremap <silent> \d "_d
vnoremap <silent> D "_d
nnoremap <silent> \D "_D

nnoremap <silent> \x "_x
vnoremap <silent> X "_x
nnoremap <silent> \X "_X

nnoremap <silent> \s "_s
vnoremap <silent> S "_s
nnoremap <silent> \S "_S

nnoremap <silent> \c "_c
vnoremap <silent> C "_c
nnoremap <silent> \C "_C

vnoremap <silent> P "_dP

" instand git blame on highlighted text
vmap ,b :<C-U>!git blame -wMC <C-R>=expand("%:p")<CR> -L <C-R>=line("'<")<CR>,<C-R>=line("'>")<CR> <CR>

" NERDTree bindings
nnoremap <silent> <Leader>r :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR> :NERDTreeTabsToggle<CR> :NERDTreeTabsToggle<CR> 

" Ignore certain files/folders in NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']

" Tagbar
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" Quickly change tab width
nmap <leader>M :set tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>m :set tabstop=2 shiftwidth=2 softtabstop=2<CR>

" fzf
set rtp+=~/.vim/bundle/fzf

" Alias T to tabf
cnoreabbrev T tabf

" Quick ipdb trace
command Ipdb :normal oimport ipdb; ipdb.set_trace()

" Quick pprint import
command Pprint :normal ofrom pprint import pprint

" Quick console.log
command Console :normal oconsole.log();

set guifont=Monaco:h13
