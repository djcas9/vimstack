" Vim Configuration

" The Basics
set nocompatible
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8

filetype off

" vim-plug - Plugin Managment
call plug#begin('~/.vim/plugged')

Plug 'fidian/hexmode'
" Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-abolish'
Plug 'terryma/vim-expand-region'
Plug 'mustache/vim-mustache-handlebars'
Plug 'molok/vim-smartusline'
Plug 'kana/vim-smartinput'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'
" Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'

Plug 'tpope/vim-ragtag'
Plug 'vim-scripts/SingleCompile'
Plug 'int3/vim-extradite'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-register'
Plug 'tacahiroy/ctrlp-funky'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mephux/custom-vim-snippets'
Plug 'tommcdo/vim-lion'
Plug 'bruno-/vim-vertical-move'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-gtfo'
Plug 'wellle/targets.vim'
Plug 'zhaocai/GoldenView.Vim'
Plug 'othree/html5.vim'
Plug 'vim-scripts/gitignore'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tommcdo/vim-exchange'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
Plug 'mephux/vim-jsfmt'
Plug 'vim-scripts/ZoomWin'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-obsession'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'cespare/vim-toml'

Plug 'mileszs/ack.vim'

" css
Plug 'JulesWang/css.vim'
Plug 'othree/csscomplete.vim'

Plug 'tpope/vim-afterimage'
Plug 'ompugao/uncrustify-vim'
Plug 'mxw/vim-jsx'

Plug 'rust-lang/rust.vim'

" this will fail if you use gimme or some other
" go version control tool
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
" /usr/bin/python ~/.vim/plugged/YouCompleteMe/third_party/ycmd/build.py --clang-completer --gocode-completer --tern-complete

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" # vim:filetype=i3
Plug 'PotatoesMaster/i3-vim-syntax'

call plug#end()

" Turn on file type detection.
filetype plugin indent on

" syntax highlighting
syntax on

" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256

" Don't syntax highlight long lines
set synmaxcol=256"

" Enable VIM mouse support
set mouse=a
set ttymouse=xterm2

" Set system shell
set shell=$SHELL

" Exit insert mode timeout
set ttimeoutlen=50
set timeout timeoutlen=1000 ttimeoutlen=100

" read/write a .viminfo file, don't store more
set viminfo='20,\"80


" Automatically re-read files changed outside
set autoread
set copyindent

" you have a fast terminal
set ttyfast
set ttyscroll=3

" avoid scrolling problems
set lazyredraw

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Windowing settings
" set winfixwidth

" no visual bell
set novb

" ver/hor/both - where does equalalways apply
set eadirection=hor
set winheight=10
set winminheight=10
set winheight=999

set showcmd
set laststatus=2                  " Show the status line all the time
set autoindent                    " automatic indent new lines
set smartindent                   " be smart about it
set nowrap                        " do not wrap lines
set showbreak=↪\                  " Character to precede line wraps
set softtabstop=2                 " yep, two
set shiftwidth=2                  " ..
set tabstop=2
set expandtab                     " expand tabs to spaces
set nosmarttab                    " no tabs
set formatoptions=qrn1            " support for numbered/bullet lists
set virtualedit=block             " allow virtual edit in visual block mode

set foldmethod=manual             " Folding settings
set foldlevel=99
set foldnestmax=3                 " deepest fold is 3 levels
set nofoldenable                  " dont fold by default
set showmode                      " Display the mode you're in.
set modelines=0
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.

" Tab completion
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set completefunc=youcompleteme#Complete
set completeopt=preview,menuone

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains
" a capital letter.

" set relativenumber
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" set wrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set showbreak=↪\ \ 		" string to put before wrapped screen lines

" Terminal settings
set vb t_vb=		                  " shut off bell entirely; see also .gvimrc
set title                         " Set the terminal's title
set visualbell                    " No beeping.

" Set the vim color schema
colorscheme mephux

" Set terminal and force 256 colors
set term=xterm-256color
set t_Co=256
let &t_Co=256

set noswapfile

" Ensure the temp dirs exist
if !isdirectory($HOME . "/.vim/tmp")
  call system("mkdir -p ~/.vim/tmp/swap")
  call system("mkdir -p ~/.vim/tmp/backup")
  call system("mkdir -p ~/.vim/tmp/undo")
