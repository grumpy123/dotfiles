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

hi Normal       ctermfg=White      ctermbg=Black
hi NonText      ctermfg=White      ctermbg=Black      cterm=none
hi Visual       ctermbg=Black      ctermbg=DarkBlue   cterm=none
hi VisualNOS    ctermfg=Black      ctermbg=DarkBlue   cterm=underline

hi TabLine      ctermfg=White      ctermbg=Black      cterm=underline
hi TabLineSel   ctermfg=Black      ctermbg=Yellow     cterm=none
hi TabLineFill  ctermfg=White      ctermbg=Black      cterm=underline

hi ErrorMsg                        ctermbg=LightBlue
hi Search                          ctermbg=DarkBlue   cterm=none term=none
hi IncSearch    ctermfg=White      ctermbg=DarkRed    cterm=none
hi MatchParen                      ctermbg=DarkGreen

" hi SpecialKey  
" hi Directory  
hi Title        ctermfg=magenta                       cterm=bold
" hi WarningMsg  
hi WildMenu     ctermfg=Yellow     ctermbg=Black      cterm=none term=none
hi ModeMsg      ctermfg=DarkGreen                         cterm=none 
hi MoreMsg      ctermfg=DarkGreen
hi Question     ctermfg=Green                         cterm=none

hi StatusLine   ctermfg=DarkRed    ctermbg=Gray       cterm=none term=none
hi StatusLineNC ctermfg=DarkRed    ctermbg=Gray       cterm=none term=none
hi VertSplit                       ctermbg=Gray       cterm=none term=none

hi Folded                          ctermbg=Black      cterm=bold term=bold
hi FoldColumn                      ctermbg=Black      cterm=bold term=bold
hi LineNr       ctermfg=Black      ctermbg=Yellow     cterm=none

hi DiffAdd      ctermfg=White      ctermbg=Yellow     cterm=none term=none
hi DiffChange   ctermfg=White      ctermbg=Blue       cterm=none
hi DiffDelete   ctermfg=White      ctermbg=Red
hi DiffText     ctermfg=White      ctermbg=Red

hi Cursor       ctermfg=Black      ctermbg=yellow

hi Comment      ctermfg=DarkGrey
hi Constant     ctermfg=Grey                           cterm=none
hi Special      ctermfg=Brown                          cterm=none 
hi Identifier   ctermfg=Cyan                           cterm=none
hi Statement    ctermfg=Yellow                         cterm=none  
hi PreProc      ctermfg=Magenta                        cterm=none
hi type         ctermfg=Green                          cterm=none
hi Underlined                                          cterm=underline term=underline
hi Ignore       ctermfg=bg
hi Todo         ctermfg=Red        ctermbg=bg          cterm=none

" suggested by tigmoid, 2008 Jul 18
" hi Pmenu
" hi PmenuSel  
" hi PmenuSbar  
" hi PmenuThumb 
