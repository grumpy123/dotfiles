" Vim color file
" Maintainer: Bohdan Vlasyuk <bohdan@vstu.edu.ua>
" Last Change: 2008 Jul 18

" Darkblue -- for those who prefer Dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.]

set bg=dark
hi clear
if exists("syntax_on")
 syntax reset
endif

let colors_name = "forloop7"

hi Normal       ctermfg=255        ctermbg=233
hi NonText      ctermfg=255        ctermbg=233        cterm=none
hi Visual       ctermbg=bg         ctermbg=19         cterm=none
hi VisualNOS    ctermfg=bg         ctermbg=19         cterm=underline

hi TabLine      ctermfg=255        ctermbg=bg         cterm=underline
hi TabLineSel   ctermfg=bg         ctermbg=178        cterm=none
hi TabLineFill  ctermfg=255        ctermbg=bg         cterm=underline

hi ErrorMsg                        ctermbg=LightBlue
hi Search                          ctermbg=DarkBlue   cterm=none term=none
hi IncSearch    ctermfg=White      ctermbg=DarkRed    cterm=none
hi MatchParen                      ctermbg=DarkGreen

" hi SpecialKey  
" hi Directory  
hi Title        ctermfg=magenta                       cterm=bold
" hi WarningMsg  
hi WildMenu     ctermfg=Yellow     ctermbg=bg         cterm=none term=none
hi ModeMsg      ctermfg=DarkGreen                     cterm=none 
hi MoreMsg      ctermfg=DarkGreen
hi Question     ctermfg=Green                         cterm=none

hi StatusLine   ctermfg=88         ctermbg=Gray       cterm=none term=none
hi StatusLineNC ctermfg=88         ctermbg=Gray       cterm=none term=none
hi VertSplit                       ctermbg=Gray       cterm=none term=none

hi Folded                          ctermbg=Black      cterm=bold term=bold
hi FoldColumn                      ctermbg=Black      cterm=bold term=bold
hi LineNr       ctermfg=Black      ctermbg=Yellow     cterm=none

hi DiffAdd      ctermfg=White      ctermbg=178        cterm=none term=none
hi DiffChange   ctermfg=White      ctermbg=17         cterm=none
hi DiffDelete   ctermfg=White      ctermbg=124
hi DiffText     ctermfg=White      ctermbg=53

hi Cursor       ctermfg=bg         ctermbg=226
hi nCursor      ctermfg=111        ctermbg=226

hi Comment      ctermfg=243
hi Constant     ctermfg=88                             cterm=none
hi Special      ctermfg=160                            cterm=none 
hi Identifier   ctermfg=27                             cterm=none
hi Statement    ctermfg=184                            cterm=none  
hi PreProc      ctermfg=94                             cterm=none
hi type         ctermfg=Green                          cterm=none
hi Underlined                                          cterm=underline term=underline
hi Ignore       ctermfg=bg
hi Todo         ctermfg=124        ctermbg=bg          cterm=none

" suggested by tigmoid, 2008 Jul 18
" hi Pmenu
" hi PmenuSel  
" hi PmenuSbar  
" hi PmenuThumb 
