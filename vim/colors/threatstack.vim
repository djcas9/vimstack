" Threat Stack color scheme - https://threatstack.com
" Based on ir_black from: http://blog.infinitered.com/entries/show/8
" adds 256 color console support

set background=dark
hi clear

if exists("syntax_on")
 syntax reset
endif

let colors_name = "threatstack"

" General colors
hi Normal           guifg=#f6f3e8     guibg=black       gui=NONE      ctermfg=NONE        ctermbg=16        cterm=NONE
hi NonText          guifg=#070707 guibg=black ctermfg=235 ctermbg=none

hi Cursor           guifg=black guibg=white ctermfg=0 ctermbg=15
hi LineNr           guifg=#3D3D3D guibg=black ctermfg=236 ctermbg=233

hi VertSplit        guifg=#202020 guibg=#202020 ctermfg=235 ctermbg=235 
hi StatusLine       guifg=#CCCCCC guibg=#202020 gui=none ctermfg=233 ctermbg=239
hi StatusLineNC     guifg=black guibg=#202020 ctermfg=233 ctermbg=235

hi Title            guifg=#f6f3e8 gui=bold ctermfg=187 cterm=bold
hi Visual           guibg=#262D51 ctermbg=152 ctermfg=black cterm=none

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=#919191     guibg=#111111     gui=BOLD      ctermfg=black       ctermbg=cyan        cterm=BOLD
hi MoreMsg          guifg=#919191     guibg=#111111     gui=BOLD      ctermfg=black       ctermbg=cyan        cterm=BOLD

" Directory Colors
hi Directory        guifg=#bcc7cc     guibg=NONE        gui=BOLD      ctermfg=103        ctermbg=NONE        cterm=NONE

hi Menu             guifg=#383838     guibg=#111111     gui=NONE      ctermbg=233 ctermfg=250 cterm=NONE
hi WildMenu         guifg=#FFFFFF     guibg=#313131     gui=bold      cterm=NONE
hi PmenuSbar        guifg=black guibg=white ctermfg=0 ctermbg=15

" Fold Column
hi Folded           guifg=#383838     guibg=#111111       gui=NONE      ctermfg=245         ctermbg=235         cterm=NONE
hi FoldColumn       guifg=#383838     guibg=#111111       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

" Spell
hi SpellBad         guibg=#111111     gui=undercurl     guisp=#8d8d8d ctermbg=NONE        ctermfg=167         cterm=undercurl
" hi SpellCap       guifg=#2b2b2b     guibg=#111111     gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
" hi SpellLocal     guifg=#2b2b2b     guibg=#111111     gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
" hi SpellRare      guifg=#2b2b2b     guibg=#111111     gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE

" Vim Diff
hi DiffText         guifg=#f6f3e8     guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi DiffChange       guifg=#FFFFFF     guibg=#374757     gui=NONE      ctermfg=NONE        ctermbg=234        cterm=NONE
hi DiffDelete       guifg=#FFFFFF     guibg=#5c3a3d     gui=NONE      ctermfg=NONE        ctermbg=52        cterm=NONE
hi DiffAdd          guifg=#FFFFFF     guibg=#3d5838     gui=NONE      ctermfg=NONE        ctermbg=22         cterm=NONE

hi SpecialKey       guifg=#808080 guibg=#343434 ctermfg=8 ctermbg=236

hi Error            gui=undercurl ctermfg=203 ctermbg=none cterm=underline guisp=#FF6C60
hi ErrorMsg         guifg=white guibg=#FF6C60 gui=bold ctermfg=white ctermbg=203 cterm=bold
" hi LongLineWarning gui=undercurl ctermfg=none ctermbg=234 cterm=none guisp=#FF6C60
hi WarningMsg       guifg=white guibg=#FF6C60 gui=bold ctermfg=white ctermbg=203 cterm=bold

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guibg=#121212 ctermbg=233 ctermfg=none gui=none cterm=none
  hi CursorLineNr   guibg=#121212 ctermbg=233 ctermfg=247 gui=none cterm=none

  hi CursorColumn   guibg=#121212 gui=none ctermbg=234 ctermfg=233
  hi MatchParen     guifg=#f6f3e8 guibg=#857b6f gui=bold ctermfg=white ctermbg=darkgray 
  hi Pmenu          guifg=#f6f3e8 guibg=#444444 ctermfg=white ctermbg=242 
  hi PmenuSel       guifg=#000000 guibg=#cae682 ctermfg=0 ctermbg=195 
  hi Search         guifg=#000000 guibg=#cae682 ctermfg=0 ctermbg=85

  " hi ColorColumn guifg=#000000 guibg=#cae682 ctermfg=none ctermbg=233
  hi ColorColumn    cterm=none ctermfg=none ctermbg=none
