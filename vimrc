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
set winwidth=85                   " width of current window

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

" Yank text to the OS X clipboard
map <leader>y "*y
map <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
" noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" On Focus Lost
" Enter normal mode
" au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

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

" CtrlP configuration
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.DS_Store$\|.swp$'

" :Extradite - Git log viewer
map <Leader>o :Extradite!<CR>

" Awk
nnoremap <leader>f :Ack<Space>

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup

" Keep swap files in one location
" +=,$HOME/.vim/tmp/
set directory=$HOME/.vim/tmp/,.

" Hide the mouse pointer while typing
" set mousehide

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" :Extradite - Git log viewer
map <Leader>o :Extradite!<CR>

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Quickly edit/reload the vimrc file
nmap <silent> <leader>v :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Node/EJS
au BufRead,BufNewFile *.ejs set ft=html

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Bubble multiple lines
vmap <C-Down> ]egv
vmap <C-Up> [egv

" Tagbar
map <Leader>t <ESC>:TagbarToggle<cr>

" Nerdtree settings
map <Leader>p :NERDTree<Enter>
let g:NERDTreeMouseMode = 2
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowBookmarks=0
let g:NERDTreeWinSize = 30
let NERDTreeHighlightCursorline=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0

" BuffergatorToggle
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_suppress_keymaps = 1
let g:buffergator_split_size = 20
map <leader>b :BuffergatorToggle<Enter>

nmap <Leader>B :SCCompile<cr>
nmap <Leader>r :update<CR>:SCCompileRun<cr>
vmap <Leader>r :update<CR>:SCCompileRun<cr>
imap <Leader>r <Esc>:SCCompileRun<cr>

" vim-pasta
let g:pasta_disabled_filetypes = ['yaml']
" let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']

" Force Save
cmap w!! w !sudo tee % >/dev/null

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby set foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd filetype svn,*commit* setlocal spell

" Smartusline
let g:smartusline_string_to_highlight = '%f'
let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=58 ctermfg=black'
let g:smartusline_hi_virtual_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_normal = 'guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black'

" Status Line Setup
set statusline=[%n]\ %<%f\ %h%w%m%r%y

" Git branch and status
set statusline+=\ %{fugitive#statusline()}

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

nmap <C-j> }
nmap <C-K> {

nmap <C-Left> ^
nmap <C-Right> $

nmap <A-Left> b
nmap <A-Right> w

nmap <A-Up> {
nmap <A-Down> } 

" Command-/ to toggle comments
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
map <Leader>c <plug>NERDCommenterToggle<CR>

" QuickFix Navigation
map <c-z> :cprevious<CR>
map <c-x> :cnext<CR>

" Ruby Debug
" let g:ruby_debugger_progname = 'mvim'
" map <Leader>B  :call g:RubyDebugger.toggle_breakpoint()<CR>
" map <Leader>V  :call g:RubyDebugger.open_variables()<CR>
" map <Leader>M  :call g:RubyDebugger.open_breakpoints()<CR>
" map <Leader>T  :call g:RubyDebugger.open_frames()<CR>
" map <Leader>S  :call g:RubyDebugger.step()<CR>
" map <Leader>F  :call g:RubyDebugger.finish()<CR>
" map <Leader>N  :call g:RubyDebugger.next()<CR>
" map <Leader>C  :call g:RubyDebugger.continue()<CR>
" map <Leader>E  :call g:RubyDebugger.exit()<CR>

map [1;5A <C-Up>
map [1;5B <C-Down>
map [1;2D <S-Left>
map [1;2C <S-Right>
cmap [1;2D <S-Left>
cmap [1;2C <S-Right>
