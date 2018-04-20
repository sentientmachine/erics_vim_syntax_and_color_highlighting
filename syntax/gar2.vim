syntax reset         "Undo all previous syntax highlighting details
set nospell          "vim spelling off by default
hi clear             "Undo all highlights before this point


set cursorline    "cursorline must be on to use the features, but don't forget
                  "You have to remove the underline and paint it right.

"============== COLOR LEGEND =======================================
"232    Blackest black
"999    whitest white
"
"172    vibrant brown for string Delimiters like " and '
"81     vibrant blue for R builtins like length( and max(
"118    vibrant green for python user defined functions
"201    vibrant pink for R constants like T, F, True, False
"208    vibrant orange for type keys like python Thread or self
"227    Vibrant yellow for R global assignment like <<-

"17     very dark blue for improperly capitalized words
"24     teal indicative of code error typical of eric mistake
"52     dark maroon for misspelled vim spell words
"144    typical brown for quoted strings
"135    purple typical of floats integers
"205    hot pink (not used)
"160    deepest red for python return, next, break
"161    deep red bold for if, for, while, quit, exit
"173    deep brown for delimiter foreground [({ and })]
"234    one perceptable step above black, optimal background
"252    off-white for typical code like variablenames
"099    purple-blue on black for hex numbers
"136    dull brown-yellow for complex numbers
"105    blue-purple for long digits like 3895L
"214    putrid orange-yellow for bitwise operators ~ & ^ | 
"add as needed

"=============== DEFAULT TEXT AREA BACKGROUND AND FOREGROUND ====================================================
"I'm not sure how vim just knows that the 'Normal' highlight applies to everything,
"the syntax file has no signature for it, maybe it's set in a standard .vim file
"252 is off white, 234 is near black.
hi Normal  ctermfg=252 ctermbg=234

"=============== THE LINE THE CURSOR IS ON SHOULD POP OUT SO /foo search catches eye =======================
"Java does it beautifuly, background is a bit lighter grey
"clear the CursorLine to get rid of the BS underline.  haha bullshit, 
"CONDITON: CursorLine is by default lower priority than matchadd, so searches get washed out
"The priority of CursorLine is zero, so set the matchdd's priorities to -1
hi clear CursorLine
hi CursorLine ctermbg=235
hi CursorLineNr ctermfg=999 ctermbg=black cterm=bold

"when you slash search /foo this is the attempted fg and bg
hi Search ctermfg=black ctermbg=227 cterm=bold

"======= PARENTHESIS, SQUARE BRACKETS AND CURLY BRACES ARE GUILTY UNTIL PROVEN INNOCENT ================

syn match   rightParen ")" display
syn match   leftParen "(" display
hi rightParen ctermfg=999 ctermbg=red
hi leftParen  ctermfg=999 ctermbg=red

syn match   rightSquare "]" display
hi rightSquare ctermfg=999 ctermbg=red
syn match   leftSquare "\[" display
hi leftSquare ctermfg=999 ctermbg=red

syn match   rightCurly "}" display
hi rightCurly ctermfg=999 ctermbg=red
syn match   leftCurly "{" display
hi leftCurly ctermfg=999 ctermbg=red


"=============== DEFAULT LINE NUMBER BACKGROUND AND FOREGROUND ====================================================
"This is important signature mnemonic of what language we're writing in
"LEGEND:      fg          bg

"bash        pink       black
"vimscript   lightblue  black
"html        250        236
"python2:    173 brown  Black
"python3:    135        black
"c
"c++         208        black
"java:       white      grey     bold
"R:          yellow     black
"psql.sql
"octave
"json
"Rmd
"php         red        black    bold
"markdown
"matlab
"perl

"Python2 gets brown on black
hi LineNr ctermfg=173 ctermbg=black  cterm=bold


"=============== PYTHON COMMENTS====================================================
"Comments should be spell checked, TODO bright white
syn match pythonCommentTodo contained "\(BUG\|FIXME\|NOTE\|TODO\):"
syn match pythonCommentWarningFyi contained "\(WARNING\|FYI\|LEGEND\|IMPERFECT\):"
syn match pythonComment contains=@Spell,pythonCommentTodo,pythonCommentWarningFyi "#.*"
hi def link pythonCommentTodo Todo
hi pythonComment              ctermfg=246 cterm=bold
hi pythonCommentTodo          ctermfg=999 cterm=bold
hi pythonCommentWarningFyi    ctermfg=118 cterm=None

"=============== PYTHON INCLUDE AND FOR DEEP RED=====================================================

syn keyword pythonInclude from import
hi pythonInclude ctermfg=161 cterm=bold

"=============== SHEBANG BLUE =====================================================
"color the shebang blue only if it's on the first line of the file
syn match   garShebang "\%^#!.*$"
hi garShebang  ctermfg=81 ctermbg=234 cterm=bold