endif

" dd wont overwrite the last yank
" map dd to the black hole register
nnoremap d "_d
vnoremap d "_d

" Keep swap files in one location
" +=,$HOME/.vim/tmp/
set directory=$HOME/.vim/tmp/,.
set dir=~/.vim/tmp/swap/
set backupdir=~/.vim/tmp/backup/

" if version >= 703
  " Persistent Undo
  set undofile
  set undolevels=10000     " numbers of particular undos to save
  set undoreload=100000    " number of undo lines to save
  set undodir=~/.vim/tmp/undo/
" endif

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup

" Don't reset cursor to start of line when moving around
set nostartofline

" Do not jump to the matching bracket upon bracket insert (default)
set noshowmatch

" Don't back up temp files
set backupskip=/tmp/*,/private/tmp/*

" Don't save other tabs in sessions (as I don't use tabs)
set sessionoptions-=tabpages
" Don't save help pages in sessions
set sessionoptions-=help
" Don't save hidden buffers -- only save the visible ones.
set sessionoptions-=buffers

" Hide the mouse pointer while typing
set mousehide

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Mark the ideal max text width
if exists('+colorcolumn')
  set colorcolumn=80
  " highlight ColorColumn ctermbg=magenta
  " call matchadd('ColorColumn', '\%81v', 100)
endif

" clipboard
set clipboard=unnamedplus

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup


" Hide the mouse pointer while typing
set mousehide

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Status Line Setup
set statusline=
set statusline+=%<\ " cut at start
set statusline=[%n]\ [%<%f]\ %h%w%m%r

set stl+=\[b%n/%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}\]

" Git branch and status
set statusline+=\%{exists('g:loaded_fugitive')?fugitive#statusline():''}


set statusline+=%=%#error#
set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
set statusline+=%*\%=%#error#

" Display a warning if &paste is set
set statusline+=%{&paste?'[paste]':''}
set statusline+=%* 

" If you have more room for metadata - uncomment
" set statusline+=%=\ [%{&ff}]
" set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
" set statusline+=\ %y

" Column/Line Information
set statusline+=\ [%P\ %l/%L\ %vc\]\ " percent through file

" VimIndentLine
let g:indentLine_color_term = 234
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '┆'

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:\┆\ ,eol:¬

" Highlight the current line and column Don't do this - It makes window
" redraws painfully slow
set cursorline
set nocursorcolumn

" C Stuff
" path to uncrustify configuration file
let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"
autocmd FileType c noremap <buffer> <c-f> :call uncrustify#UncrustifyAuto()<CR>
autocmd FileType c vnoremap <buffer> <c-f> :call uncrustify#UncrustifyAuto()<CR>

" GO Configuration
" autocmd FileType go autocmd BufWritePre <buffer> Fmt
let g:go_bin_path = expand("$GOPATH/bin")
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4"
let g:go_highlight_extra_types = 1
let g:go_disable_autoinstall = 1
let g:go_fmt_command = "goimports"

" GO YCM
let g:ycm_gocode_binary_path = "$GOPATH/bin/gocode"
let g:ycm_godef_binary_path = "$GOPATH/bin/godef"

" Turn on more syntax sauce
let g:go_highlight_generate_tags = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1

augroup filetypedetect_go
  au Filetype go nnoremap <leader>gd :vsp <CR>:exe "GoDef" <CR>
  au Filetype go nnoremap <leader>gc :vsp <CR>:exe "GoCallees" <CR>
  " au Filetype go nnoremap <leader>gr :vsp <CR>:exe "GoReferrers" <CR>
  " au Filetype go nnoremap <leader>gimp :vsp <CR>:exe "GoImplements" <CR>
  au Filetype go nnoremap <leader>gdt :tab split <CR>:exe "GoDef"<CR>
  au FileType go nmap <Leader>gi <Plug>(go-info)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>gr <Plug>(go-rename)
augroup END

" CSS Options
autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci

" Highlight Pointers
syn match goOperator /\s\?\*\w\+\.\w\+/

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Open help in a vertical split instead of the default horizontal split
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>"

" Expand %% to current directory
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-,>'
" let g:multi_cursor_skip_key='<C-s>'
let g:multi_cursor_quit_key='<Esc>'

" A vim plugin that simplifies the transition 
" between multiline and single-line code
nmap sj :SplitjoinSplit<cr> 
nmap sk :SplitjoinJoin<cr>

" Preserve indentation while pasting text from the OS X clipboard
map <leader>p :set invpaste<CR>
" noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Win dow Resize
" if bufwinnr(1)
"   map + <C-W>10<
"   map - <C-W>10>
" endi

" Zencoding Keymap - Linux/Windows/Terminal
let g:user_emmet_expandabbr_key = '<C-e>'

" ## Crazy Movment Stuff
set selection=exclusive           " Select

" # Window Movment
map <S-Down> <C-W>j
map <S-Right> <C-W>l
map <S-Left> <C-W>h
map <S-Up> <C-W>k

"map <S-Left> ^
"map <S-Right> $
"imap <S-Left> <ESC>I
"imap <S-Right> <ESC>A

" map <S-Up> gg
" map <S-Down> G

map <Leader>w <ESC>:w<CR>

nmap <silent> <C-Left> b
nmap <silent> <C-Right> w

" nmap <C-Right> <Plug>(expand_region_expand)
" nmap <C-Left> <Plug>(expand_region_shrink)


vmap <C-Right> w
vmap <C-Left> b
" vmap <C-Right> <Plug>(expand_region_expand)
" vmap <C-Left> <Plug>(expand_region_shrink)

imap <silent> <C-Left> <ESC>b
imap <silent> <C-Right> <ESC>w

nmap <silent> <C-h> b
nmap <silent> <C-l> w
vmap <silent> <C-h> b
vmap <silent> <C-l> w

nmap <silent> <C-j> }
nmap <silent> <C-k> {
vmap <silent> <C-j> {
vmap <silent> <C-k> }

nmap <silent> <C-Up> :<C-U>call vertical_move#Up('', v:count1)<CR>
nmap <silent> <C-Down> :<C-U>call vertical_move#Down('', v:count1)<CR>
vmap <silent> <C-Up> :<C-U>call vertical_move#Up('v', v:count1)<CR>
vmap <silent> <C-Down> :<C-U>call vertical_move#Down('v', v:count1)<CR>

imap <silent> <C-Up> <ESC> :<C-U>call vertical_move#Down('v', v:count1)<CR>
imap <silent> <C-Down> <ESC> :<C-U>call vertical_move#Down('', v:count1)<CR>


" Default - V Expand
if !exists('g:expand_region_text_objects')
  " Dictionary of text objects that are supported by default. Note that some of
  " the text objects are not available in vanilla vim. '1' indicates that the
  " text object is recursive (think of nested parens or brackets)
  let g:expand_region_text_objects = {
        \ 'iw'  :1,
        \ 'iW'  :1,
        \ 'i"'  :1,
        \ 'i''' :1,
        \ 'i]'  :1,
        \ 'ib'  :1,
        \ 'iB'  :1,
        \ 'ip'  :1,
        \}
endif

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Comment
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERD_javascript_alt_style = 1
" let g:NERDCustomDelimiters = {
      " \ 'javascript': { 'left': '/*', 'right': '*/', 'leftAlt': '//' }
      " \ }
