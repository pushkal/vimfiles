"" Basic behaviour

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs


"activate pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set noswapfile		  "disable swapfiles
set hidden			  "hide buffers when not displayed
set textwidth=0		"maximum width of text that can be inserted
set nofoldenable		"dont fold by default
set formatoptions-=o	"dont continue comments when pushing o/O
set guifont=Monospace\ 13
imap ,/ </<C-X><C-O>

"use w!! to save with root permissions
cmap w!! %!sudo tee > /dev/null %


"undofiles configuration
set undodir=~/.vim/undofiles
set undofile

"commandline configuration
set showcmd				 "display incomplete commands
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu				"enable C-n and C-p to scroll through matches
"stuff to ignore when tab completing
set wildignore=*.o,*~,*.pyc,*.hi

"" Looks

set t_Co=256				"force 256 colours
colorscheme xoria256-trans  "nice dark colorscheme
set colorcolumn=+1		  "mark the ideal max text width
set number				  "show line numbers
set showmode				"show current mode down the bottom

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"" Indentation and syntax highlighting

syntax enable
filetype plugin on
filetype indent on
set autoindent
set smartindent

au FileType c cpp setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

"reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"open parameter indentation settings
let g:pyindent_open_paren = '&sw'
let g:pyindent_continue = '&sw'
set cinoptions+=+1

"" Handling whitespaces

set noet ci pi sts=0 sw=4 ts=4 "use tabs and set it to 4 spaces

"set expandtab				   "use spaces for tabs and set it to 4 spaces
"4 spaces is a tab
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4

set nowrap					  "dont wrap lines

set backspace=indent,eol,start  "backspace through everything in insert mode

"" Searching

set hlsearch		"highlight search by default
set incsearch	   "incremental search
set ignorecase	  "ignore cases while searching
set smartcase	   "consider case for search patterns with uppercase letters

"" Mappings

"explorer mappings
nnoremap <silent> <F1> :BufExplorer<CR>
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F3> :TagbarToggle<CR>

"remove trailing whitespaces with <F5>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set pastetoggle=<F6>			"toggle paste mode with <F6>

"<C-l> - Clear the highlight as well as redraw
nnoremap <silent> <C-L> :nohls<CR><C-L>

"save session with  <C-m>
nnoremap <silent> <C-M> :SaveSession<CR>

"`#` should follow neighbouring indentation
inoremap # X<BS>#

"" Auto execution commands

autocmd VimEnter * set vb t_vb=""   "disable beeping and flashing

"spell check for text, mail, commit files
autocmd filetype markdown,mail,svn,*commit* setlocal spell

"" Plugin configurations

"Powerline
let g:Powerline_symbols = 'unicode'

"Tagbar
let g:tagbar_width = 25

"NERDTree
let g:NERDTreeWinSize = 25

"vim-pad
let g:pad_dir = "~/workspace/notes/"
let g:pad_window_height = 15
let g:pad_use_default_mappings = 0

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_python_checker='pylint'

let g:session_autoload = 'no'
let g:neocomplcache_enable_at_startup = 1

"PHP PIV
let g:DisableAutoPHPFolding = 1
