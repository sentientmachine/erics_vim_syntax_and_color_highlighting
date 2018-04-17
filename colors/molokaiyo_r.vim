"Super custom Vim color file from Eric.
"Improved by Eric Leschinski the way I like it for .R files


hi clear     "start from a blank slate.


"periodically turn the following off to evolve better
"syntax reset   "undo all the syntax garbage defined from earlier in vim80/syntax/r.vim

"We want the /usr/share/vim/vim80/syntax and color files to periodically show
"us better ways to do things so we let it override our stuff as we migrate
"from version to version over time.  Evolve = good
"Use the command :scriptnames in the vim command terminal to ask what scripts
"loaded and in what order, it seems to be chaotic and haphazard.


"background parameter causes vim file to broadcast dark background
"Without this sometimes comments are unreadable
set background=dark


"Without setting g:colors_name, then the line in ~/.vimrc points to molokaiyo_r and 
"vim has no clue what is going on so it sets colorscheme to default, this line is necessary
let g:colors_name="molokaiyo_r"

"Fucking bullshit R programs think users want cursorline?  Fuck that shit!
set nocursorline
set spell                "Setting spell checking at default is important because R is going 
                         "to differentiate between comments whould should be spell corrected
                         "and code which should not.  RICK SANCHEZ AWESOME

setlocal spell spelllang=en_us   "Be nice and explicit

"Double fucking cool if you can set the spell file to a networked drive like:
"set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add
"Until then, just manual





"the definition of reverse is to make the color opposite of what it is now, genius
hi Visual term=reverse cterm=reverse guibg=Grey

"===========COMMENTS SHOULD BE LIGHT GREY AS PER TRADITION====================

"syn match rComment contains=@Spell,rCommentTodo,rOBlock "#.*"


"Woah you're telling me spell can be made only to apply on lines that are
"commented?  YEAH!!!!



"Define what capital word groups are classified as white bold in comments to be eye catchy
syn match rCommentTodo contained "\(BUG\|FIXME\|NOTE\|TODO\):"

"comments should be spell checked, todo like comments should be white eye
"catchy.  rOBlock is block comments which R is incapable of, SHITHEAD PARASITES
syn match rComment contains=@Spell,rCommentTodo,rOBlock "#.*"



if has("spell")
    "Color 52 is a pleasing dark magenta background
    hi SpellBad ctermbg=52
    "Sentences after a period not capitalized should have a very dark blue background.
    hi SpellCap ctermbg=17

    "These two don't seem to be configured right, set to werid color to notify me if they come up
    hi SpellLocal ctermbg=235 
    "hi SpellRare ctermbg=50 ctermfg=none ctermbg=none cterm=reverse
   
    "Rarewords should just be a little bit less than black, just a little hint.
    hi SpellRare ctermbg=235 
    "hi SpellRare ctermbg=234
endif


hi def link rComment     Comment
hi def link rCommentTodo Todo

"Comments should be bash color 246, a pleasent comment light grey, I also like it bold
hi Comment        ctermfg=246 cterm=bold

"all caps: TODO, FIXME, NOTE, TODO should be eyecatching white bold
hi Todo           ctermfg=231 ctermbg=232 cterm=bold



"===========NO SUPERFLUOUS SPACES AT END====================
"           NO LINES OF ONLY WHITESPACE

"I like it when extra unnecessary whitespace at the end is highlighted
highlight ExtraWhitespace ctermbg=24 guibg=red
"match ExtraWhitespace /\s\+$\| \+\ze\t/            "this one includes blank lines as well. sucky.
"match ExtraWhitespace /\S\zs\s\+$\| \+\ze\t/       "this one doesn't include blank lines, better
match ExtraWhitespace /\S\zs\s\{2,}$\| \+\ze\t/


autocmd ColorScheme * highlight ExtraWhitespace ctermbg=24 guibg=red
"---

"12 whitespace or more gets highlighted as evil
"highlight OnlyWhitespace ctermbg=24 guibg=red
"match OnlyWhitespace /\zs\s\{16,}$\| \+\ze\t/
"autocmd ColorScheme * highlight OnlyWhitespace ctermbg=24 guibg=red