" let g:NERDDefaultAlign = 'start'
map <C-c> <plug>NERDCommenterToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Get rid of Ex mode
nnoremap Q nop

" GoldenView
let g:goldenview__enable_default_mapping=0

" YCM
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_error_symbol = 'XX'
let g:ycm_warning_symbol = '!!'
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" CtrlP configuration
let g:ctrlp_funky_go_types = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 200
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
let g:ctrlp_by_filename = 1
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*   " for Linux/MacOSX
let g:ctrlp_custom_ignore = 'Godeps/*$\|\.git$\|\.hg$\|\.svn$\|\.DS_Store$\|\.swp$\|node_modules/*$\|vendor/*$'
let g:ctrlp_extensions = ['funky']

nnoremap <Leader>f :CtrlPFunky<Cr>
nnoremap <Leader>b :CtrlPBuffer<Cr>
nnoremap <Leader>r :CtrlPRegister<Cr>

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
imap     <C-F>t <Esc>:CtrlSFToggle<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
nnoremap <C-F>o :CtrlSFOpen<CR>


let g:ctrlp_use_caching = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:ackprg = 'ag --vimgrep'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = ['ag %s -l --nocolor -g ""']
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" :Extradite - Git log viewer
map <Leader>o :Extradite<CR>
let g:extradite_resize = 0

