set nocompatible
syntax enable        " enable syntax processing
syntax on
set tabstop=2        " number of visual spaces per TAB
set number 		     "Show line number
"set relativenumber             " Show relative line numbers
set hidden          "hide buffer instead of closing it
set showcmd 		 "Show command in bottom bar
set cursorline 	 "highlight currentline
set showmatch 		 "highlight matching braces
set incsearch		 "search as charcter are entered
set hlsearch    	 "highlight matches
set wildmode=longest,list "long autocomplete"
set wildmenu         "visual autocomplete for command menu
set showmode         "always show what mode we're currently editing in
set autoindent       "always set autoindenting on
"set cindent          "strict rule for C programming
set ruler            "Always show current position
set splitright       "split windows on the right"
set smarttab         "be smart about tab
set si               "Smart indent
set wrap             "Wrap lines
set autoread         "Reload files changed outside vi
set shiftwidth=4 "using the >> or << commands, shift lines by 4 spaces
filetype on          "enable file type detection
filetype plugin on
set title            "show file in titlebar
set autochdir        "set directory as one in which file is opened"
set magic            "change the backslash are used in search
set ignorecase       "case insensitive searching
set t_Co=256          " the terminal has 256 colors
colorscheme  monokai "fav color scheme
set background=dark
"hi Normal ctermbg=none "make vim background transparent
set mouse=a          "enable mouse to switch between split screen
set colorcolumn=80   "show a visible line at 80 column
set foldenable  	 "enable folding
set foldmethod=syntax
set foldlevel=99
set shortmess+=I "don't show intro message when starting vim
highlight ExtraWhitespace ctermbg=red guibg=red   "show trailing whitespace
match ExtraWhitespace /\s\+$/           "find trailing white space
let mapleader = "\\" "enable use of backslah as leader
" enable all Python syntax highlighting features
let python_highlight_all = 1
"------------------------------------------------------------------------------
"vim remeber line position when reopen files
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"------------------------------------------------------------------------------
"file type template
au BufNewFile *.c 0r ~/.vim/templates/c.template | let IndentStyle = "c"
au BufNewFile *.sh 0r ~/.vim/templates/sh.template
"au BufNewFile *.py 0r ~/.vim/templates/py.template

"file type specific setting
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd! bufwritepost .vimrc source %     " Automatic reloading of .vimrc

"------------------------------------------------------------------------------
"syntastic -recommeneded
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1  "check syntax even if file is open
"let g:syntastic_check_on_wq = 0


"------------------------------------------------------------------------------

execute pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp.vim
call pathogen#helptags() "generate help tags of installed plugin

"------------------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>

nnoremap <F2> :TlistToggle<CR>
nnoremap <F3> :%s/\s\+$//e<CR> "Remove all trailing white spaces
nnoremap <F4> :set paste<CR>i
nnoremap <F5> :buffers<CR>:buffer<Space>
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

nnoremap <leader>t :hi Normal ctermbg=none !<cr>

nnoremap <A-Up> :vsplit<CR>
nnoremap <A-Left> :vnew<CR>
"switch tab by gt and create one by -->
nnoremap gn :tabnew<CR>

"------------------------------------------------------------------------------
""Project specific setting.To be enabled by placing a copy of .vimrc file
""in diarectory containing project
""-----------------------------------------------------------------------------
set exrc         "keep enabled
set secure		 "keep enabled
"augroup project
"    autocmd!
"    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END
"set path for vim so gf will work
"set path+=/home/prabhat/local/libnice/agent
"set path for syntastic to find header file
"let g:syntastic_c_include_dirs = [ '/home/prabhat/local/libnice/agent','/home/prabhat/local/include/glib-2.0','/home/prabhat/local/glib/glib']
let g:syntastic_python_python_exec = '/usr/bin/python3'
"jedi setting
"disable jedi
"let g:jedi#auto_initialization = 0
""-----------------------------------------------------------------------------
if has('gui_running')
		"GUI specific
		set columns=80 lines=50 " GUI window geometry
		set guifont=Monospace\ 11 " font for GUI window
		set guioptions-=T        " no toolbar
        set guitablabel=%t
		set guioptions -=T "Show open tab
		set linespace=5      "make underscore visible
		set cmdheight=2    "avoid pressing Enter to open a file
endif
