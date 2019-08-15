"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Zheng — @amazingzyj
"
"       Install the awesome version from:
"
"           https://github.com/amazingzyj/vimrc
"
"		To use it, copy it to
"			for Linux: ~/.vimrc
"			for Windows: $VIM\_vimrc
"
"
" Sections:
"    -> Vundle config
"    -> General
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> Mapleader Combinations
"    -> Plugin configuration
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This must be first, beacuse it changes other options as a side effect.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('$VIM/vimfiles/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Bundle list
Bundle 'taglist.vim'  
Bundle 'scrooloose/nerdtree' 
Bundle 'scrooloose/nerdcommenter'
Bundle 'msanders/snipmate.vim'
"Bundle 'minibufexpl.vim'
"Bundle 'tomasr/molokai'

"Bundle 'Shougo/neocomplcache.vim' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"----------------------------------------------------------------------------------------------------


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"the vimrc_example configs
"not totally the same actually
"for details, check the vimrc_example.vim file
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
if has("autocmd")
"	filetype plugin indent on
	augroup vimrcEx
	au!
	autocmd FileType text setlocal textwidth=278
	autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
	augroup END
else
	set autoindent
endif 
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"end of vimrc_example config

winpos 200 200      " 设置初始界面位置
set lines=36 columns=200 
                    " 设置初始界面大小

set history=500     " Sets how many lines of history VIM has to remember
set ruler           " Always show current position
set showcmd
set mouse=a

set number          " show the line number
"set relativenumber	" show the relative line number, a 7.3 new feature

" 
set shortmess=atI   " set the message mode
set go=             " set no tool-bar, tool-menu or speed-bar

set backspace=eol,start,indent 
                    " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

set ignorecase      " Ignore case when searching
set smartcase       " When searching try to be smart about cases

set hlsearch        " Highlight search results
set incsearch       " Makes search act like search in modern browsers
"set nohls           " set on high-light search

set lazyredraw      " Don't redraw while executing macros (good performance config)
set magic           " For regular expressions turn magic on

" Enable filetype plugins
filetype plugin on
filetype indent on


set browsedir=buffer " Make GUI file Open use current directory.
set autochdir       " Auto switch to the current file directory

set so=7            " Set 7 lines to the cursor - when moving vertically using j/k
"set scrolloff=3     " Set 3 lines left at top/bottom when moving with j/k.

" set foldmethod
set foldmethod=indent
set foldlevel=99

set gcr=a:blinkon0  " set no cursor blinking


" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


set cmdheight=2     " Height of the command ba

set hid             " A buffer becomes hidden when it is abandoned


set showmatch       " Show matching brackets when text indicator is over them
set mat=2           " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable       " Enable syntax highlighting

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" for linux
"set guifont=Consolas\ 9 " set the font and font-size
"set gfw=YouYuan\ 11     " set Chinese font
" for windows
set guifont=Consolas:h9 " set the font and font-size
"set gfw=YouYuan:h11     " set Chinese font

" Set the encoding system, Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

language messages zh_CN.utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup " Turn backup off, since most stuff is in SVN, git et.c anyway...
set autoread    " Set to auto read when a file is changed from the outside
"set lazyredraw " do not redraw when running macros 
set nowritebackup " set backup off
"set nowb		" nowritebackup
set noswapfile
set scrolloff=3 " set 7 lines left at top/bottom when moving with j/k



" Set session file for recover last work window.
" Auto save session in $VIM\Session.vim when quit vim.
" Hit <F4> to recover session.
set sessionoptions=curdir, tabpages "",resize
"let $VIMSESSION = '~/Session.vim'
let $VIMSESSION = '$VIM\Session.vim'
autocmd VimLeave * mks! $VIMSESSION
nmap <silent> <F4> :so $VIMSESSION<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines




""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2    " Always show the status line
set wildmenu        " Turn on the Wild menu
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
                    " Format the status line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" for formatting
map Q gq

inoremap <C-U> <C-G>u<C-U>

"Toggle Menu and Toolbar
map <silent> <F2> :if &guioptions =~# 'm'<Bar>set guioptions-=m<Bar>set guioptions-=T<Bar>else<Bar>set guioptions+=m<Bar>set guioptions+=T<Bar>endif<CR>
nmap <silent> <F9> :syntax clear<CR>
nmap <silent> <F10> :syntax on<CR>

" ctrl+n to do the word traversal
nmap <C-N> *
" '' to insert a blank line below
nnoremap <Space> o<ESC>k
" jump short lines
nnoremap j gj
nnoremap k gk
" cursor move in insert mode
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>
" map <c-d> to <c-h> to delete a character 
inoremap <C-D> <C-H>
" map <c-s> to <c-d> to delete a shifwidth
inoremap <C-S> <C-D>
" fast move
inoremap <C-F> <C-Right>
inoremap <C-B> <C-Left>
inoremap <C-Q> <Home>
inoremap <C-Z> <End>
"browser alike tab switching 
nnoremap <C-S-TAB> gT
nnoremap <C-TAB> gt
"fast window switching
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" map <c-z> to redraw the window
nnoremap <C-Z> <C-L>
"******** parenthesis expanding
"******** auto fill the bracket
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
""inoremap < <><Left>
""inoremap ' ''<Left>
inoremap " ""<Left>
inoremap “ “”<Left>
"inoremap /* /**/<Left><Left>

""use the real regexp
nnoremap / /\v
nnoremap ? ?\v



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapleder Combinations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"file&buffer operation shortcuts
"
" ",o" to do :e command. With file arg
nmap <leader>o :edit 
	""----> ",os" to do :split command. With no file arg
	""---->already exist, the same as <c-w> s
	""---->abandon this one
	""nmap <leader>os :split<CR>
	" ",os" to do :split command. With file arg
	" nmap <leader>os :split 
	""----> ",ov" to do :vsplit command. With no file arg
	""---->already exist, the same as <c-w> v
	""---->abandon this one
	""nmap <leader>ov :vsplit<CR>
	" ",ov" to do :vsplit command. With file arg
	" nmap <leader>ov :vsplit

" ",tn" to do :split command. With no file arg
nmap <leader>tn :tabnew 
" ",s" or ",w" to do :split command. With file arg
	" nmap <leader>s :write<CR>
	" the slow stroke of ,s woudle mis-operate to 
	" delete a char...

" Fast saving
nmap <leader>w :write<CR>
nmap <c-s> :write<CR>

nmap <leader>q :q<CR>
nmap <leader><CR> :noh<CR>

" ",h <arg>" to vertically open the help window
nmap <leader>h :vertical help  

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" ",h <arg>" to vertically open the help window
nmap <leader>h :vertical help  
" --->end 

" windows clipboard interface
nmap <leader>a ggVG
vmap <leader>y "+y
nnoremap <leader>p "+p

nmap <c-a> ggVG

" set the format of the <c-a>,<c-x> operation
set nrformats-=octal
"set nrformats+=alpha

" the vimrep tool use
nmap <leader>vg :vimgrep 
nmap <leader>vc :cn<CR>

" buffer switch
nmap <leader><leader> :bnext<cr>
nmap <leader>. :bNext<cr>

" Ctags configuration
" it is nothing complex but a key map
""nmap <F9> :!ctags -R *<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ++++++> NERD_tree configuration <++++++
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>
nmap <leader>nc :NERDTreeCWD<CR>
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.pyc$','\.svn$','\.tmp$','\.bak$','\.bsf$','\.stp$','\.rpt$','\.summary$','\~$']
let NERDTreeSortOrder = ['\/$','\.svn$','\.svh$','\.sv$','\.py$']

" ++++++> Taglist configuration <++++++
let Tlist_Ctags_Cmd='E:\ctags.exe'
let Tlist_Compact_Format = 1 " show small menu
let Tlist_Show_One_File = 1 "Show single file tags only
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "name" " order by
let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_GainFocus_On_ToggleOpen = 1 " switch the cursor to taglist window on opening
" On opening
nmap <silent> <F8> :TlistToggle<CR>

"" ++++++> NERDCommenter configuration <++++++
" seemed three is no need to configure
" what a pulgin

"" ++++++> SnipMate configuration <++++++
"let g:snippets_dir = '$VIM/vimfiles/bundle/snipmate.vim/snippet/'
"let g:snippets_dir = 'E:/Program Files/Vim/vimfiles/bundle/snipmate.vim/snippets/'
let g:snips_author = 'Amazingyj'

"" ++++++> Neocomplcache configuration <++++++
" picked from neocomplcache-examples
	" i didn't use any 'AutoComplPop', ok?
	" let g:acp_enableAtStartup = 0
" let g:neocomplcache_enable_insert_char_pre = 1
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
" inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
" inoremap <expr><C-Left>  neocomplcache#close_popup() . "\<C-Left>"
" inoremap <expr><C-Right> neocomplcache#close_popup() . "\<C-Right>"
" inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
" inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" inoremap <expr><Home>  neocomplcache#close_popup() . "\<Home>"
" inoremap <expr><End> neocomplcache#close_popup() . "\<End>"


"" ++++++> Minibuf configuration <++++++
"so $VIM\vimfiles\bundle\minibufexpl.vim\plugin\minibufexpl.vim

" file type switch
	" .vt would be a verilog testbench file
au BufNewFile,BufRead *.vt set filetype=verilog
	" .md or .mkd would be a markdown file
au BufRead *.md set filetype=markdown


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" the Vundle requires this line to recover
filetype plugin indent on






inoremap <C-U> <C-G>u<C-U>

">>>>>>>>>>>>>>>>>source $VIMRUNTIME/mswin.vim
"
"the mswin configs
"not totally the same, check mswin.vim file for detail
" set the 'cpoptions' to its Vim default
if 1	" only do this when compiled with expression evaluation
  let s:save_cpo = &cpoptions
endif
set cpo&vim
behave mswin
vnoremap <C-S>		<C-C>:update<CR>
" inoremap <C-S>		<C-O>:update<CR>
" restore 'cpoptions'
set cpo&
if 1
  let &cpoptions = s:save_cpo
  unlet s:save_cpo
endif
"end of mswin configs
"
"
set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