"=============== BUILTINS like str( and min( =====================================================
"These are quicker than regexes, but the penalty is they highlight even if there's no parenthesis 
"after.  So use these where you don't have problems.
syn keyword pythonBuiltinFunc strip
syn keyword pythonBuiltinFunc enumerate abs all any apply basestring 
syn keyword pythonBuiltinFunc execfile file help intern long raw_input
syn keyword pythonBuiltinFunc reduce reload unichr unicode xrange
syn keyword pythonBuiltinFunc ascii exec memoryview
syn keyword pythonBuiltinFunc __import__ 
syn keyword pythonBuiltinFunc bin bool bytearray bytes
syn keyword pythonBuiltinFunc chr classmethod cmp compile complex
syn keyword pythonBuiltinFunc delattr dict dir divmod eval
syn keyword pythonBuiltinFunc filter float int format frozenset getattr
syn keyword pythonBuiltinFunc globals hasattr hash hex id
syn keyword pythonBuiltinFunc isinstance buffer callable coerce
syn keyword pythonBuiltinFunc issubclass iter len list locals map max
syn keyword pythonBuiltinFunc min next object oct open ord
syn keyword pythonBuiltinFunc pow property range
syn keyword pythonBuiltinFunc repr reversed round set setattr
syn keyword pythonBuiltinFunc slice sorted staticmethod str sum super tuple
syn keyword pythonBuiltinFunc type vars zip as pass

hi pythonBuiltinFunc ctermfg=81 ctermbg=234 cterm=None




"=============== FUNCTIONS =====================================================
"WARNING: this function block needs to be near the top of this file because it has bullshit 
"that is overridden by things lower down.
"
"function definitions 'def' needs to be eye grabbing blue and bold
"A python function is defined by the word def, whitespace, a valid function name, a left parenthesis
"a number of valid pythonVars, then end parenthesis and a colon.  Anything out of this format is
"a fail

"IMPERFECT: This isn't perfect because pythonvariables are delimited by commas, and commas can also
"be used to delimit items in a list such as myvar=[1,2,3], myvar2=[1,2,3], You need context we don't have
"What that means is don't be an idiot and do that, even though python respects it

"it's off limits to write: def foobar(myvar=[1,2,3]):
"otherwise the following is a work of fucking art

syn keyword pythonFuncDefinition def nextgroup=pythonFunction skipwhite
syn match pythonFunction "[a-zA-Z_][a-zA-Z0-9_]*" display contained

"I didn't know you could skip lines with a single backslash on the following line.  yay vimscript
syn match   pythonFunction
  \ "\%(\%(def\s\|class\s\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonVars

syn region pythonVars matchgroup=ParenthesisDelimiter start="(" matchgroup=ParenthesisDelimiter end=")" contained contains=pythonParameterNames transparent keepend

syn match pythonParameterNames "[^,]*" contained contains=pythonParam,pythonBrackets skipwhite
hi ParenthesisDelimiter ctermfg=172 ctermbg=black cterm=bold

"This stuff should be trimmed down massively, assuming there are any problems with mistakes in python method definitions
"WARNING: This stuff has failures in it and are ruining everything that has these symbols before this point
syn match pythonBullshitInsideFuncDefinitions "\%([~!^&|*/%+]\|\%(class\s*\)\@<!<<\|<=>\|<=\|\%(<\|\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|==\|=\~\|>>\|>=\|=\@<!>\|\*\*\|\.\.\.\|\.\.\|::\|=\)"

"This piece is probably fifty times overdone, simplify it
syn match pythonParam "=[^,]*" contained contains=pythonBullshitInsideFuncDefinitions,pythonBuiltinFunc,pythonBooleanConstant,pythonNumber,pythonString skipwhite
syn match pythonBrackets "[(|)]" contained skipwhite

hi pythonFuncDefinition ctermfg=81 ctermbg=234 cterm=bold
hi ParenthesisDelimiter ctermfg=172 ctermbg=black cterm=bold
hi pythonFunction ctermfg=118 ctermbg=234 cterm=bold

"The problem here is that it colors the Names orange
"hi pythonParameterNames ctermfg=208 ctermbg=234 cterm=bold
hi pythonParameterNames ctermfg=252 ctermbg=234 cterm=None


"Function definition delimiters should be a different color than parameters 
"that do list definitions or function calls

"=============== INTEGERS FLOATS LONGS COMPLEXES PURPLE =====================================================
"Numbers (ints, longs, floats, complex)
"The regular expression atoms \< and \> are keyword boundaries, other dialects of regex use \b
syn match   pythonNumber    "\<\d\+\>" display
syn match   pythonLong      "\<\d\+[lL]\>" display
syn match   pythonFloat     "\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syn match   pythonFloatExponent    "\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syn match   pythonFloatExponent    "\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=[jJ]\=" display
syn match   complexNumber        "\<\d\+[jJ]\>" display

hi pythonLong          ctermfg=105 ctermbg=234 cterm=bold
hi pythonFloat         ctermfg=135 ctermbg=234 cterm=bold
hi pythonFloatExponent ctermfg=135 ctermbg=234 cterm=bold
hi complexNumber       ctermfg=136 ctermbg=black cterm=bold
hi pythonNumber        ctermfg=135 ctermbg=234 cterm=bold

"=============== NO SECMICOLON AT ENDS OF NORMAL LINES ====================================================
"white on teal for ignorable problem, superfluous semicolon
syn match noSemicolonEnd ";\s*$"
hi noSemicolonEnd ctermfg=999 ctermbg=24 cterm=bold

"=============== HEXIDECIMAL, OCTAL AND BINARY ====================================================