"NEAT
"Demo vim's ablity to search, but only  highlight part, the secret is in the
"\zs and \ze
"EXCELLENT, follow this and apply it elsewhere

"OOHHH it's the \zs that tells vim where to start matching and where to highlight.

"=============CONDITIONALS SHOULD BE BRIGHT RED==============================
"

syn keyword rConditional   else if while quit in repeat for
hi rConditional   ctermfg=161 cterm=bold

"rRepeat has to be set because sometimes vim80/syntax/r.vim has to have the last fucking word on colorizing certain words
hi rRepeat ctermfg=161 cterm=bold


"========MOST VALUABLE PART OF VIM  ,do  BUILTIN FUNCTION HELP and INSPECTION===========

"I expect to type ,do over    whatever = sample(stuff)  and get help on the
"sample function.  Plugin YouCompleteMe does this
"
"TODO: Important


"========CTAGS would be awesome then I can zip around ========
"
"Meh

"===========CUSTOM HIGHLIGHTS FOR R====================


highlight EricsCustomRMatcherHighlights ctermbg=red guibg=red
highlight BringGreenBoldStrangeBuiltin ctermfg=118 ctermbg=16 cterm=bold

"
"Any non-ascii characters should be highlighted red background
call matchadd('EricsCustomRMatcherHighlights', '\zs\([^\x00-\x7F]\)')

"Highlight Whitespace lines that are more than 22 spaces wide. 
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^\s\{22,}\s\+$\)')

"Tabs are evil, they should be highlighted red
call matchadd('EricsCustomRMatcherHighlights', '\zs\(\t\)')

"Bare square bracket lists aren't allowed
call matchadd('EricsCustomRMatcherHighlights', '\zs\(=\s\[\)')


"R has curly braces after if, for, while, etc, highlight python's colon
call matchadd('EricsCustomRMatcherHighlights', '^\s*if.*\zs\(:\s*$\)')
call matchadd('EricsCustomRMatcherHighlights', '^\s*for.*\zs\(:\s*$\)')
call matchadd('EricsCustomRMatcherHighlights', '^\s*while.*\zs\(:\s*$\)')


"Rmd is case sensitive, functions capitalized incorrectly are red errors
call matchadd('EricsCustomRMatcherHighlights', '\zs\(readRds\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(readrds\)')

call matchadd('EricsCustomRMatcherHighlights', '\zs\(saveRds\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(saverds\)')

"mean() is python, mean(...) is R.
call matchadd('EricsCustomRMatcherHighlights', '\zs\(\.mean()\)')


"R syntax for else is bullshit, it has to be on the same line as the opening
"curly brace.  But problem is 'else if' can be on another line
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^\s*else\s*{\)')

"in R, return requires parenthesis
call matchadd("EricsCustomRMatcherHighlights", '\zs\(^\s*return\s\)')

"Annoying as shit R code forces booleans all caps.  Rounding out the
"bullshit world of syntax for true, True, and TRUE in languages being fair game.
"Rmd is case sensitive, booleans capitalized incorrectly are red errors
call matchadd('EricsCustomRMatcherHighlights', '\zs\(True\s*$\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(true\s*$\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(False\s*$\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(false\s*$\)')

call matchadd('EricsCustomRMatcherHighlights', '\zs\(True[^a-zA-Z_]\+\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(true[^a-zA-Z_]\+\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(False[^\w]\+\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(false[^\w]\+\)')

"Return must be all lowercase:
call matchadd('EricsCustomRMatcherHighlights', '\zs\(Return\)')
"You got to be fucking shitting me, exit not found?  What kind of turd product
"is this heaping pile of fucking fail?  PARASITES.  Also quit must have parens
"start of line carrot, 0 or more of anything except hash followed by exit
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*exit\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^\s*quit\s*$\)')

"R demands that a number sent into quit must have a status=
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^\s*quit(\d\)')


