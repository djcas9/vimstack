" __     _____ __  __ ____ _____  _    ____ _  __
" \ \   / /_ _|  \/  / ___|_   _|/ \  / ___| |/ /
"  \ \ / / | || |\/| \___ \ | | / _ \| |   | ' /
"   \ V /  | || |  | |___) || |/ ___ \ |___| . \
"    \_/  |___|_|  |_|____/ |_/_/   \_\____|_|\_\
"
" The Mephux Collection - https://github.com/mephux/vimstack
"
" The Basics
set nocompatible
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8

filetype off



" vim-plug - Plugin Managment
call plug#begin('~/.vim/plugged')

" Plug 'scrooloose/syntastic'

" UI
" Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'molok/vim-smartusline'
Plug 'kana/vim-smartinput'
" Plug 'fidian/hexmode'
Plug 'scrooloose/nerdtree'
Plug 'zhaocai/GoldenView.Vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/ZoomWin'
" Plug 'junegunn/vim-easy-align'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'int3/vim-extradite'
Plug 'vim-scripts/gitignore'

" Ctrlp/Plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-register'
Plug 'tacahiroy/ctrlp-funky'

" Search
Plug 'justinmk/vim-gtfo'
Plug 'dyng/ctrlsf.vim'
Plug 'mileszs/ack.vim'

" Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Nav/Move/Format
Plug 'stephpy/vim-yaml'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'wellle/targets.vim'
" Plug 'tpope/vim-ragtag'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-abolish'
Plug 'mattn/emmet-vim'
" Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'bruno-/vim-vertical-move'
Plug 'scrooloose/nerdcommenter'

" Other
" Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ompugao/uncrustify-vim'
" Plug 'PotatoesMaster/i3-vim-syntax'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'eslint/eslint'
Plug 'ruby-formatter/rufo-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Turn on file type detection.
filetype plugin indent on

" syntax highlighting
syntax on

" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256

" Don't syntax highlight long lines
set synmaxcol=256"

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
" No annoying sound on errors
set belloff=all
set novb
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Disable beep and flash with an autocmdEdit
" set noerrorbells visualbell t_vb=
" autocmd GUIEnter * set visualbell t_vb=

" ver/hor/both - where does equalalways apply

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

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
" set completefunc=youcompleteme#Complete
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
"set visualbell                    " No beeping.

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

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 1

" dd wont overwrite the last yank
" map dd to the black hole register
" nnoremap d "_d

" Keep swap files in one location
" +=,$HOME/.vim/tmp/
set directory=$HOME/.vim/tmp/,.
set dir=~/.vim/tmp/swap/
set backupdir=~/.vim/tmp/backup/

if version >= 703
  " Persistent Undo
  set undofile
  set undolevels=10000     " numbers of particular undos to save
  set undoreload=100000    " number of undo lines to save
  set undodir=~/.vim/tmp/undo/
endif

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

" Mark the ideal max text width
if exists('+colorcolumn')
  set colorcolumn=80
  " highlight ColorColumn ctermbg=magenta
  " call matchadd('ColorColumn', '\%81v', 100)
endif

" clipboard
set clipboard=unnamed,unnamedplus

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Status Line Setup
let g:smartusline_string_to_highlight = '%f'
let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=119 ctermfg=black'
let g:smartusline_hi_virtual_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_normal = 'guibg=#95e454 guifg=black ctermbg=108 ctermfg=black'

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
set statusline+=%{&paste?'[Paste]':''}
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

" Prettier.io
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" C Stuff
" path to uncrustify configuration file
let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"
autocmd FileType c noremap <buffer> <c-f> :call uncrustify#UncrustifyAuto()<CR>
autocmd FileType c vnoremap <buffer> <c-f> :call uncrustify#UncrustifyAuto()<CR>

" GO Configuration
" autocmd FileType go autocmd BufWritePre <buffer> Fmt
let g:go_bin_path = expand("$GOPATH/bin")
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4"
" let g:go_metalinter_autosave = 1

let g:go_fmt_command = "goimports"
let g:go_disable_autoinstall = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1

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
map <S-Up> <C-W>k

"map <S-Left> ^
"map <S-Right> $
"imap <S-Left> <ESC>I
"imap <S-Right> <ESC>A

" map <S-Up> gg
" map <S-Down> G