syn match   pythonHexNumber "\<0[xX]\x\+[lL]\=\>" display
syn match   pythonOctNumber "\<0[0-7]*\>" display
syn match   pythonBinNumber "\<0[bB][01]\+[lL]\=\>" display
hi pythonHexNumber ctermfg=099 ctermbg=black cterm=bold
hi pythonOctNumber ctermfg=099 ctermbg=black cterm=bold
hi pythonBinNumber ctermfg=099 ctermbg=black cterm=bold


"===============  LONG, HEX, OCTAL NUMBER ERRORS =====================================================
"long is whole number, can't have decimal points:
syn match   pythonLongError  "\<\d\+\.\d*[lL]\>" display
hi pythonLongError ctermfg=999 ctermbg=red cterm=bold

syn match   pythonHexError      "\<0[xX]\x*[g-zG-Z]\+\x*[lL]\=\>" display
hi pythonHexError ctermfg=999 ctermbg=red cterm=bold

syn match   pythonOctError "\<0[0-7]*[8-9]\+.*\>" display
hi pythonOctError ctermfg=999 ctermbg=red cterm=bold

"SWEET!  catches mistakes in set binary numbers (no periods and no non 01 letters
syn match   pythonBinaryError "\<0[bB][01]\+[^01]\+.*\>" display
hi pythonBinaryError ctermfg=999 ctermbg=red cterm=bold


"=============== if, for, while, exit, try, except, signature red bold else =========================
syn keyword pythonConditionsLoops       if else for while exit try except print quit
hi pythonConditionsLoops ctermfg=161 ctermbg=234 cterm=bold

"======== Arithmetic Operators equals, double equals, + - / * exponentiation, etc red, No bold===========
"in python:
"plus is decimal addition
"minus is decimal subtraction
"single asterisk multiplication
"slash is division
"percent is modulus, division remainder
"A problem with this is that it wigs out if it sees the global assignment operator ->
"it's mitigated with the fact that further down this is undone explicitly
syn match  pythonArithmeticOperators   "[*/+%\-]"
hi pythonArithmeticOperators ctermfg=161 ctermbg=234 cterm=None



"======== BITWISE Operators bizarre color, No bold===========
"in python
"tilda is binary negation
"carrot is bitwise xor
"single ampersand returns binary number such that bin1 & bin2 is where bin1 and bin2 share ones
"single pipe bitwise or
"percent is modulus operator between numbers and inside a string it is a formula

syn match  pythonBitwiseOperators "\%([~^&|]\)"
hi pythonBitwiseOperators ctermfg=214 ctermbg=234 cterm=None

"======== BITWISE errors fail red===============================
"double ampersand is always wrong, python doesn't support that
syn match doubleAmpersandBad "&&"
hi doubleAmpersandBad ctermfg=999 ctermbg=red cterm=bold

syn match doublePipesBad "||"
hi doublePipesBad ctermfg=999 ctermbg=red cterm=bold

"Bang without an equals, to mean not equals, has no meaning
syn match doubleAmpersandBad "![^=]"
hi doubleAmpersandBad ctermfg=999 ctermbg=red cterm=bold

"======== ASSIGNMENT operators and COMPOUND ASSIGNMENT signature red, No bold===============================
"Assignment is single equals
"Compount assignment minus equals, plus equals, divide equals, times equals, modulus equals 
"-= += *= /= **= %=

syn match  pythonAssignAndCompoundAssign "\%(+=\|-=\|/=\|\*=\|%=\)"
hi pythonAssignAndCompoundAssign ctermfg=161 ctermbg=234 cterm=None

"====================== COMPARISON OPERATORS =================================================
"Less than <
"greater than >
"less than or equal to <=
"greater than or equal to >=
"double equals
"left shift <<
"right shift >>
syn match  pythonComparisonOperators   "\%(<=\|==\|!=\|=\~\|>>\|<<\|>=\|\*\*\|=\)"
hi pythonComparisonOperators  ctermfg=161 ctermbg=234 cterm=None



"======== FUCKED UP OPERATORS, BAD ===============================
"These are technically right, but as far as I'm concerned they are bullshit errors
"
"colon colon happens with numpy array slicing, revisit this later
"double ampersand and double pipe are not and and or in python
"
syn match  wtfAssignments "\%(\.\.\.\|\.\.\|::\)"
hi wtfAssignments ctermfg=999 ctermbg=red cterm=None