" clear the search buffer when hitting return
:nnoremap <leader>c :nohlsearch<cr>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" GitGutter
let g:gitgutter_diff_args = '-w'

" SnipMate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['handlebars'] = 'html'

" YCM
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" Supertab Configs
let g:SuperTabDefaultCompletionType = "<C-n>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1


" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Ultisnips
let g:UltiSnipsEditSplit="vertical"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>v :tabedit $MYVIMRC<CR>
nmap <silent> <leader>cs :tabedit ~/.vim/colors/mephux.vim<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>n :tabedit ~/.notes.md<CR>

nmap <silent> <leader>ac :tabedit ~/.vim/autocorrect.vim<CR>
source ~/.vim/autocorrect.vim

" For quick and dirty snippets
" nmap <silent> <leader>ss :tabedit ~/.vim/bundle/custom-vim-snippets/snippets/_.snippets<CR>
nmap <silent> <leader>ss :UltiSnipsEdit<CR>

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Markdown files
au BufRead,BufNewFile *.md set ft=markdown

" Node/EJS
au BufRead,BufNewFile *.ejs set ft=html

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" JSX/React
let g:jsx_ext_required = 0

" Tagbar
map <Leader>T :TagbarToggle<Enter>

" Nerdtree settings
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
map <Leader>t :NERDTreeToggle<Enter>
let g:NERDTreeMouseMode = 2
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowBookmarks=0
let g:NERDTreeWinSize = 30
let NERDTreeHighlightCursorline=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2

" call SingleCompile#ChooseCompiler('c', 'cc')
nmap <Leader>B :SCCompile<cr>
nmap <Leader>R :update<CR>:SCCompileRun<cr>
vmap <Leader>R :update<CR>:SCCompileRun<cr>
imap <Leader>R <Esc>:SCCompileRun<cr>

" ignore Ex mode

nnoremap Q <nop>

" Force Save
cmap w!! w !sudo tee % >/dev/null

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby set foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd filetype svn,*commit* setlocal spell
autocmd FileType c set sw=4 sts=4 et

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

augroup ft_javascript
  au!
  au FileType javascript setlocal foldmethod=marker
  au FileType javascript setlocal foldmarker={,}
augroup END


" Caps Lock
nmap <Leader>cc <Plug>CapsLockToggle

" QuickFix Navigation
" map <c-z> :cprevious<CR>
" map <c-x> :cnext<CR>

" Quickfix (open/close using <leader>f)
nmap <silent> <leader>q :QFix<CR>
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

" Quick yanking to the end of the line
nmap Y ^y$
vnoremap <expr>y "my\"" . v:register . "y`y"
vnoremap <expr>Y "my\"" . v:register . "Y`y"

" Folding
nnoremap <Space> za
vnoremap <Space> za

" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Targets
" g:targets_aiAI
" g:targets_nlNL
" g:targets_pairs
" g:targets_quotes
" g:targets_separators
" g:targets_tagTrigger
" g:targets_argTrigger
" g:targets_argOpening
" g:targets_argClosing
" g:targets_argSeparator
" g:targets_seekRanges
" g:targets_jumpRanges

" Yankring
" let g:yankstack_map_keys = 0
" nmap <leader>1 <Plug>yankstack_substitute_older_paste
" nmap <leader>2 <Plug>yankstack_substitute_newer_paste

" Register Stuff
vmap <Leader>1 "1y
vmap <Leader>2 "2y
nmap <Leader>\1 "1p
nmap <Leader>\2 "2p

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
" nnoremap <leader>1 yyPVr=jyypVr=
" nnoremap <leader>2 yyPVr*jyypVr*
" nnoremap <leader>3 yypVr=
" nnoremap <leader>4 yypVr-
" nnoremap <leader>5 yypVr^
" nnoremap <leader>6 yypVr"