map <Leader>w <ESC>:w<CR>

" nmap <C-Right> <Plug>(expand_region_expand)
" nmap <C-Left> <Plug>(expand_region_shrink)


map <S-Right> w
map <S-Left> b
nmap <silent> <S-Left> b
nmap <silent> <S-Right> w
vmap <S-Right> w
vmap <S-Left> b
imap <silent> <S-Left> <ESC>b
imap <silent> <S-Right> <ESC>w
" vmap <C-Right> <Plug>(expand_region_expand)
" vmap <C-Left> <Plug>(expand_region_shrink)


nmap <silent> <C-h> b
nmap <silent> <C-l> w
vmap <silent> <C-h> b
vmap <silent> <C-l> w

nmap <silent> <C-j> }
nmap <silent> <C-k> {
vmap <silent> <C-j> {
vmap <silent> <C-k> }

nmap <silent> <S-Up> :<C-U>call vertical_move#Up('', v:count1)<CR>
nmap <silent> <S-Down> :<C-U>call vertical_move#Down('', v:count1)<CR>
vmap <silent> <S-Up> :<C-U>call vertical_move#Up('v', v:count1)<CR>
vmap <silent> <S-Down> :<C-U>call vertical_move#Down('v', v:count1)<CR>
imap <silent> <S-Up> <ESC> :<C-U>call vertical_move#Down('v', v:count1)<CR>
imap <silent> <S-Down> <ESC> :<C-U>call vertical_move#Down('', v:count1)<CR>

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

" GoldenView
let g:goldenview__enable_default_mapping=0
nmap <Leader><Leader> <plug>GoldenViewResize<CR>


" nmap     <C-F>f <Plug>CtrlSFPrompt
" vmap     <C-F>f <Plug>CtrlSFVwordPath
" vmap     <C-F>F <Plug>CtrlSFVwordExec
" nmap     <C-F>n <Plug>CtrlSFCwordPath
" nmap     <C-F>p <Plug>CtrlSFPwordPath
" imap     <C-F>t <Esc>:CtrlSFToggle<CR>
" nnoremap <C-F>t :CtrlSFToggle<CR>
" nnoremap <C-F>o :CtrlSFOpen<CR>


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

" clear the search buffer when hitting return
:nnoremap <leader>c :nohlsearch<cr>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" GitGutter
let g:gitgutter_diff_args = '-w'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

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
" nmap <Leader>B :SCCompile<cr>
" nmap <Leader>R :update<CR>:SCCompileRun<cr>
" vmap <Leader>R :update<CR>:SCCompileRun<cr>
" imap <Leader>R <Esc>:SCCompileRun<cr>

" Get rid of Ex mode
nnoremap Q nop
" nnoremap Q <nop>
cmap Q! q!
" cmap W w

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
map <c-z> :cprevious<CR>
map <c-x> :cnext<CR>

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

" Show syntax highlighting groups for word under cursor
" nmap <Leader>q :call <SID>SynStack()<CR>
" function! <SID>SynStack()
  " if !exists("*synstack")
    " return
  " endif
  " echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
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

" nnoremap <C-H> :Hexmode<CR>
" inoremap <C-H> <Esc>:Hexmode<CR>
" vnoremap <C-H> :<C-U>Hexmode<CR>

" Auto Syntax
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" Enable VIM mouse support
set mouse=a
" set ttymouse=xterm2
map <MiddleMouse> <Nop>
nmap <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>


" CtrlP configuration
let g:ctrlp_use_caching = 1
let g:ctrlp_funky_go_types = 1
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 200
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
let g:ctrlp_by_filename = 1
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*   " for Linux/MacOSX
let g:ctrlp_custom_ignore = 'Godeps/*$\|\.git$\|\.hg$\|\.svn$\|\.DS_Store$\|\.swp$\|node_modules/*$\|vendor/*$'

nnoremap <Leader>f :CtrlPFunky<Cr>
nnoremap <Leader>u :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
nnoremap <Leader>b :CtrlPBuffer<Cr>
nnoremap <Leader>r :CtrlPRegister<Cr>

"These are to cancel the default behavior of d, D, c, C
"  to put the text they delete in the default register.
"  Note that this means e.g. "ad won't copy the text into
"  register a anymore.  You have to explicitly yank it.
xnoremap p "_dP
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