"
"syn match  pythonError   "\%(\%(class\s*\)|\%(\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|===\|=\~\)"

"======== ASSIGNMENT operators ERRORS ===============================
"triple equals isn't legal python

syn match tripleEqualsFail "==="
hi tripleEqualsFail ctermfg=999 ctermbg=red cterm=bold

syn match lessThanEqualGtNo "<=>"
hi lessThanEqualGtNo ctermfg=999 ctermbg=red cterm=bold



"======== Logical Operators signature red, No bold===============================

syn keyword pythonLogicalOperators not and or in is
hi pythonLogicalOperators ctermfg=161 ctermbg=234 cterm=None





"=============== BOOLEAN CONSTANT Names =====================================================
"Python boolean constant named variables are camelcase, no other casing allowed
syn keyword pythonBooleanConstant  True False None
hi pythonBooleanConstant ctermfg=201 ctermbg=234 cterm=bold


"=============== BOOLEAN NAME ERRORS =====================================================
"Python does not allow naked T or F for boolean constants like R does
"
"syn keyword pythonBooleanConstant  True False None
"hi pythonBooleanConstant ctermfg=201 ctermbg=234 cterm=bold

syn keyword badBoolean  FALSE TRUE false true T F none NONE
hi badBoolean ctermfg=999 ctermbg=24


"=============== NIL NAN NULL INF be teal bg  =====================================================
"
"NAN
syn keyword badNan  nan Nan NAN NaN
hi badNan ctermfg=999 ctermbg=24
"FYI: proper way to assign nan is float("nan")

"NULL
syn keyword badNULL NULL Null null
hi badNULL ctermfg=999 ctermbg=24
"FYI: proper way to assign Null is None

"NIL
syn keyword badNIL NIL Nil nil
hi badNIL ctermfg=999 ctermbg=24

"INF
syn keyword badINF INF Inf inf
hi badINF ctermfg=999 ctermbg=24
"FYI: proper way to assign inf is float("inf")

"======== ASSIGNMENT OPERATORS errors white on red bg===============================
"Python only has single equals for assignment, no <<- nor <- nor -> nor -->
"WARNING: These lines must occur after pythonArithmeticOperators to override the over simplistic damage
"WARNING: These lines must occur after FUNCTION DEFINITION HIGLIGHTING the over damage there from literal hyphen matcher
syn match rAssignBad "<\{1,2}-"
syn match rAssignBad "->\{1,2}"
hi rAssignBad ctermfg=999 ctermbg=red


"=============== // at beginning of a line not in a pound comment is java fail=======================
"WARNING: this has to be after the matchers that look for division /
syn match noJavaComment "^\s*//"
hi noJavaComment ctermfg=999 ctermbg=red cterm=bold

"========================

"Blaring siren warning, white on red background
hi redSyntaxCertainFail ctermfg=999 ctermbg=red

"Sharp white on teal background, very likely wrong
hi tealSyntaxFail ctermfg=999 ctermbg=24 

"Just a hint of grey background on normal foreground
hi lightTealSyntaxWarn ctermfg=252 ctermbg=236

""Hopefully the following doesn't interfere with any python special unicode in strings
"Any non-ascii characters should be highlighted teal background
call matchadd('tealSyntaxFail', '\zs\([^\x00-\x7F]\)', -1) 

".trim() isn't a valid python builtin, correct is 'foobar'.strip() function on string class
call matchadd("redSyntaxCertainFail", '\(^[^#]*\zs\.trim(\ze\)', -1)

"strip(...) isn't a valid python builtin, it's 'foobar'.strip() function on string class
call matchadd("redSyntaxCertainFail", '\(^[^#]*\zsstrip(\ze[a-z0-9]\+\)', -1)

"Dr Haaxxxx!
"This matcher puts teal background for unnecessary whitespace at the end of line
call matchadd('tealSyntaxFail', '\zs\(\S\zs\s\{2,}$\)', -1)

"Highlight whitespace lines that are more than 22 spaces wide. 
call matchadd('tealSyntaxFail', '\zs\(^\s\{22,}\s\+$\)', -1)


"In python, 'else if' is always wrong, the correct is elif(conditional):   Fucking kickass
call matchadd("tealSyntaxFail", '\(^\s*\zselse\s\+if\)', -1)

"In python, 'else' may not have a conditional after.
call matchadd("tealSyntaxFail", '\(^\s*\zselse\s*(\)', -1)

"In python, 'else' must have a semicolon after
call matchadd("tealSyntaxFail", '\(^\s*\zselse[^:]\)', -1)

"make teal bg any string that starts with single quote and ends with double quote
"Magic regex, kind of brittle
"This doesn't work absolutly everywhere, like when there are nested single quotes inside double, but thats a haax
call matchadd('lightTealSyntaxWarn', '\(^[^#]\+''[a-z\-_{}]\+"\s*$\)', -1)
call matchadd('lightTealSyntaxWarn', '\(^[^#]\+"[a-z\-_{}]\+''\s*$\)', -1)

"float or int as the first thing is an error
call matchadd("redSyntaxCertainFail", '\zs\(^\s*float\s\|^\s*int\s\)', -1)

"Invisible tabs at beginning of line are python evil
call matchadd("tealSyntaxFail", '\zs\(^\t\+\)', -1)

"a return statejment with an equals sign after is wrong
call matchadd("tealSyntaxFail", '\(^\s*\zsreturn\s*=\)', -1)

"for i in number, it seems right, but it needs xrange or range or something
call matchadd("redSyntaxCertainFail", '\(^\s*\zsfor.*in\s\+[0-9]\+:*$\)', -1)

"Typical eric error is to include parenthes around python for loops like this:
"(x in range(3)): which is always an error
call matchadd("redSyntaxCertainFail", '\(^[^#]*\s*\zsfor\s*(\)', -1)

"The word 'quit' or 'exit' by itself is just a variablename, it needs parens
call matchadd("redSyntaxCertainFail", '\zs\(^\s*quit\s*(*$\)', -1)
call matchadd("redSyntaxCertainFail", '\zs\(^\s*exit\s*(*$\)', -1)

"python doesn't have curly braces after the if, so highlight that shit red
"It's okay that we don't capture spaces after, because it blinks at us as we type
call matchadd("redSyntaxCertainFail", '\(^\s*\zsif.*{$\)', -1)
call matchadd("redSyntaxCertainFail", '\(^\s*\zstry.*{$\)', -1)
call matchadd("redSyntaxCertainFail", '\(^\s*\zsfor.*{$\)', -1)


"Kung Fu eric mistake, if statement ends with 'and' or 'or' and is missing a line continuator like backslash
"if a line starts with 'if', has no left parenthesis and ends with ' or ' then
"it's a syntax error, also 'and'
call matchadd("redSyntaxCertainFail", '\zs\(^\s*if [A-Za-z].*\s*or\s*$\)', -1)
call matchadd("redSyntaxCertainFail", '\zs\(^\s*if [A-Za-z].*\s*and\s*$\)', -1)

"I often times get equals and double equals mixed up since psql uses equals as
"comparison and assignment.
"could be brittle though because lambdas and condensed loops may match here
call matchadd("tealSyntaxFail", '\(^[^#]*\zs\s*if[^a-zA-Z0-9].*\s=\s\)', -1)
call matchadd("tealSyntaxFail", '\(^[^#]*\zs\s*for[^a-zA-Z0-9].*\s=\s\)', -1)
call matchadd("tealSyntaxFail", '\(^[^#]*\zs\s*while.*\s=\s\)', -1)

"Demon Magic for 'if' to make sure a python if statement terminates with a colon
""An if statement that doesn't end in a \ or a colon is an error?
"A line that must start with whitespace if space, that narrows
call matchadd("tealSyntaxFail", '\(^[^#]*\s*if[^a-zA-Z].*[^\[\: \]\[or\]\[and\]]\+$\)', -1)
call matchadd("tealSyntaxFail", '\(^[^#]*\s*if[^a-zA-Z].*[^\[\: \]\[or\]\[and\]]\+\s$\)', -1)

"Demon Magic 'for' should always terminate with a colon
"A for statement with 'for' that doesn't end in a backslash or a colon is an error
call matchadd("tealSyntaxFail", '\(^[^#"]*\s*for[^a-zA-Z].*[^\[\: \]\[or\]\[and\]]\+$\)', -1)
call matchadd("tealSyntaxFail", '\(^[^#"]*\s*for[^a-zA-Z].*[^\[\: \]\[or\]\[and\]]\+\s$\)', -1)

"In a python for, the line immediately after the for must have more indentation, not the same
call matchadd("tealSyntaxFail", '\(^for[^a-zA-Z].*\n[^ ]\+\)')
"call matchadd("EricsCustomPythonMatcherHighlights", '\(^\s\{2\}for[^a-zA-Z].*\n\s\{2\}[^ ]\+\)')
call matchadd("tealSyntaxFail", '\(^\s\{4\}for[^a-zA-Z].*\n\s\{4\}[^ ]\+\)', -1)
"call matchadd("EricsCustomPythonMatcherHighlights", '\(^\s\{6\}for[^a-zA-Z].*\n\s\{6\}[^ ]\+\)')
call matchadd("tealSyntaxFail", '\(^\s\{8\}for[^a-zA-Z].*\n\s\{8\}[^ ]\+\)', -1)
"call matchadd("EricsCustomPythonMatcherHighlights", '\(^[^#"]*for[^a-zA-Z].*\n\s\{4,\}\)')