"in R, type is 'typeof()  UNLIKE ALL THE OTHER LANGUAGES.
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^\s*type(\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\((type(\)')


"In R, not len, but length(
call matchadd('EricsCustomRMatcherHighlights', '\zs\([^_a-z]len(\)')

"In R, print must have parens
"Start of line, any amount of anything but a comment pound sign, literal print
"and whitespace is wrong
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*print\s\+\)')

"A print missing anything else is stupid
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^\s*print$\)')

"Wrong spelling of Nan should be red, 
"You can't just custom search for beginning of the line, any amount of
"anything that isn't a comment plus nan.  That false positives on things like
"is.nan.  Forcing at least one whitespace to left will solve some, keep testing
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*\s\+Nan\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*\s\+nan\)')

"Wrong spelling of Inf should be red, 
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*INF\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*InF\)')
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*inf\)')


"The word 'not' is not R, use pound
call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*not\s\+\)')



"Wrong spelling of NULL should be red, 
"These are not good enough because 'null' can appear inside other things like is.null.
"We can dismiss these since NULL glows purple, and default it's grey
"call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*Null\)')
"call matchadd('EricsCustomRMatcherHighlights', '\zs\(^[^#]*null\)')

"=============pre prodcessing header keywords HEADERS===========
" Functions that may add new objects
syn keyword rPreProc     library require attach detach source options
hi rPreProc         ctermfg=81

"============= rFunction is defined in the /usr/share/vim/vim80/syntax/r.vim=============

"WAIT STOP! If you higlight all user defined functions bright green then it will 
"latch on to things like to.string( with bright green making it look like a
"valid builtin when it's not.  So leave it normal
"hi rFunction     ctermfg=118 ctermbg=16     cterm=bold

"functions should be a bit brighter than comments with the same background as Normal
hi rFunction     ctermfg=254 ctermbg=234
syn match rFunction '[0-9a-zA-Z_\.]\+\s*\ze('


"==================== DOLLAR SIGN ======================================
"Dollar signs delimit R data.frame columns
syn match rDollar display contained "\$" 
hi rDollar     ctermfg=161              cterm=bold


"==================== DELIMITERS ===============================================
"Delimiters should be white like the functions?  meh
"hi rDelimiter ctermfg=999 ctermbg=16     cterm=bold

"Delimiter refers to parenthesis, square brackets curly braces and commas ({[]}),
"The code that matches them is in syntax/r.vim
"This gives the Delimiters a popout Black background because they are important


syn region rRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError 
syn region rRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError 
syn region rRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError 
syn match rError      "[)\]}]" 
syn match rBraceError "[)}]" contained 
syn match rCurlyError "[)\]]" contained 
syn match rParenError "[\]}]" contained

hi Delimiter ctermfg=173 ctermbg=16     cterm=bold



"=============special builtin keywords like function need to be a pleasing blue============


"Woah big TODO: I need to validate the proper usage of all these keywords:

"I'm drawing a line in the sand, my navigation uniformity takes priority over
"highlighting bullshit languages
"is.vector and data.frame are going to be one-off custom 



syn match  DtypePopout "\%(dtype(\)"
hi DtypePopout     ctermfg=999 ctermbg=16     cterm=bold



syn keyword rPrint print cat paste paste0
highlight rPrint ctermfg=126 cterm=bold

syn keyword rType array category character complex double function integer list logical matrix numeric vector
hi def link rType        Type
highlight Type ctermfg=81



"match toWhatevers strange builtins like toString(vector)  BEAUTIFUL!
"Match the beginning of the line, then any amount of anything that isn't a hashtag
"comment, then the target name toString( preceeded by space and before that anything that
"isn't a comma, equals or hash
call matchadd('BringGreenBoldStrangeBuiltin', '\(^[^#]*\s*\zstoString\ze(\)')

"Custom workarounds for is.vector:
highlight IsVectorHighlight ctermfg=81

"newline escape codes should be bright blue
call matchadd('IsVectorHighlight', '\(^[^#]*\zs\\n\)')


call matchadd('IsVectorHighlight', '\(^\s*\zsis\.vector\)')
call matchadd('IsVectorHighlight', '\(^[^#]*[\s\(]\+\zsis\.vector\)')


