" Epix - A very epic gray scale color scheme.
" By Mephux - http://www.lookycode.com/mephux

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "epix"

" General colors
hi Normal           guifg=#f6f3e8     guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi NonText          guifg=#454545     guibg=black       gui=bold      ctermfg=black       ctermbg=NONE        cterm=NONE

hi Cursor           guifg=black       guibg=white       gui=NONE      ctermfg=black       ctermbg=white       cterm=reverse
hi LineNr           guifg=#383838     guibg=#111111     gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi VertSplit        guifg=#202020     guibg=#202020     gui=NONE      ctermfg=darkgray    ctermbg=darkgray    cterm=NONE
hi StatusLine       guifg=#CCCCCC     guibg=#202020     gui=italic    ctermfg=white       ctermbg=darkgray    cterm=NONE
hi StatusLineNC     guifg=black       guibg=#202020     gui=NONE      ctermfg=blue        ctermbg=darkgray    cterm=NONE  

hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Title            guifg=#f6f3e8     guibg=NONE        gui=bold      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual           guifg=NONE        guibg=#1d252d     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=REVERSE

hi SpecialKey       guifg=#454545     guibg=black       gui=bold      ctermfg=black       ctermbg=NONE        cterm=NONE

hi Ignore           guifg=gray        guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Question         guifg=#9e9e9e     guibg=#111111     gui=NONE      ctermfg=black       ctermbg=yellow      cterm=NONE

" Spell
hi SpellBad         guibg=#111111     gui=undercurl     guisp=#8d8d8d ctermbg=NONE        cterm=NONE
" hi SpellCap       guifg=#2b2b2b     guibg=#111111     gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
" hi SpellLocal     guifg=#2b2b2b     guibg=#111111     gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
" hi SpellRare      guifg=#2b2b2b     guibg=#111111     gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi Error            guifg=NONE        guibg=NONE        gui=NONE      ctermfg=white       ctermbg=red         cterm=NONE     guisp=#FF6C60
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE	      cterm=underline

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=#919191     guibg=#111111     gui=BOLD      ctermfg=black       ctermbg=cyan        cterm=BOLD
hi MoreMsg          guifg=#919191     guibg=#111111     gui=BOLD      ctermfg=black       ctermbg=cyan        cterm=BOLD

" Directory Colors
hi Directory        guifg=#bcc7cc     guibg=NONE        gui=BOLD      ctermfg=cyan        ctermbg=NONE        cterm=NONE

hi Menu             guifg=#383838     guibg=#111111     gui=NONE      cterm=NONE
hi WildMenu         guifg=#FFFFFF     guibg=#313131     gui=bold      cterm=NONE

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE      cterm=BOLD
  hi CursorColumn   guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE      cterm=BOLD
  hi MatchParen     guifg=#f6f3e8     guibg=#857b6f     gui=BOLD      ctermfg=white       ctermbg=darkgray  cterm=NONE

  " Popup Menu
  hi Pmenu          guifg=#838383     guibg=#1e1e1e     gui=NONE      ctermfg=black       ctermbg=yellow    cterm=NONE
  hi PmenuSel       guifg=#b4b4b4     guibg=#575757     gui=NONE      ctermfg=black       ctermbg=white     cterm=NONE
  hi PmenuSbar      guifg=#1e1e1e     guibg=#1e1e1e     gui=NONE      ctermfg=black       ctermbg=white     cterm=NONE
  hi PmenuThumb     guifg=#8e8e8e     guibg=#3e3e3e     gui=NONE      ctermfg=black       ctermbg=white     cterm=NONE

  hi Search         guifg=#bbbbbb     guibg=#2b2b2b     gui=underline ctermfg=NONE        ctermbg=NONE	    cterm=underline   guisp=#848484
  hi ColorColumn    guifg=NONE        guibg=#111111     gui=NONE      ctermfg=NONE        ctermbg=NONE      cterm=NONE
endif

" Syntax highlighting
hi Comment          guifg=#7C7C7C     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi String           guifg=#d2ffad     guibg=NONE        gui=NONE      ctermfg=green       ctermbg=NONE        cterm=NONE
hi Number           guifg=#ffa6fe     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Keyword          guifg=#b0d9fc     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi PreProc          guifg=#c8e4fe     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Conditional      guifg=#b2cce5     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE

hi Todo             guifg=#8f8f8f     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
hi Constant         guifg=#ffffd5     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE

hi Identifier       guifg=#dfdefe     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Function         guifg=#d5f6ba     guibg=NONE        gui=NONE      ctermfg=brown       ctermbg=NONE        cterm=NONE
hi Type             guifg=#f1fbd2     guibg=NONE        gui=NONE      ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Statement        guifg=#b3cce5     guibg=NONE        gui=NONE      ctermfg=lightblue   ctermbg=NONE        cterm=NONE

hi Special          guifg=#a3c5d4     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE
hi Delimiter        guifg=#b6d0ed     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Operator         guifg=#f2f2f2     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

" Special for Ruby
hi rubyRegexp                  guifg=#B18A3D      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyRegexpDelimiter         guifg=#FF8000      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyEscape                  guifg=white        guibg=NONE      gui=NONE      ctermfg=cyan           ctermbg=NONE      cterm=NONE
hi rubyInterpolationDelimiter  guifg=#00A0A0      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyGlobalVariable          guifg=#FFCCFF      guibg=NONE      gui=NONE      ctermfg=lightblue      ctermbg=NONE      cterm=NONE  "yield

hi link rubyControl           Keyword
hi link rubyClass             Keyword 
hi link rubyModule            Keyword 
hi link rubyKeyword           Keyword 
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type  
hi link rubyStringDelimiter   String

" Special for Java
hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi javaClassDecl              guifg=#CCFFCC     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE

" Special for XML
hi link xmlTag          Keyword 
hi link xmlTagName      Conditional 
hi link xmlEndTag       Identifier 

" Special for HTML
hi link htmlTag         Keyword 
hi link htmlTagName     Conditional 
hi link htmlEndTag      Identifier 

" Special for Javascript
hi link javaScriptNumber                Number
hi link javaScriptNodeGlobalObjects     Constant