"In a python if, the line immediately after the for must have more indentation, not the same
call matchadd("tealSyntaxFail", '\(^if[^a-zA-Z].*\n[^ ]\+\)')
"call matchadd("EricsCustomPythonMatcherHighlights", '\(^\s\{2\}for[^a-zA-Z].*\n\s\{2\}[^ ]\+\)')
call matchadd("tealSyntaxFail", '\(^\s\{4\}if[^a-zA-Z].*\n\s\{4\}[^ ]\+\)', -1)
"call matchadd("EricsCustomPythonMatcherHighlights", '\(^\s\{6\}for[^a-zA-Z].*\n\s\{6\}[^ ]\+\)')
call matchadd("tealSyntaxFail", '\(^\s\{8\}if[^a-zA-Z].*\n\s\{8\}[^ ]\+\)', -1)
"call matchadd("EricsCustomPythonMatcherHighlights", '\(^[^#"]*for[^a-zA-Z].*\n\s\{4,\}\)')


"custom if-fail, open paren, ends without a close before the final colon
"wew magic: fail   BRILLIANT
call matchadd("tealSyntaxFail", '\(^\s*if\s\+([^)]*:$\)', -1)
call matchadd("tealSyntaxFail", '\(^\s*if\s\+[^(]*):$\)', -1)



"Plusses are to be escaped with a backslash, 
"#stupid!  Plusses can terminate lines inside functions params but not other places?
"This needs some work because it requires a backslash before whole quoted continued lines.
call matchadd("tealSyntaxFail", '\(^[^#(]*+\s*$\)', -1)

"set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set listchars=tab:→\ ,eol:\ ,nbsp:‡,trail:\ ,extends:▶,precedes:◀ 




"=============== Strings can have any characters =====================================================
"The triple equals should not be red if quoted
"a = "===" is okay

"WOW you're saying that strings can be vim spelled?  WOW!

"the 'oneline' keyword after the syn region in vim enforces one-line matching only
"fucking fantastic!

