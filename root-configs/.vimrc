" Make Vim more useful
set nocompatible
" Hide the extra mode info
set noshowmode
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Reduce lag when switching modes
set ttimeoutlen=50
" Enhance command-line completion
set wildmenu

if !has('nvim')
" Allow cursor keys in insert mode
	set esckeys
endif

" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=" "
" Don’t add empty newlines at the end of files
set binary
set noeol
" Make new tabs open to the bottom or right instead of usual
set splitbelow
set splitright
" Prevent line wrapping
set nowrap
" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set nolist
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Change cursor style based on input mode
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>sw :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

set wildignore+=*/tmp/*,*/.git/*,*/bin/*,*/obj/*,*.so,*.swp,*.zip

" Key mappings
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

" Custom key mappings
map <C-n> :NERDTreeToggle<CR>
map <leader>/ :noh<CR>

source ~/.vim/plugins.vim
source ~/.vim/omnisharp.vim
source ~/.vim/ale.vim
source ~/.vim/coc.vim
source ~/.vim/ctrlp.vim

set background=dark
colorscheme snazzy
let g:SnazzyTransparent=1
let g:lightline = {
			\ 'colorscheme': 'snazzy'
			\}