call matchadd('IsVectorHighlight', '\zs\(^[^\(=\-#]*data\.frame(\)')

call matchadd('IsVectorHighlight', '\(^[^#]*\zsfile\.exists\ze(\)')

call matchadd('IsVectorHighlight', '\zs\([^\(=\-#]*data\.matrix(\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=#]*is\.data\.frame\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=#]*is\.atomic\)')
"call matchadd('IsVectorHighlight', '\zs\([^\(=#]*set\.seed\)')
call matchadd('IsVectorHighlight', '\(^[^#]*\zsset\.seed\ze(\)')

call matchadd('IsVectorHighlight', '\zs\([^\(=#]*is\.null\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=#]*is\.character\)')

call matchadd('IsVectorHighlight', '\zs\([^\(\+\[=#]*is\.numeric\)')
call matchadd('IsVectorHighlight', '\zs\([^\(\+=#]*as\.numeric\)')

call matchadd('IsVectorHighlight', '\(^[^#]*\zsis\.integer(\)')
call matchadd('IsVectorHighlight', '\(^[^#]*\zsas\.integer(\)')

call matchadd('IsVectorHighlight', '\(^[^#]*[\(\+\-\[= ]\+\zsis\.integer(\)')
call matchadd('IsVectorHighlight', '\(^[^#]*[\(\+\-\[= ]\+\zsas\.integer(\)')

call matchadd('IsVectorHighlight', '\zs\([^\(=#]*is\.logical\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=#]*is\.matrix\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=#]*is\.list\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=#]*is\.function\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=#]*is\.nan\)')

call matchadd('IsVectorHighlight', '\zs\([^\(\+=#]*grepl\)')
call matchadd('IsVectorHighlight', '\zs\([^\(\+=#]*\s\+regexpr\)')
call matchadd('IsVectorHighlight', '\zs\([^\(\+\[=#]*sapply\)')

call matchadd('IsVectorHighlight', '\zs\([^\(\+\-=#]*Sys\.time\)')


call matchadd('IsVectorHighlight', '\zs\([^\(=#]*all(\)')

"nrow is problematic and needs two because it can occur in many different scenarios
call matchadd('IsVectorHighlight', '\(^\zsnrow\ze(\)')
call matchadd('IsVectorHighlight', '\(^\zsncol\ze(\)')

call matchadd('IsVectorHighlight', '\(^[^#]*[,\( ]\+\zsnrow\ze(\)')
call matchadd('IsVectorHighlight', '\(^[^#]*[,\( ]\+\zsncol\ze(\)')

call matchadd('IsVectorHighlight', '\(^\zsround\ze(\)')
call matchadd('IsVectorHighlight', '\(^[^#]*[\( ]\+\zsround\ze(\)') 

call matchadd('IsVectorHighlight', '\zs\([^\(=[/#,]*abs(\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=[/#,]*max(\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=[/#,]*min(\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=[/!#,]*duplicated(\)')
call matchadd('IsVectorHighlight', '\([^\(=[/#,]*\zssample\ze(\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=[/#]*read.csv(\)')
"call matchadd('IsVectorHighlight', '\zs\([^\(=[/#a-z]*t(\)')
"
"This t( is a bit brittle, it's not very unique
call matchadd('IsVectorHighlight', '\zs\(\s\+t(\)')
"call matchadd('IsVectorHighlight', '\zs\(\s\+dim(\)')


call matchadd('IsVectorHighlight', '\(^[^#]*(\zsc(\)')        "Problamatic because c is short
call matchadd('IsVectorHighlight', '\(^[^#]*\s\zsc(\)')
call matchadd('IsVectorHighlight', '\(^\s*\zsc(\)')

"zero or more of (beginning of line, literal left paren, equals, left square bracket, divide, 
"pound or comma followed by dim then left parenthesis should "be blue.
"Incredible, but it just works
call matchadd('IsVectorHighlight', '\zs\([^\(=[/#,]*dim(\)')     "This one is great


call matchadd('IsVectorHighlight', '\zs\([^\(=+#,]*floor(\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=+#,]*seq_len(\)')
call matchadd('IsVectorHighlight', '\(^[^#]*\zsrunif\ze(\)')