" string enclosed in DOUBLE quotes \"
syn region pythonString contains=pythonStringEscapeCode,@Spell matchgroup=QuoteDelimiter start=/"/ skip=/\\\\\|\\"/ matchgroup=QuoteDelimiter end=/"/ oneline

" string enclosed in SINGLE quotes \'
syn region pythonString contains=pythonStringEscapeCode,@Spell matchgroup=QuoteDelimiter start=/'/ skip=/\\\\\|\\'/ matchgroup=QuoteDelimiter end=/'/ oneline

" New line, carriage return, tab, backspace, bell, feed, vertical tab, backslash
syn match pythonStringEscapeCode display contained "\\\(n\|r\|t\|b\|a\|f\|v\|'\|\"\)\|\\\\"

" Hexadecimal and Octal digits
syn match pythonStringEscapeCode display contained "\\\(x\x\{1,2}\|[0-8]\{1,3}\)"

" Unicode characters
" UNICODE INSIDE STRINGS IS OKAY WHAT IS THIS NONSENSE WHERE ARE MY ROUNDS!
syn match pythonStringEscapeCode display contained "\\u\x\{1,4}"
syn match pythonStringEscapeCode display contained "\\U\x\{1,8}"
syn match pythonStringEscapeCode display contained "\\u{\x\{1,4}}"
syn match pythonStringEscapeCode display contained "\\U{\x\{1,8}}"

hi pythonString ctermfg=144 ctermbg=234 cterm=None
hi pythonStringEscapeCode ctermfg=144 ctermbg=234 cterm=None
hi pythonStringEscapeCode ctermfg=81 ctermbg=234 cterm=bold

hi QuoteDelimiter ctermfg=172 ctermbg=black cterm=bold



"=============MENU COLORS should be bright blue on black==========================

hi Pmenu           ctermfg=81  ctermbg=16
hi PmenuSel                    ctermbg=244
hi PmenuSbar                   ctermbg=232
hi PmenuThumb      ctermfg=81

"============CUSTOM NUMPY AND BUILTIN THINGS ===============================================

syn match  NumpyDatatype "\%(np.float32\)"
syn match  NumpyDatatype "\%(np.float64\)"
syn match  NumpyDatatype "\%(np.int64\)"
syn match  NumpyDatatype "\%(np.uint8\)"
syn match  NumpyDatatype "\%(np.string_\)"

syn match  NumpyDatatype "\%(cv2.CV_64F\)"
syn match  NumpyDatatype "\%(cv2.CV_32F\)"
hi NumpyDatatype   ctermfg=118 ctermbg=16

syn match  NumpyBuiltin "\%(np.copy\)"
syn match  NumpyBuiltin "\%(np.ndarray\)"
syn match  NumpyBuiltin "\%(np.average\)"
syn match  NumpyBuiltin "\%(os.path.exists\)"
syn match  NumpyBuiltin "\%(np.sum\)"
syn match  NumpyBuiltin "\%(np.zeros\)"
syn match  NumpyBuiltin "\%(np.sqrt\)"
syn match  NumpyBuiltin "\%(np.ones\)"
syn match  NumpyBuiltin "\%(np.sin\)"
syn match  NumpyBuiltin "\%(np.dot(\)"
syn match  NumpyBuiltin "\%(np.concatenate\)"
syn match  NumpyBuiltin "\%(cv2.sepFilter2D\)"
syn match  NumpyBuiltin "\%(cv2.remap\)"

syn match  NumpyMethod "\%(.transpose()\)"
syn match  NumpyMethod "\%(\.shape\)"
syn match  NumpyMethod "\%(.tolist()\)"
syn match  NumpyMethod "\%(.astype(\)"

hi NumpyBuiltin    ctermfg=81 ctermbg=16     cterm=bold
syn match  CV2Method "\%(cv2.line(\)"
syn match  CV2Method "\%(cv2.circle(\)"
syn match  CV2Method "\%(cv2.normalize(\)"
syn match  CV2Method "\%(cv2.Sobel(\)"
syn match  CV2Method "\%(cv2.GaussianBlur(\)"
syn match  CV2Method "\%(cv2.WarpAffine(\)"
syn match  CV2Method "\%(cv2.imshow(\)"
syn match  CV2Method "\%(cv2.waitKey(\)"
syn match  CV2Method "\%(cv2.destroyAllWindows(\)"
syn match  CV2Method "\%(cv2.getRotationMatrix2D(\)"
syn match  CV2Method "\%(cv2.cornerHarris(\)"
syn match  CV2Method "\%(cv2.resize(\)"
syn match  CV2Method "\%(cv2.cvtColor(\)"


"OK WTF is wrong, cv2.Canny can't include left parenthesis or it ruins the brace matcher
syn match  CV2Method "\%(cv2.Canny\)"
syn match  CV2Method "\%(cv2.imread(\)"
syn match  CV2Method "\%(cv2.matchTemplate(\)"


syn match  DtypePopout "dtype"


"You can add special errors to colors file
"syn match  pythonError   "\%(asdf\)"
syn match  pythonError   "\%( split(\)"          "split without dot before it, problem
syn match  pythonError   "\%(\.len(\)"           "len after a dot, invalid
syn match  pythonError   "\%(\.length(\)"        "len after a dot, invalid
syn match  pythonError   "\%(\.shape()\)"

hi pythonError ctermfg=999 ctermbg=red cterm=None

