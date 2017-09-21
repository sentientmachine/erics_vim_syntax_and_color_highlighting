"" Modified from tomasr Molokai on Github
" Red = #F92672, 161
" Orange = #FD971F, 208
" Yellow = #E6DB74, 144
" Light Green = #A6E22E, 118
" Green = #00AF00, 34
" Blue = #66D9EF, 81
" Purple = #AE81FF, 135
" Gray = #7E8E91, 59

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "monokambat"

let g:is_bash=1 " Tell $VIMRUNTIME/syntax/sh.vim that I am using bash
let python_highlight_all = 1 " Tell $VIMRUNTIME/syntax/python.vim to highlight all

" Highlight code area in markdown
let g:markdown_fenced_languages =
\[
  \"c","cpp","java","javascript","ruby","python","vim",
  \"css","html","xml","json","cmake","yaml","sh","conf",
  \"zsh","tmux","debsources","resolv","sudoers"
\]

" Normal is the background color
hi Normal ctermfg=231 ctermbg=235 cterm=NONE guifg=#F8F8F2 guibg=#1B1D1E gui=NONE
" Visual is the selected color
hi Visual ctermfg=255 ctermbg=39 cterm=NONE guifg=White guibg=#00afff gui=NONE
" Pmenu is the popup autocomplete color
hi Pmenu ctermfg=39 ctermbg=255 cterm=NONE guifg=#00afff guibg=White
hi PmenuSel ctermfg=255 ctermbg=39 cterm=NONE guifg=White guibg=#00afff

hi Green ctermfg=34 ctermbg=NONE cterm=NONE guifg=#00af00 guibg=NONE gui=NONE
hi iGreen ctermfg=0 ctermbg=34 cterm=NONE guifg=#000000 guibg=#00af00 gui=NONE
hi Search ctermfg=59 ctermbg=226 cterm=NONE guibg=yellow guifg=black








hi Boolean              ctermfg=135     guifg=#AE81FF
hi Character            ctermfg=144     guifg=#E6DB74
hi ColorColumn          ctermbg=236     guibg=#232526
hi Comment              ctermfg=59      guifg=#7E8E91
hi Conditional          ctermfg=161     cterm=none      guifg=#F92672     gui=none
hi Constant             ctermfg=135     cterm=none      guifg=#AE81FF     gui=none
hi Cursor               ctermfg=16      ctermbg=253     guifg=#000000     guibg=#F8F8F0
hi CursorColumn         ctermbg=236     guibg=#293739
hi CursorLine           ctermbg=234     cterm=none      guibg=#293739
hi CursorLineNr         ctermfg=208     cterm=none      guifg=#FD971F     gui=none
hi Debug                ctermfg=225     cterm=none      guifg=#BCA3A3     gui=none
hi Define               ctermfg=81      guifg=#66D9EF
hi Delimiter            ctermfg=241     guifg=#8F8F8F
hi DiffAdd              ctermbg=24      guibg=#13354A
hi DiffChange           ctermfg=181     ctermbg=239     guifg=#89807D     guibg=#4C4745
hi DiffDelete           ctermfg=162     ctermbg=53      guifg=#960050     guibg=#1E0010
hi DiffText             ctermbg=102     cterm=none      guibg=#4C4745     gui=none
hi Directory            ctermfg=81      cterm=none      guifg=#66D9EF     gui=none
hi Error                ctermfg=255     ctermbg=196     guifg=#E6DB74     guibg=#ff3333
hi ErrorMsg             ctermfg=199     ctermbg=16      cterm=none        guifg=#F92672       guibg=#232526     gui=none
hi Exception            ctermfg=118     cterm=none      guifg=#A6E22E     gui=none
hi Float                ctermfg=135     guifg=#AE81FF
hi FoldColumn           ctermfg=67      ctermbg=16      guifg=#465457     guibg=#000000
hi Folded               ctermfg=242     ctermbg=235     cterm=NONE        guifg=#7E8E91       guibg=#272822     gui=NONE
hi Function             ctermfg=118     guifg=#A6E22E
hi Identifier           ctermfg=208     cterm=none      guifg=#FD971F
hi Ignore               ctermfg=244     ctermbg=232     guifg=#808080     guibg=bg
hi Keyword              ctermfg=161     cterm=none      guifg=#F92672     gui=none
hi Label                ctermfg=229     cterm=none      guifg=#E6DB74     gui=none
hi LineNr               ctermfg=250     ctermbg=236     guifg=#465457     guibg=#232526
hi Macro                ctermfg=193     guifg=#C4BE89   gui=none
hi MatchParen           ctermfg=233     ctermbg=208     cterm=none        guifg=#000000       guibg=#FD971F     gui=none
hi MoreMsg              ctermfg=229     guifg=#E6DB74
hi NonText              ctermfg=59      guifg=#465457
hi Normal               ctermfg=252     ctermbg=233     guifg=#F8F8F2     guibg=#1B1D1E
hi Number               ctermfg=135     guifg=#AE81FF
hi Operator             ctermfg=161     guifg=#F92672
hi PmenuSbar            ctermbg=232     guibg=#080808
hi PmenuThumb           ctermfg=81      guifg=#66D9EF
hi PreCondit            ctermfg=118     cterm=none      guifg=#A6E22E     gui=none
hi PreProc              ctermfg=118     cterm=none      guifg=#A6E22E
hi Question             ctermfg=81      guifg=#66D9EF
hi Repeat               ctermfg=161     cterm=none      guifg=#F92672     gui=none
hi SignColumn           ctermfg=118     ctermbg=235     guifg=#A6E22E     guibg=#232526
hi Special              ctermfg=81      guifg=#66D9EF   guibg=bg          gui=none
hi SpecialChar          ctermfg=161     cterm=none      guifg=#F92672     gui=none
hi SpecialComment       ctermfg=245     cterm=none      guifg=#7E8E91     gui=none
hi SpecialKey           ctermfg=81      guifg=#66D9EF   gui=none
hi SpellBad             ctermbg=52      cterm=underline
hi SpellCap             ctermbg=17      cterm=underline
hi SpellLocal           ctermbg=17      cterm=underline
hi Statement            ctermfg=161     cterm=none      guifg=#F92672     gui=none
hi StatusLine           ctermfg=238     ctermbg=253     guifg=#455354     guibg=fg
hi StatusLineNC         ctermfg=244     ctermbg=232     guifg=#808080     guibg=#080808
hi StorageClass         ctermfg=208     guifg=#FD971F   gui=none
hi String               ctermfg=144     guifg=#E6DB74
hi Structure            ctermfg=81      guifg=#66D9EF
hi TabLineFill          cterm=none      ctermbg=none    guifg=#1B1D1E     guibg=#1B1D1E
hi Tag                  ctermfg=161     guifg=#F92672   gui=none
hi Title                ctermfg=166     guifg=#ef5939
hi Todo                 ctermfg=231     ctermbg=232     cterm=none        guifg=#FFFFFF       guibg=bg        gui=none
hi Type                 ctermfg=81      cterm=none      guifg=#66D9EF     gui=none
hi Typedef              ctermfg=81      guifg=#66D9EF
hi Underlined           ctermfg=244     cterm=underline guifg=#808080     gui=underline
hi VertSplit            ctermfg=244     ctermbg=232     cterm=none        guifg=#808080       guibg=#080808   gui=none
hi WarningMsg           ctermfg=231     ctermbg=238     cterm=none        guifg=#FFFFFF       guibg=#333333   gui=none
hi WildMenu             ctermfg=81      ctermbg=16      guifg=#66D9EF     guibg=#000000
hi iCursor              guifg=#000000   guibg=#F8F8F0