call matchadd('IsVectorHighlight', '\zs\([^\(=+#]*sum(\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=+*#]*sign(\)')  "asterisk in the square brackets is literal, asterisk after the right square bracket is one to many
call matchadd('IsVectorHighlight', '\(^[^#]*\zslength\ze(\)')
call matchadd('IsVectorHighlight', '\(^[^#]*[\(=:+/#><, ]\+\zslength\ze(\)')

call matchadd('IsVectorHighlight', '\zs\([^\(=+#]*log(\)')
call matchadd('IsVectorHighlight', '\zs\([^\(=+#]*exp(\)')
"call matchadd('IsVectorHighlight', '\zs\([^\(=#,]*typeof(\)')
call matchadd('IsVectorHighlight', '\(^[^#]*\zstypeof\ze(\)')
call matchadd('IsVectorHighlight', '\(^[^#]*\zsclass\ze(\)')


"Try to get around the dot limitation with shenanigans like escapes or quotes or stuff ask google

"============making a 180 wide line should not autowrap=======================
"It's taken care of from the .vimrc
"Some files like .vim files force-override the .vimrc, ha, nice


"============correctly capitalized booleans should be purple=======================
syn keyword rBoolean  FALSE TRUE
syn keyword rConstant T F LETTERS letters pi

"135 is a deep purple foreground
hi rBoolean        ctermfg=135


syn keyword rConstant NULL
hi rConstant ctermfg=201

"============= pressing space cc and space cu should comment and uncomment ===========================

"this makes it so you can Shift-V highlight lots of text then press ,cc
"to comment it or ,cu to uncomment.  
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"Plugin for nerdcommenter is best:
"https://github.com/sentientmachine/nerdcommenter


"=============return like keywords===========================
"return should be nice deep red

"syn match rOKeyword contained "@\(param\|return\|name\|rdname\|examples\|example\|include\|docType\)"
"
syn keyword returnKeyword return next break
hi returnKeyword ctermfg=160

"Assigning a color to this rStatement seems required because occasionally vim80/syntax/r.vim absolutly has to have the last fucking word on colorizing certain keywords like return, next, break
hi rStatement ctermfg=160

"
"============  Literal NA's Infs and NaN should be pink=======================
"
syn keyword rSpecialNumberName NA Inf NaN
hi def link rSpecialNumberName SpecialNumberName
hi SpecialNumberName   ctermfg=201



"====== Numbers or hexidecimal with an L after them ===========================
syn match rInteger "\<\d\+L"
syn match rInteger "\<0x\([0-9]\|[a-f]\|[A-F]\)\+L"
syn match rInteger "\<\d\+[Ee]+\=\d\+L"


" floating point number with integer and fractional parts and optional exponent
syn match rFloat "\<\d\+\.\d*\([Ee][-+]\=\d\+\)\="
" floating point number with no integer part and optional exponent
syn match rFloat "\<\.\d\+\([Ee][-+]\=\d\+\)\="
" floating point number with no fractional part and optional exponent
syn match rFloat "\<\d\+[Ee][-+]\=\d\+"

hi rInteger    ctermfg=135
hi rFloat ctermfg=135

"Regular number
syn match rNumber "\<\d\+\>"
" hexadecimal number
syn match rNumber "\<0x\([0-9]\|[a-f]\|[A-F]\)\+"

hi rNumber    ctermfg=135



"=============STRINGS==============================================
"

"string enclosed in double quotes
syn region rString contains=rSpecial,rStrError,@Spell start=/"/ skip=/\\\\\|\\"/ end=/"/

"string enclosed in single quotes
syn region rString contains=rSpecial,rStrError,@Spell start=/'/ skip=/\\\\\|\\'/ end=/'/

hi rString          ctermfg=144


"====Operators======
"the following 3 lines have to be before rOperator becuase overriding
"rAssign must be defined because sometimes vim80/syntax/r.vim has to have the last word
"syntax reset