hi NumpyMethod     ctermfg=100 ctermbg=16     cterm=bold
hi CV2Method       ctermfg=97 ctermbg=16     cterm=bold
hi DtypePopout ctermfg=999 ctermbg=234 cterm=bold

"=============== ORANGE PARENTHESIS AND DELIMITERS =====================================================
"This has to be at the end
"At the beginning we said all parenthesis, curly braces and square brackets are big errors, until proven innocent here
syn region rRegion matchgroup=Delimiter start=/(/  matchgroup=Delimiter end=/)/ transparent
syn region miscParenthesisRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent
syn region miscParenthesisRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent
hi Delimiter ctermfg=173 ctermbg=16     cterm=None





"STILL MORE TO DO: 
"1.  HANDLE colons like in numpy and opencv



"===============  =====================================================
"===============  =====================================================
"===============  =====================================================



" kk


"if exists("b:current_syntax")
"  finish
"endif

"syn iskeyword @,48-57,_,.
"
"if exists("g:r_syntax_folding") && g:r_syntax_folding
"  setlocal foldmethod=syntax
"endif
"if !exists("g:r_hl_roxygen")
"  let g:r_hl_roxygen = 1
"endif

"syn case match

" Comment
"syn match rCommentTodo contained "\(BUG\|FIXME\|NOTE\|TODO\):"
"syn match rComment contains=@Spell,rCommentTodo,rOBlock "#.*"

" Roxygen
"if g:r_hl_roxygen
"  syn region rOBlock start="^\s*\n#\{1,2}' " start="\%^#\{1,2}' " end="^\(#\{1,2}'\)\@!" contains=rOTitle,rOKeyword,rOExamples,@Spell keepend
"  syn region rOTitle start="^\s*\n#\{1,2}' " start="\%^#\{1,2}' " end="^\(#\{1,2}'\s*$\)\@=" contained contains=rOCommentKey
"  syn match rOCommentKey "#\{1,2}'" containedin=rOTitle contained

"  syn region rOExamples start="^#\{1,2}' @examples.*"rs=e+1,hs=e+1 end="^\(#\{1,2}' @.*\)\@=" end="^\(#\{1,2}'\)\@!" contained contains=rOKeyword

"  syn match rOKeyword contained "@\(param\|return\|name\|rdname\|examples\|example\|include\|docType\)"
"  syn match rOKeyword contained "@\(S3method\|TODO\|aliases\|alias\|assignee\|author\|callGraphDepth\|callGraph\)"
"  syn match rOKeyword contained "@\(callGraphPrimitives\|concept\|exportClass\|exportMethod\|exportPattern\|export\|formals\)"
"  syn match rOKeyword contained "@\(format\|importClassesFrom\|importFrom\|importMethodsFrom\|import\|keywords\|useDynLib\)"
"  syn match rOKeyword contained "@\(method\|noRd\|note\|references\|seealso\|setClass\|slot\|source\|title\|usage\)"
"  syn match rOKeyword contained "@\(family\|template\|templateVar\|description\|details\|inheritParams\|field\)"

"endif

