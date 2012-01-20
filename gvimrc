" Mephux <dustin.webber[at]gmail.com>
" ~/.GVIMRC

set noerrorbells
set visualbell

syntax on                         " syntax highlighting
set t_Co=256                      " 256 colors
set background=dark
colorscheme epix
set cursorline  				          " highlight current line

set spell
set wfh
set wfw
set guifont=Monaco:h12
set antialias                     " MacVim: smooth fonts.

set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set guioptions-=R
set guioptions-=r                 " Don't show right scrollbar
set guioptions-=L
set guioptions-=l                 " Don't show left scrollbar
set guioptions-=R                 " Don't show right scrollbar
set guioptions-=L                 " Don't show left scrollbar

" CHANGE DEFAULT ALT+LEFT/RIGHT
map <A-Right> w
map <A-Left> b

" Change Shift Select
vmap <S-M-Right> e
vmap <S-M-Left> b

imap <S-M-Right> <ESC>l<C-g><S-M-Right>
imap <S-M-Left> <ESC><C-g><S-M-Left>

nmap <S-M-Right> i<S-Right><C-g><S-M-Right>
nmap <S-M-Left> a<S-Left><C-g><S-M-Left>

" Buffer Navigation
map <S-C-Right> :bn!<CR>
map <S-C-Left> :bp!<CR>

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<D-T>
  "map <D-t> :CommandT<CR>
  "imap <D-t> <Esc>:CommandT<CR>
  map <D-t> :CtrlP<CR>
  imap <D-t> <Esc>:CtrlP<CR>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Command-Shift-F for Ack
  map <D-F> :Ack<space>

  " Command-e for ConqueTerm
  map <D-e> :call StartTerm()<CR>

  " Command-/ to toggle comments
  let g:NERDCreateDefaultMappings = 0
  let g:NERDSpaceDelims = 1
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i


  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt

  " Command-Option-ArrowKey to switch viewports
  map <D-M-Up> <C-w>k
  imap <D-M-Up> <Esc> <C-w>k
  
  map <D-M-Down> <C-w>j
  imap <D-M-Down> <Esc> <C-w>j
  
  map <D-M-Right> <C-w>l
  imap <D-M-Right> <Esc> <C-w>l
  
  map <D-M-Left> <C-w>h
  imap <D-M-Left> <C-w>h

else
  " Ctrl-T for Command-T
  map <C-t> :CommandT<CR>
  imap <C-t> <Esc>:CommandT<CR>

  " Ctrl-Shift-F for Ack
  map <C-F> :Ack<space>

  " Ctrl-e for ConqueTerm
  map <C-e> :call StartTerm()<CR>

  " Alt-][ to increase/decrease indentation
  vmap <A-]> >gv
  vmap <A-[> <gv

  " Ctrl-Option-ArrowKey to switch viewports
  map <C-S-Up> <C-w>k
  imap <C-S-Up> <Esc> <C-w>k
  map <C-S-Down> <C-w>j
  imap <C-S-Down> <Esc> <C-w>j
  map <C-S-Right> <C-w>l
  imap <C-S-Right> <Esc> <C-w>l
  map <C-S-Left> <C-w>h
  imap <C-S-Left> <C-w>h
endif

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=f

" Project Tree
if exists("loaded_nerd_tree")
  augroup AuNERDTreeCmd
  autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
  autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()
  autocmd AuNERDTreeCmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
endif

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

" Utility functions to create file commands
function s:CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function s:FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function s:DefineCommand(name, destination)
  call s:FileCommand(a:destination)
  call s:CommandCabbr(a:name, a:destination)
endfunction

" Public NERDTree-aware versions of builtin functions
function ChangeDirectory(dir, ...)
  execute "cd " . fnameescape(a:dir)
  let stay = exists("a:1") ? a:1 : 1

  NERDTree

  if !stay
    wincmd p
  endif
endfunction

function Touch(file)
  execute "!touch " . shellescape(a:file, 1)
  call s:UpdateNERDTree()
endfunction

function Remove(file)
  let current_path = expand("%")
  let removed_path = fnamemodify(a:file, ":p")

  if (current_path == removed_path) && (getbufvar("%", "&modified"))
    echo "You are trying to remove the file you are editing. Please close the buffer first."
  else
    execute "!rm " . shellescape(a:file, 1)
  endif

  call s:UpdateNERDTree()
endfunction

function Mkdir(file)
  execute "!mkdir " . shellescape(a:file, 1)
  call s:UpdateNERDTree()
endfunction

function Edit(file)
  if exists("b:NERDTreeRoot")
    wincmd p
  endif

  execute "e " . fnameescape(a:file) 

ruby << RUBY
  destination = File.expand_path(VIM.evaluate(%{system("dirname " . shellescape(a:file, 1))}))
  pwd         = File.expand_path(Dir.pwd)
  home        = pwd == File.expand_path("~")

  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
    VIM.command(%{call ChangeDirectory(fnamemodify(a:file, ":h"), 0)})
  end
RUBY
endfunction

" Define the NERDTree-aware aliases
if exists("loaded_nerd_tree")
  call s:DefineCommand("cd", "ChangeDirectory")
  call s:DefineCommand("touch", "Touch")
  call s:DefineCommand("rm", "Remove")
  call s:DefineCommand("e", "Edit")
  call s:DefineCommand("mkdir", "Mkdir")
  cabbrev Edit! e!
endif

