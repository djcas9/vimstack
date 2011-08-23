" Mephux
"
set shell=/bin/sh

set nocompatible                  " Must come first because it changes other 
                                  " options.
set autoread
set nolazyredraw                  " turn off lazy redraw
set winfixwidth

" Setup Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on                         " syntax highlighting

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

set autoindent                    " automatic indent new lines
set smartindent                   " be smart about it
set nowrap                        " do not wrap lines
set softtabstop=2                 " yep, two
set shiftwidth=2                  " ..
set tabstop=2
set expandtab                     " expand tabs to spaces
set nosmarttab                    " no tabs
set formatoptions+=n              " support for numbered/bullet lists
set textwidth=80                  " wrap at 80 chars by default
set virtualedit=block             " allow virtual edit in visual block mode

" Mark the ideal max text width
if exists('+colorcolumn')
  set colorcolumn=80
endif

set t_Co=256                      " 256 colors
set background=dark
colorscheme epix

filetype plugin indent on         " Turn on file type detection.

" Folding settings
set foldmethod=indent
set foldnestmax=3                 " deepest fold is 3 levels
set nofoldenable                  " dont fold by default

" Set encoding
set encoding=utf-8

set showcmd                       " Display incomplete commands.

set showmode                      " Display the mode you're in.

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

" set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a 
                                  " file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Zencoding Keymap
let g:user_zen_expandabbr_key = '<D-e>'

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Edit .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" Node/EJS
au BufRead,BufNewFile *.ejs set ft=html

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" jQuery
" au BufRead,BufNewFile *.js set ft=javascript syntax=jquery

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" MacVIM shift+arrow-keys behavior (required in .vimrc)
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
  set selection=exclusive
  set selectmode=
endif

match LongLineWarning '\%>80v.\+'

"nerdtree settings
map <Leader>p :NERDTree<Enter>
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 30

map <Leader>z :GundoToggle<Enter>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

map <leader>b :BufExplorer<Enter>
set pastetoggle=<Leader>1          	" pastetoggle (sane indentation on pastes)

" Run Ruby Code
nmap <D-r> :update<CR>:!ruby %<Enter>
vmap <D-r> :update<CR>:!ruby %<Enter>
imap <D-r> <Esc>:update<CR>:!ruby %<Enter>

" Hex View
nmap <leader>h :%!xxd<CR>
" Undo Hex View
nnoremap <leader>hh :%!xxd -r<CR>

" Force Save
cmap w!! w !sudo tee % >/dev/null

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby set foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd filetype svn,*commit* setlocal spell

" Rspec
nmap <Leader>r <Esc>:Rake spec<CR>

" Wrap Word
nmap <leader>w ysW

set showcmd
set laststatus=2                  " Show the status line all the time

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


if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