"GOOD
"
"if &filetype == "rhelp"
"  " string enclosed in double quotes
"  syn region rString contains=rSpecial,@Spell start=/"/ skip=/\\\\\|\\"/ end=/"/
"  " string enclosed in single quotes
"  syn region rString contains=rSpecial,@Spell start=/'/ skip=/\\\\\|\\'/ end=/'/
"else
"  " string enclosed in double quotes
"  syn region rString contains=rSpecial,rStrError,@Spell start=/"/ skip=/\\\\\|\\"/ end=/"/
"  " string enclosed in single quotes
"  syn region rString contains=rSpecial,rStrError,@Spell start=/'/ skip=/\\\\\|\\'/ end=/'/
"endif
"
"syn match rStrError display contained "\\."
"
"
"" New line, carriage return, tab, backspace, bell, feed, vertical tab, backslash
"syn match rSpecial display contained "\\\(n\|r\|t\|b\|a\|f\|v\|'\|\"\)\|\\\\"
"
"" Hexadecimal and Octal digits
"syn match rSpecial display contained "\\\(x\x\{1,2}\|[0-8]\{1,3}\)"
"
"" Unicode characters
"syn match rSpecial display contained "\\u\x\{1,4}"
"syn match rSpecial display contained "\\U\x\{1,8}"
"syn match rSpecial display contained "\\u{\x\{1,4}}"
"syn match rSpecial display contained "\\U{\x\{1,8}}"
"
"" Statement
"syn keyword rStatement   break next return
"syn keyword rConditional if else
"syn keyword rRepeat      for in repeat while
"
"" Constant (not really)
"syn keyword rConstant T F LETTERS letters month.abb month.name pi
"syn keyword rConstant R.version.string
"
"syn keyword rNumber   NA_integer_ NA_real_ NA_complex_ NA_character_
"
"" Constants
"syn keyword rConstant NULL
"syn keyword rBoolean  FALSE TRUE
"syn keyword rNumber   NA Inf NaN
"
"" integer
"syn match rInteger "\<\d\+L"
"syn match rInteger "\<0x\([0-9]\|[a-f]\|[A-F]\)\+L"
"syn match rInteger "\<\d\+[Ee]+\=\d\+L"
"
"" number with no fractional part or exponent
"syn match rNumber "\<\d\+\>"
"" hexadecimal number
"syn match rNumber "\<0x\([0-9]\|[a-f]\|[A-F]\)\+"
"
"" floating point number with integer and fractional parts and optional exponent
"syn match rFloat "\<\d\+\.\d*\([Ee][-+]\=\d\+\)\="
"" floating point number with no integer part and optional exponent
"syn match rFloat "\<\.\d\+\([Ee][-+]\=\d\+\)\="
"" floating point number with no fractional part and optional exponent
"syn match rFloat "\<\d\+[Ee][-+]\=\d\+"
"
"" complex number
"syn match rComplex "\<\d\+i"
"syn match rComplex "\<\d\++\d\+i"
"syn match rComplex "\<0x\([0-9]\|[a-f]\|[A-F]\)\+i"
"syn match rComplex "\<\d\+\.\d*\([Ee][-+]\=\d\+\)\=i"
"syn match rComplex "\<\.\d\+\([Ee][-+]\=\d\+\)\=i"
"syn match rComplex "\<\d\+[Ee][-+]\=\d\+i"
"
"syn match rAssign    '='
"syn match rOperator    "&"
"syn match rOperator    '-'
"syn match rOperator    '\*'
"syn match rOperator    '+'
"if &filetype != "rmd" && &filetype != "rrst"
"  syn match rOperator    "[|!<>^~/:]"
"else
"  syn match rOperator    "[|!<>^~`/:]"
"endif
"syn match rOperator    "%\{2}\|%\S\{-}%"
"syn match rOperator '\([!><]\)\@<=='
"syn match rOperator '=='
"syn match rOpError  '\*\{3}'
"syn match rOpError  '//'
"syn match rOpError  '&&&'
"syn match rOpError  '|||'
"syn match rOpError  '<<'
"syn match rOpError  '>>'
"
"syn match rAssign "<\{1,2}-"
""syn match rAssign "->\{1,2}"
"
"" Special
"syn match rDelimiter "[,;:]"
"
"" Error
"if exists("g:r_syntax_folding")
"  syn region rRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError fold
"  syn region rRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError fold
"  syn region rRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError fold
"else
"  "syn region rRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError
"  syn region rRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError
"  syn region rRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError
"endif
"
"syn match rError      "[)\]}]"
"syn match rBraceError "[)}]" contained
"syn match rCurlyError "[)\]]" contained
"syn match rParenError "[\]}]" contained
"
"if !exists("g:R_hi_fun")
"  let g:R_hi_fun = 1
"endif
"if g:R_hi_fun
"  " Nvim-R:
"  runtime R/functions.vim
"endif
"
"syn match rDollar display contained "\$"
"syn match rDollar display contained "@"
"
"" List elements will not be highlighted as functions:
"syn match rLstElmt "\$[a-zA-Z0-9\\._]*" contains=rDollar
"syn match rLstElmt "@[a-zA-Z0-9\\._]*" contains=rDollar
"
"" Functions that may add new objects
"syn keyword rPreProc     library require attach detach source
"
"if &filetype == "rhelp"
"  syn match rHelpIdent '\\method'
"  syn match rHelpIdent '\\S4method'
"endif
"
"" Type
"syn keyword rType array category character complex double function integer list logical matrix numeric vector data.frame
"
"" Name of object with spaces
"if &filetype != "rmd" && &filetype != "rrst"
"  syn region rNameWSpace start="`" end="`"
"endif
"
"if &filetype == "rhelp"
"  syn match rhPreProc "^#ifdef.*"
"  syn match rhPreProc "^#endif.*"
"  syn match rhSection "\\dontrun\>"
"endif
"
"if exists("r_syn_minlines")
"  exe "syn sync minlines=" . r_syn_minlines
"else
"  syn sync minlines=40
"endif
"
"" Define the default highlighting.
"hi def link rAssign      Statement
"hi def link rBoolean     Boolean
"hi def link rBraceError  Error
"hi def link rComment     Comment
"hi def link rCommentTodo Todo
"hi def link rComplex     Number
"hi def link rConditional Conditional
"hi def link rConstant    Constant
"hi def link rCurlyError  Error
"hi def link rDelimiter   Delimiter
"hi def link rDollar      SpecialChar
"hi def link rError       Error
"hi def link rFloat       Float
"hi def link rFunction    Function
"hi def link rHelpIdent   Identifier
"hi def link rhPreProc    PreProc
"hi def link rhSection    PreCondit
"hi def link rInteger     Number
"hi def link rLstElmt     Normal
"hi def link rNameWSpace  Normal
"hi def link rNumber      Number
"hi def link rOperator    Operator
"hi def link rOpError     Error
"hi def link rParenError  Error
"hi def link rPreProc     PreProc
"hi def link rRepeat      Repeat
"hi def link rSpecial     SpecialChar
"hi def link rStatement   Statement
"hi def link rString      String
"hi def link rStrError    Error
"hi def link rType        Type
"if g:r_hl_roxygen
"  hi def link rOKeyword    Title
"  hi def link rOBlock      Comment
"  hi def link rOTitle      Title
"  hi def link rOCommentKey Comment
"  hi def link rOExamples   SpecialComment
"endif



"syn match rComment contains=@Spell,rCommentTodo,rOBlock "#.*"
"hi def link rComment     Comment