syn match rOperator    "&"
syn match rOperator    '-'
syn match rOperator    '='
syn match rOperator    '\*'
syn match rOperator    '+'
syn match rOperator    "[|!<>^~`/:]"
syn match rOperator    "%\{2}\|%\S\{-}%"
syn match rOperator '\([!><]\)\@<=='
syn match rOperator '=='
hi rOperator      ctermfg=161


syn match rAssign "<\{1,2}-"
syn match rAssign "->\{1,2}"
hi rAssign ctermfg=227


"=============MENUS should not be default pink ==========================


hi Pmenu           ctermfg=81  ctermbg=16
hi PmenuSel                    ctermbg=244
hi PmenuSbar                   ctermbg=232
hi PmenuThumb      ctermfg=81

"Later on I want to get a handle on this menu with the plugins that tell me
"right things about this code.

"============= PRESSING ENTER AFTER A CODE LINE SHOULD AUTO-INENT Properly=============

"BUT, if you're pressing enter when previous line has indent, keep same indent, nice like python
"
"This part is set by the mysterious commands under ~/.vim/indent/r.vim
"It does the right thing, unencrypt it later


"=============I like the natural text a bit brighter

"I'm not sure how vim knows that the 'Normal' highlight applies to everything,
"the syntax file has no signature for it, maybe it's set somewhere else?
"
"252 is off white, 233 is black.   (Foreground of white is too aggressive)
hi Normal  ctermfg=252 ctermbg=234

"=============The CURSOR OVER A PARENTHESIS, CURLY BRACE, SQUARE BRACKET OR ANGLE BRACKET SHOULD HIGLIGHT ITS CLOSING NEIGHBOR RED LIKE PYTHON============

"NICE!  perfect!  Just like Python and PHP
"Matched parenthesis, square brackets, curly braces should be bold white foreground over black.
"Not enough to throw you off, but enough to see if you look for it
hi MatchParen      ctermfg=999  ctermbg=000 cterm=bold

"============= arrow left and equals should be highlighted properly ============


"for example <- and <<- ?
"TODO:  important

"============= Control-V highlighting a block of text should have pleasing inverse of colors ============


"for example <- and <<- ?
"TODO:  important

"=============================================================
                
"Below is noise