endif


" Syntax highlighting
" TODO: 
hi Comment          guifg=#7C7C7C ctermfg=237 ctermbg=none
hi String           guifg=#A8FF60 ctermfg=155 " 155
hi Number           guifg=#FF73FD ctermfg=207

hi Keyword          guifg=#96CBFE ctermfg=117 
hi PreProc          guifg=#96CBFE ctermfg=117 
hi Conditional      guifg=#6699CC ctermfg=110 

hi Todo             guifg=#000000 guibg=#cae682 ctermfg=167 ctermbg=none cterm=none
hi Constant         guifg=#99CC99 ctermfg=151 

hi Identifier       guifg=#C6C5FE ctermfg=189 
hi Function         guifg=#FFD2A7 ctermfg=223 "223 
hi Type             guifg=#FFFFB6 ctermfg=229 "229 
hi Statement        guifg=#6699CC ctermfg=110 "110 

hi Special          guifg=#E18964 ctermfg=173 
hi Delimiter        guifg=#00A0A0 ctermfg=37 
hi Operator         guifg=white ctermfg=white 

hi link Character Constant
hi link Boolean Constant
hi link Float Number
hi link Repeat Statement
hi link Label Statement
hi link Exception Statement
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link Tag Special
hi link SpecialChar Special
hi link SpecialComment Special
hi link Debug Special

" Special for Ruby
hi rubyRegexp       guifg=#B18A3D ctermfg=brown 
hi rubyRegexpDelimiter guifg=#FF8000 ctermfg=brown 
hi rubyEscape guifg=white ctermfg=cyan 
hi rubyRegexpEscape guifg=white ctermfg=240
hi rubyInterpolationDelimiter guifg=#00A0A0 ctermfg=blue 
hi rubyControl guifg=#6699CC ctermfg=blue "and break, etc
hi rubyStringDelimiter guifg=#336633 ctermfg=lightgreen 
hi link rubySymbol Boolean
hi link rubyClass Keyword 
hi link rubyModule Keyword 
hi link rubyKeyword Keyword 
hi link rubyOperator Operator
hi link rubyIdentifier Identifier
hi link rubyInstanceVariable Identifier
hi link rubyGlobalVariable Identifier
hi link rubyClassVariable Identifier
hi link rubyConstant Type 

" Special for Java
hi link javaScopeDecl Identifier 
hi link javaCommentTitle javaDocSeeTag 
hi link javaDocTags javaDocSeeTag 
hi link javaDocParam javaDocSeeTag 
hi link javaDocSeeTagParam javaDocSeeTag 

hi javaDocSeeTag guifg=#CCCCCC ctermfg=darkgray 
hi javaDocSeeTag guifg=#CCCCCC ctermfg=darkgray 

" Special for XML
hi link xmlTag Keyword 
hi link xmlTagName Conditional 
hi link xmlEndTag Identifier 

" Special for HTML
hi link htmlTag Keyword 
hi link htmlArg Keyword
hi link htmlTagName Conditional 
hi link htmlEndTag Identifier 
hi link htmlLink htmlTag

" Special for Javascript
hi link jsNumber Number 
hi link jsDotCall Type
" hi link Noise Number
hi link jsFunctionKey Conditional
hi link jsFunctionVar Type
hi link jsObjectKey Conditional
hi link jsGlobalObjects Type
hi link jsThis Type
hi link jsFunction Type
hi link jsStatics Type
hi link jsFuncCall Function

" Special for CSharp
hi link csXmlTag Keyword 

" vim-startify
hi StartifyBracket ctermfg=240
hi StartifyFooter  ctermfg=235
hi StartifyHeader  ctermfg=203
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