" Git Stuff
nmap <leader>gs :Gstatus<CR><C-w>20+
nmap <leader>gp :Gpush<CR><C-w>20+

" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>N :call RenameFile()<cr>

" Show the MD5 of the current buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -range MD5 :echo system('echo '.shellescape(join(getline(<line1>, <line2>), '\n')) . '| md5')
nmap <Leader>\m :MD5<CR>

" smartusline
let g:smartusline_string_to_highlight = '%f'
let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=119 ctermfg=black'
let g:smartusline_hi_virtual_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_normal = 'guibg=#95e454 guifg=black ctermbg=108 ctermfg=black'


" Show syntax highlighting groups for word under cursor
" nmap <Leader>s :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc


" HTML Fix
autocmd FileType html setlocal indentkeys-=*<Return>
nmap <Leader>= mzgg=G\`z
nnoremap <leader>ef mfggVG=`fzz
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div,script"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" Bling
let g:bling_color = 'black'
let g:bling_count = 5
let g:bling_time = 25

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n n:call PulseCursorLine()<cr>
nnoremap N N:call PulseCursorLine()<cr>

function! PulseCursorLine()
  let current_window = winnr()

  windo set nocursorline
  execute current_window . 'wincmd w'

  setlocal cursorline

  redir => old_hi
  silent execute 'hi CursorLine'
  redir END
  let old_hi = split(old_hi, '\n')[0]
  let old_hi = substitute(old_hi, 'xxx', '', '')

  hi CursorLine guibg=#3a3a3a ctermbg=235
  redraw
  sleep 20m

  hi CursorLine guibg=#4a4a4a ctermbg=235
  redraw
  sleep 30m

  hi CursorLine guibg=#3a3a3a ctermbg=235
  redraw
  sleep 30m

  hi CursorLine guibg=#2a2a2a ctermbg=235
  redraw
  sleep 20m

  execute 'hi ' . old_hi

  windo set cursorline
  execute current_window . 'wincmd w'
endfunction

" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer] 
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
  if a:buffer == ''
    " No buffer provided, use the current buffer.
    let buffer = bufnr('%')
  elseif (a:buffer + 0) > 0
    " A buffer number was provided.
    let buffer = bufnr(a:buffer + 0)
  else
    " A buffer name was provided.
    let buffer = bufnr(a:buffer)
  endif

  if buffer == -1
    echohl ErrorMsg
    echomsg "No matching buffer for" a:buffer
    echohl None
    return
  endif

  let last_buffer = bufnr('$')

  let delete_count = 0
  let n = 1
  while n <= last_buffer
    if n != buffer && buflisted(n)
      if a:bang == '' && getbufvar(n, '&modified')
        echohl ErrorMsg
        echomsg 'No write since last change for buffer'
              \ n '(add ! to override)'
        echohl None
      else
        silent exe 'bdel' . a:bang . ' ' . n
        if ! buflisted(n)
          let delete_count = delete_count+1
        endif
      endif
    endif
    let n = n+1
  endwhile

  if delete_count == 1
    echomsg delete_count "buffer deleted"
  elseif delete_count > 1
    echomsg delete_count "buffers deleted"
  endif

endfunction

" Quickly select text you just pasted:
nmap <Leader>s `[v`]`]`
nnoremap <leader>V V`]`

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" JSHint
let JSHintUpdateWriteOnly = 1

" JSFmt
let g:js_fmt_autosave = 0
let g:js_fmt_fail_silently = 0

" Custom Work Highlights

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

nnoremap <silent> <leader>0 :call HiInterestingWord(0)<cr>
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
hi def InterestingWord0 guifg=#000000 ctermfg=NONE guibg=black ctermbg=16 cterm=NONE

" Insert into your .vimrc after quick-scope is loaded.
" Obviously depends on <https://github.com/unblevable/quick-scope> being installed.

" Thanks to @VanLaser for cleaning the code up and expanding capabilities to include e.g. `df`

let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

for i in g:qs_enable_char_list
	execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor

nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" Auto Syntax
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif
