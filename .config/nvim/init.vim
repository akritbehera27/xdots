" Plugin Loading
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim' "Highlights lines
Plug 'joshdick/onedark.vim' "The One Dark Theme
Plug 'mbbill/undotree' "Creates an undo tree
Plug 'preservim/nerdtree' "File browser inside vim
Plug 'ryanoasis/vim-devicons' "Cool icons for nerd tree
Plug 'Xuyuanp/nerdtree-git-plugin' "nerd tree customization
Plug 'vimwiki/vimwiki'
call plug#end()

" Startup Settings

  let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'markdown', 'ext': 'md'}]
	syntax on
  let mapleader="," "Maps Leader to ','
  let NERDTreeShowHidden=1
  let g:auto_save = 1
  let g:auto_save_events = ["InsertLeave", "TextChanged"]
  set mouse=a "Allows mouse usage inside vim. Great for noobs.
  "The clipboard option requires a vim verson which is buld with clipboard setting like neovim
  set clipboard=unnamedplus "Remaps default copy paste to system clipboard
  set cursorline
  highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
  
  "Setting for tabs
  set tabstop=2 softtabstop=2
	set shiftwidth=2
	set expandtab

  "Settings for fold's
  set nofoldenable
	set nowrap

  set ignorecase "for settings the option to ignore case while searching
	set noswapfile "for not making a backup file if the package/app/command wants to 
  set incsearch "for highlighting the text in half-written word in search command 
	set history=500
	set nocompatible "for making vim not comfortable with vi and allowing it to work on its own 
  
  set number relativenumber
  colorscheme onedark 

  set background=dark

  filetype plugin on " Enable plugins and load plugin for the detected file type.
	set encoding=utf-8

  "for setting the auto completion of commands
	set wildmenu
	set wildmode=longest,list,full

	set laststatus=2 "for the nice looking line you see coloured in the bottom

  "For setting the color in gui mode
	if !has('gui_running')
	  set t_Co=256 "t_Co -- is a terminal option to set the number of colors
	endif

	set spell spelllang=en_us
  "Some notes on how to use spell check in ( Normal Mode )
  "Press ]s for getting to the next wrong spell
  "Press [s for getting backwards for spell checking
  "Press z= for getting suggestion for the wrong spell

" Plugin Shortcuts
  " <silent> means do not display output.
  " <CR> (carriage return) is like pressing the enter key.

" For splitting the window use split [file name] for horizontal split and for vertical split use vsplit [file name]
  " You can split the window in Vim by typing :split or :vsplit.
  " Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
	nnoremap <c-j> <c-w>j
  nnoremap <c-k> <c-w>k
  nnoremap <c-h> <c-w>h
  nnoremap <c-l> <c-w>l
 

 " Resize split windows using arrow keys by pressing:
 " CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
  noremap <c-up> <c-w>+
  noremap <c-down> <c-w>-
  noremap <c-left> <c-w>>
  noremap <c-right> <c-w><
  
  map <Leader>f :NERDTreeToggle<CR>
  nnoremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
  inoremap jj <Esc>
  let g:better_escape_shortcut = 'jj'
  let g:better_escape_interval = 250

  "For saving and running your script 
  nmap <Leader>r :w<CR>:so %<CR>

  " For Tabs
  "for movement of tabs for 1 to 5
  nnoremap <Leader>1 1gt<CR>
  nnoremap <Leader>2 2gt<CR>
  nnoremap <Leader>3 3gt<CR>
  nnoremap <Leader>4 4gt<CR>
  nnoremap <Leader>5 5gt<CR>
  "for opening and closing tabs
  nnoremap <Leader>t :tabnew<CR>
  nnoremap <Leader>c :tabclose<CR>

" Markdown auto format tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  "setlocal: This sets an option for the current buffer (file) only, without affecting other buffers.
  "formatoptions-=c: This removes the 'c' flag from the 'formatoptions' setting. In Vim, 'formatoptions' is a setting that controls the automatic formatting of text as you type. The 'c' flag is related to comments.
  "formatoptions-=r: This removes the 'r' flag from 'formatoptions', which is related to automatically inserting the comment leader when you press Enter in insert mode after a line that starts with a comment.
  "formatoptions-=o: This removes the 'o' flag from 'formatoptions', which is related to automatically inserting the comment leader when a new line is opened below a line that starts with a comment.
  
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
"vimenter *: This autocmd triggers when Vim has fully started and entered into normal mode. The * wildcard means it applies to any file type.
"hi Normal: This is short for highlight Normal. It specifies the highlighting for the "Normal" mode, which is the default mode in Vim where you can navigate and manipulate text.
"guibg=NONE: This sets the background color for the "Normal" mode in GUI (Graphical User Interface) Vim to "NONE", which means it will use the default background color of the GUI.
"ctermbg=NONE: This sets the background color for the "Normal" mode in the terminal version of Vim to "NONE", which means it will use the default background color of the terminal.