"" Basic Layout {{{
"hi Normal          guifg=#F8F8F2 guibg=#1B1E1F
"hi Folded          guifg=#666666 guibg=bg
"hi CursorLine                    guibg=#232728 cterm=none
"hi CursorColumn                  guibg=#232728
"hi ColorColumn                   guibg=#232728
"hi LineNr          guifg=#AAAAAA guibg=bg
"hi FoldColumn      guifg=#AAAAAA guibg=bg
"hi VertSplit       guifg=#AAAAAA guibg=bg gui=none
"hi Search          guifg=#000000 guibg=#E4E500
"hi IncSearch       guibg=#000000 guifg=#FF8D00
"" }}}
"" Syntax {{{
"hi Boolean         guifg=#AE81FF
"hi Comment         guifg=#5c7176
"hi Character       guifg=#E6DB74
"hi Number          guifg=#AE81FF
"hi String          guifg=#E6DB74
"hi Conditional     guifg=#F92672               gui=bold
"hi Constant        guifg=#AE81FF               gui=bold
"hi Debug           guifg=#BCA3A3               gui=bold
"hi Define          guifg=#66D9EF
"hi Delimiter       guifg=#8F8F8F
"hi Float           guifg=#AE81FF
"hi Function        guifg=#FFE22E
"hi Identifier      guifg=#FD971F
"hi Builtin         guifg=#AE81FF               gui=bold
"" }}}
"" Diffs {{{
"hi DiffAdd                       guibg=#0F1D0B
"hi DiffChange      guifg=#89807D guibg=#322F2D
"hi DiffDelete      guifg=#960050 guibg=#1E0010
"hi DiffText                      guibg=#4A4340 gui=italic,bold
"" }}}
"" Cursor {{{
"hi Cursor          guifg=#000000 guibg=#F35FBC
"hi iCursor         guifg=#000000 guibg=#FDFF00
"hi vCursor         guifg=#000000 guibg=#AAF412
"" }}}
"
"hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=#FFFFFF guibg=#604A8C
"hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=#FFFFFF guibg=#C50048
"
"hi EasyMotionTarget guifg=#E4E500 guibg=bg gui=bold
"hi EasyMotionShade  guifg=#444444 guibg=bg gui=bold
"hi Directory       guifg=#A6E22E               gui=bold
"hi Error           guifg=#960050 guibg=#1E0010
"hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
"hi Exception       guifg=#A6E22E               gui=bold
"hi Ignore          guifg=#808080 guibg=bg
"
"hi Keyword         guifg=#F92672               gui=bold
"hi Label           guifg=#E6DB74               gui=none
"hi Macro           guifg=#C4BE89               gui=italic
"hi SpecialKey      guifg=#66D9EF               gui=italic
"
"hi InterestingWord1 guifg=#000000 guibg=#FFA700
"hi InterestingWord2 guifg=#000000 guibg=#53FF00
"hi InterestingWord3 guifg=#000000 guibg=#FF74F8
"
"hi MatchParen      guifg=#E4E400 guibg=#434748 gui=bold
"hi ModeMsg         guifg=#E6DB74
"hi MoreMsg         guifg=#E6DB74
"hi Operator        guifg=#F92672
"
"" Completion Menu {{{
"highlight Pmenu ctermfg=white ctermbg=darkblue guifg=darkblue guibg=darkblue
"highlight PmenuSel   ctermfg=black      ctermbg=white
"
""hi Pmenu           guifg=#cccccc guibg=#232728
""hi PmenuSel        guifg=#000000 guibg=#AAF412
""hi PmenuSbar                     guibg=#131414
""hi PmenuThumb      guifg=#777777
"" }}}
"
"hi PreCondit       guifg=#A6E22E               gui=bold
"hi PreProc         guifg=#A6E22E
"hi Question        guifg=#66D9EF
"hi Repeat          guifg=#F92672               gui=bold
"
"" marks column
"hi IndentGuides                  guibg=#373737
"hi SignColumn      guifg=#A6E22E guibg=#151617
"hi SpecialChar     guifg=#F92672               gui=bold
"hi SpecialComment  guifg=#465457               gui=bold
"hi Special         guifg=#66D9EF guibg=bg      gui=italic
"hi SpecialKey      guifg=#888A85               gui=italic
"hi Statement       guifg=#F92672               gui=bold
"hi StatusLine      guifg=#CD5907 guibg=fg
"hi StatusLineNC    guifg=#808080 guibg=#080808
"hi StorageClass    guifg=#FD971F               gui=italic
"" Structure is the light blue color
"hi Structure       guifg=#66D9EF
"hi Tag             guifg=#F92672               gui=italic
"hi Title           guifg=#ef5939
"hi Todo            guifg=#FFFFFF guibg=bg      gui=bold
"
"hi Typedef         guifg=#66D9EF
"hi Type            guifg=#66D9EF               gui=none
"hi Underlined      guifg=#808080               gui=underline
"
"hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
"hi WildMenu        guifg=#66D9EF guibg=#000000
"
"hi MyTagListFileName guifg=#F92672 guibg=bg gui=bold
"
"" Spelling {{{
"if has("spell")
"    hi SpellBad    guisp=#FF0000 gui=undercurl
"    hi SpellCap    guisp=#7070F0 gui=undercurl
"    hi SpellLocal  guisp=#70F0F0 gui=undercurl
"    hi SpellRare   guisp=#FFFFFF gui=undercurl
"endif
"" }}}
"" Visual Mode {{{
"hi VisualNOS  guibg=#403D3D
"hi Visual     guibg=#403D3D
"" }}}
"" Invisible character colors {{{
"highlight NonText    guifg=#444444 guibg=bg
"highlight SpecialKey guifg=#444444 guibg=bg
"" }}}
"
"" Support for 256-color terminals {{{
"if &t_Co > 255
"   hi Boolean         ctermfg=135
"   hi Character       ctermfg=144
"   hi Number          ctermfg=135
"   hi String          ctermfg=144
"   hi Conditional     ctermfg=161               cterm=bold
"   hi Constant        ctermfg=135               cterm=bold
"   hi Cursor          ctermfg=16  ctermbg=253
"   hi Debug           ctermfg=225               cterm=bold
"   hi Define          ctermfg=81
"   hi Delimiter       ctermfg=241
"   hi Builtin         ctermfg=135               cterm=bold
"
"   hi EasyMotionTarget ctermfg=11
"   hi EasyMotionShade  ctermfg=8
"
"   hi DiffAdd                     ctermbg=24
"   hi DiffChange      ctermfg=181 ctermbg=239
"   hi DiffDelete      ctermfg=162 ctermbg=53
"   hi DiffText                    ctermbg=102 cterm=bold
"
"   hi Directory       ctermfg=118               cterm=bold
"   hi Error           ctermfg=219 ctermbg=89
"   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
"   hi Exception       ctermfg=118               cterm=bold
"   hi Float           ctermfg=135
"   hi FoldColumn      ctermfg=67  ctermbg=233
"   hi Folded          ctermfg=67  ctermbg=233
"   hi Function        ctermfg=118
"   hi Identifier      ctermfg=208
"   hi Ignore          ctermfg=244 ctermbg=232
"   hi IncSearch       ctermfg=193 ctermbg=16
"
"   hi Keyword         ctermfg=161               cterm=bold
"   hi Label           ctermfg=229               cterm=none
"   hi Macro           ctermfg=193
"   hi SpecialKey      ctermfg=81
"   hi MailHeaderEmail ctermfg=3  ctermbg=233
"   hi MailEmail       ctermfg=3  ctermbg=233
"
"   hi MatchParen      ctermfg=999  ctermbg=233 cterm=bold
"   hi ModeMsg         ctermfg=229
"   hi MoreMsg         ctermfg=229
"   hi Operator        ctermfg=161
"
"   " complete menu
"   "hi Pmenu           ctermfg=81  ctermbg=16
"   "hi PmenuSel                    ctermbg=244
"   "hi PmenuSbar                   ctermbg=232
"   "hi PmenuThumb      ctermfg=81
"
"   hi PreCondit       ctermfg=118               cterm=bold
"   hi PreProc         ctermfg=118
"   hi Question        ctermfg=81
"   hi Repeat          ctermfg=161               cterm=bold
"   hi Search          ctermfg=253 ctermbg=66
"
"   " marks column
"   hi SignColumn      ctermfg=118 ctermbg=235
"   hi SpecialChar     ctermfg=161               cterm=bold
"   hi SpecialComment  ctermfg=245               cterm=bold
"   hi Special         ctermfg=81  ctermbg=232
"   hi SpecialKey      ctermfg=245
"
"   hi Statement       ctermfg=161               cterm=bold
"   hi StatusLine      ctermfg=238 ctermbg=253
"   hi StatusLineNC    ctermfg=244 ctermbg=232
"   hi StorageClass    ctermfg=208
"   hi Structure       ctermfg=81
"   hi Tag             ctermfg=161
"   hi Title           ctermfg=166
"   hi Todo            ctermfg=231 ctermbg=232   cterm=bold
"
"   hi Typedef         ctermfg=81
"   hi Type            ctermfg=81                cterm=none
"
"
"   hi Underlined      ctermfg=244               cterm=underline
"
"   " NOTE: @pfdevilliers added this shit
"   " Not sure if this color with underlined was defined already
"   " but I added it for the definition of a class that is a 
"   " subclass.
"   hi InheritUnderlined      ctermfg=118               cterm=underline
"
"   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
"   hi VisualNOS                   ctermbg=238
"   hi Visual                      ctermbg=235
"   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
"   hi WildMenu        ctermfg=81  ctermbg=16
"
"   hi Normal          ctermfg=252 ctermbg=233
"   hi Comment         ctermfg=246 cterm=bold
"   hi CursorLine                  ctermbg=235   cterm=none
"
"   hi CursorColumn                ctermbg=234
"   hi ColorColumn                 ctermbg=234
"   hi LineNr          ctermfg=250 ctermbg=233
"   hi NonText         ctermfg=240 ctermbg=233
"end " }}}
"
