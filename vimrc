syntax enable        " enable syntax processing
syntax on
set tabstop=4        " number of visual spaces per TAB
"set number 		     "Show line number
set relativenumber             " Show relative line numbers
set showcmd 		 "Show command in bottom bar
set cursorline 	 "highlight currentline
set showmatch 		 "highlight matching braces
set incsearch		 "search as charcter are entered
set hlsearch    	 "highlight matches
set wildmode=longest,list "long autocomplete"
set wildmenu         "visual autocomplete for command menu
set showmode         "always show what mode we're currently editing in
set autoindent       "always set autoindenting on
set ruler            "Always show current position
set smarttab         "be smart about tab
set si               "Smart indent
set wrap             "Wrap lines 
set autoread         "Reload files changed outside vim
set nocompatible
filetype on          "enable file type detection
filetype plugin on
set title            "show file in titlebar
set autochdir        "set directory as one in which file is opened"
set magic            "change the backslash are used in search
set ignorecase       "case insensitive searching
colorscheme  monokai "fav color scheme
set background=dark
set mouse=a          "enable mouse to switch between split screen
set colorcolumn=80   "show a visible line at 80 column
set foldenable  	 "enable folding
set foldmethod=indent
set foldlevel=99

let mapleader = "\\" "enable use of backslah as leader

"markdown specific highlight
"highlight htmlBold gui=bold guifg=#af0000 ctermfg=124
"highlight htmlItalic gui=italic guifg=#ff8700 ctermfg=214

nnoremap <F2> :TlistToggle<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
autocmd! bufwritepost .vimrc source %     " Automatic reloading of .vimrc

execute pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp.vim


map <C-n> :NERDTreeToggle<CR>

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

nnoremap <A-Up> :vsplit<CR>
nnoremap <A-Left> :vnew<CR>

nnoremap <C-t> :tabnew <CR>
nnoremap <C-Pagedown> :prevtab <CR>
nnoremap <C-Pageup> :nexttab <CR>

if has('gui_running')
		"GUI specific
		set columns=80 lines=50 " GUI window geometry
		set guifont=Monospace\ 12 " font for GUI window
		set guioptions-=T        " no toolbar
	    set guitablabel=%t	
		set guioptions -=T "Show open tab
		set shortmess=I
		set linespace=5      "make underscore visible
		set cmdheight=2    "avoid pressing Enter to open a file

		"Common both GUI & Terminal
		syntax enable        " enable syntax processing
		syntax on
		set tabstop=4        " number of visual spaces per TAB
		"set number 		     "Show line number
		set relativenumber             " Show relative line numbers
		set showcmd 		 "Show command in bottom bar
		set cursorline 	 "highlight currentline
		set showmatch 		 "highlight matching braces
		set incsearch		 "search as charcter are entered
		set hlsearch    	 "highlight matches
		set wildmode=longest,list "long autocomplete"
		set wildmenu         "visual autocomplete for command menu
		set showmode         "always show what mode we're currently editing in
		set autoindent       "always set autoindenting on
		set ruler            "Always show current position
		set smarttab         "be smart about tab
		set si               "Smart indent
		set wrap             "Wrap lines 
		set autoread         "Reload files changed outside vim
		filetype on          "enable file type detection
		set title            "show file in titlebar
		set autochdir        "set directory as one in which file is opened"
		set magic            "change the backslash are used in search
		set ignorecase       "case insensitive searching
		colorscheme  monokai "fav color scheme
		set background=dark
		set mouse=a          "enable mouse to switch between split screen
		set colorcolumn=80
		autocmd! bufwritepost .vimrc source %     " Automatic reloading of .vimrc
		set foldenable  	 "enable folding
		set fdm=indent
		set foldlevel=99
		execute pathogen#infect()
		set runtimepath^=~/.vim/bundle/ctrlp.vim

		nnoremap <F2> :TlistToggle<CR>
		nnoremap <F5> :buffers<CR>:buffer<Space>
		
		map <C-n> :NERDTreeToggle<CR>

		nnoremap <C-Down> <C-W><C-J>
		nnoremap <C-Up> <C-W><C-K>
		nnoremap <C-Right> <C-W><C-L>

		nnoremap <C-Left> <C-W><C-H>

		nnoremap <A-Up> :vsplit<CR>
		nnoremap <A-Left> :vnew<CR>

		nnoremap <C-t> :tabnew <CR>
		nnoremap <C-Pagedown> :prevtab <CR>
		nnoremap <C-Pageup> :nexttab <CR>
endif



"for future consideration

""Project specific setting.To be enabled by placing a copy of .vimrc file
""in diarectory containing project
""-----------------------------------------------------------------
"set exrc
"set secure

"augroup project
"    autocmd!
"    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END

"set path where gf command work
"let &path.="src/include,/usr/include/AL," 

""------------------------------------------------------------------
