" Mephux <dustin.webber[at]gmail.com> 
" ~/.VIMRC

set nocompatible                   " Must come first because it changes others
set shell=/bin/sh

set encoding=utf-8

" Setup Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on         " Turn on file type detection.
syntax on                         " syntax highlighting

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2
set synmaxcol=2048                " Syntax coloring lines that are too
                                  " long just slows down the world

set t_Co=256                      " 256 colors

set background=dark
colorscheme epix
match LongLineWarning '\%>80v.\+'

set autoread
set winfixwidth
set ttyfast                       " you have a fast terminal
set ttyscroll=3
set lazyredraw                    " avoid scrolling problems

" Windowing settings
set equalalways                   " keep windows equal when splitting (default)
set eadirection=both              " ver/hor/both - where does equalalways apply
set winheight=10                  " height of current window
set winwidth=80                   " width of current window

set showcmd
set laststatus=2                  " Show the status line all the time

set autoindent                    " automatic indent new lines
set smartindent                   " be smart about it
set nowrap                        " do not wrap lines
set softtabstop=2                 " yep, two
set shiftwidth=2                  " ..
set tabstop=2
set expandtab                     " expand tabs to spaces
set nosmarttab                    " no tabs
set formatoptions=qrn1            " support for numbered/bullet lists
set virtualedit=block             " allow virtual edit in visual block mode

" Mark the ideal max text width
if exists('+colorcolumn')
  set colorcolumn=80
endif

" On Focus Lost
" Enter normal mode
"au FocusLost * :wa

" On Focus Lost
" Enter normal mode
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

" Awk
nnoremap <leader>a :Ack<Space>

" MacVIM shift+arrow-keys behavior (required in .vimrc)
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
  set selection=exclusive
endif

set foldmethod=indent             " Folding settings
set foldnestmax=3                 " deepest fold is 3 levels
set nofoldenable                  " dont fold by default
set showmode                      " Display the mode you're in.
set modelines=0
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set wildmenu                      " Enhanced command line completion.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains
                                  " a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

" set wrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

" Terminal settings
set vb t_vb=		                  " shut off bell entirely; see also .gvimrc
set title                         " Set the terminal's title
set visualbell                    " No beeping.

set undofile
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup

" Hide the mouse pointer while typing
set mousehide

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" delimitMate 
" let loaded_delimitMate = 1
" let delimitMate_excluded_ft = "javascript"

" CtrlP configuration
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.DS_Store$\|.swp$'
" set wildignore+=.git\*,.hg\*,.svn\*                " for Windows
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows

" :Extradite - Git log viewer
map <Leader>o :Extradite!<CR>

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup
" Keep swap files in one location
" +=,$HOME/.vim/tmp/
set directory=$HOME/.vim/tmp/,.

" Hide the mouse pointer while typing
set mousehide

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

" :Extradite - Git log viewer
map <Leader>o :Extradite!<CR>

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Zencoding Keymap
let g:user_zen_expandabbr_key = '<D-e>'

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Quickly edit/reload the vimrc file
nmap <silent> <leader>v :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Edit .gvimrc
nmap <leader>g :tabedit $MYGVIMRC<CR>

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Node/EJS
au BufRead,BufNewFile *.ejs set ft=html

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"nerdtree settings
map <Leader>p :NERDTree<Enter>
let g:NERDTreeMouseMode = 2
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowBookmarks=0
let g:NERDTreeWinSize = 30
let NERDTreeHighlightCursorline=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0

" Gundo Change View
map <Leader>z :GundoToggle<Enter>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

" BuffergatorToggle
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_suppress_keymaps = 1
let g:buffergator_split_size = 20
map <leader>b :BuffergatorToggle<Enter>

nmap <D-b> :SCCompile<cr> 
nmap <D-r> :update<CR>:SCCompileRun<cr>
vmap <D-r> :update<CR>:SCCompileRun<cr>
imap <D-r> <Esc>:SCCompileRun<cr>

" vim-pasta
let g:pasta_disabled_filetypes = ['yaml']
let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']

" Force Save
cmap w!! w !sudo tee % >/dev/null

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby set foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd filetype svn,*commit* setlocal spell

" Status Line Setup
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\

" Git branch and status
set statusline+=%{fugitive#statusline()}

" Display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" Column/Line Information
set statusline+=%=%-10(\ %l,%c-%v\ %)
set statusline+=\ %P "percent through file

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Highlight the current line and column Don't do this - It makes window
" redraws painfully slow
set nocursorline 
set nocursorcolumn

" Remove Ex mode Replace with a format helper
nnoremap Q gqip

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
augroup END

" Navigation
" CHANGE DEFAULT ALT+LEFT/RIGHT
map <M-Right> w
map <M-Left> b

map <S-A-Up> <S-[>
map <S-A-Down> <S-]>

" Change Shift Select
vmap <S-A-Right> e
vmap <S-A-Left> b

imap <S-A-Right> <ESC>l<C-g><S-M-Right>
imap <S-A-Left> <ESC><C-g><S-M-Left>

nmap <S-A-Right> i<S-Right><C-g><S-M-Right>
nmap <S-A-Left> a<S-Left><C-g><S-M-Left>

" Buffer Navigation
map <S-C-Right> :bn!<CR>
map <S-C-Left> :bp!<CR>

" Better ragtag default
imap <D->> <C-X>=

