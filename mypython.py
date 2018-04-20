#!/usr/bin/python -tt
#The shebang instructs vim to load python.vim things, I want to leave those alone, 
#but I also want the python shebang as the first line.
#1.  Rename the python.vim files under
#shebang on the top is blue, but normal grey on any other line
#TODO: on a line should be white bold
#FIXME: on a line should be white bold
#BUG: on a line should be white bold
#NOTE: on a line should be white bold
#WARNING: I expect warnings bright green
#FYI: I expect FYI's bright green

    #I'm yanking good habits from vimscript, elite developers, keep going
    #pressing enter after a comment, I expect indentation to match.

#unicode chars should be teal background whether in comments or elsewhere Θ θ
Θ θ
a = " Θ θ "
#Later on if I drink the unicode coolaid I can change colors

#import should be red
import subprocess, sys
from pinkie_pie import unit_tests as unit
from django.http import HttpResponse

#integers should be purple
a = 0
a = 987
a = -55
a=-55
a = 1234.5
a = 1234.1234
a = 5e5
#floats should be purple
a = 1234.1234e7
#Longs should be blue
a = 1234l
a = 1L
#complex numbers brown
a = 234J

#hex numbers
a = 0x21c

#Python hex error:
0xfade        #hex can only be 0-9a-f
0xfaze        #hex error, highlight red

#binary numbers good:
0b110101101000101
0B110101101000101

#binary numbers bad:
0b110101101000101.23L
a = 0b11020

#Octal numbers good, (digit set 0-7)
a = 027
print(type(016))

#Semicolons after line is technically allowed, but is teal fail
a = 1234;

#java comments are fail, highlight red  // can be in comments though
//asdf

#long error
a = 1234.3L
a = 1234.3l

#python long error, no period point
532.l



#BAD: Octal number out of range
a = 097
print(019)

#BAD: numbers inside words should not be purple
abc38d_1234 = 10  #good
35a_sdf = 10      #numbers may never begin words, ever


#BAD: boolean named builtins need proper camel case, highlight fail
a = false
a = true
a = none
a = FALSE
a = TRUE
a = NONE
a = F
a = T

#GOOD: boolean named builtins properly cased
a = False
a = True
a = None

#Good basic function def, blue, green, brown on black with blue pass
def myblah():
    pass

#GOOD, but bad form
def abc(a = [1,2,3]):    #Ugh, just don't do this even though it's legal
    print(a)

#expect the curly brackets to be nicly colored:
def abc(a = 3, b="asdf", charlie={1:'foo'}):    #Decent!
    print(a)

abc()

def myblah(so_orange):
    pass

def myblah(beorange, 
        muchorange, 
        lotsof_orange):
    pass

def screwdup(a = [1,2,3], b={3:'foo', 8:"bar"}, 
    stupid='yeah (23) wtf', 
    oohkay="wtf[ brackets?? ]", screwed="{} tots yeah True"):
    print(min(max([3,5,2])))   """ triplicate here is okay?"""      '''extra triplicate single comment'''

if True and False:
    a = 5

a = None
a = NONE
a = none

a = nan     #bare python2 has no builtin for nan, all teal
a = NAN
a = Nan
a = NaN

#Python doesn't have any concept of NULL, instead, use None camelcased
a = NULL
a = Null
a = null

#Python has no concept of Nil or any casing variant, Use None
a = NIL
a = Nil
a = nil

a = INF
a = Inf
a = inf

#Good, a bare word is legal
etc

a = float("nan")
print(type(a))
print(a)

#GOOD arithmetic operations, = + - / * ** % should be red
a = foo + 5        #addition
b = foo - 5        #addition
c = 0xfade * 10    #multiplication
d = 1234.56 / foo  #division
d = -8e8 ** 2      #exponentiation
3 % 2              #modulus operator 3 mod 2 is 1

e = 35 ^ 3         #bitwise xor
f = ~ 5            #"invert" or "complement" operation, in which all the bits of the input data are reversed

h = !foo           #syntax error, bang by itself has no meaning
i = !5             #syntax error, bang by itself has no meaning
j =! 5             #syntax error, bang by itself has no meaning

2 & 3              #bitwise addition 2 & 3 is 2
2 | 3              #bitwise or 2 & 3 is 2
2 ^ 3              #bitwise or 2 & 3 is 2

2 && 3             #syntax error, python uses 'and' for double ampersand
2 || 3             #syntax error, python uses 'or' for double pipe

a <<- 5            #syntax error, bad red
a <- 5             #syntax error, bad red
a -> 5             #syntax error, bad red
a ->> 5            #syntax error, bad red


#GOOD, orange delimiters
a = [1,2,3]         #naked lists should be orange brackets, purple numbers
a = [[5,6,7],2,3]   #nested naked lists should be orange brackets, purple numbers
a = (5,6,7)         #tuples good

#compound assignment operators, be red
a += 5
a -= 5
a /= 5
a *= 5
a %= 5

#GOOD: not equals, double equals red
a != 5
a == 5

#BAD:
a === 5   #triple equals syntax error, red
a===5   #triple equals syntax error, red, but === in comment is okay


#GOOD
a = "==="   #Valid double quotes, no error
a = '==='   #Valid single quotes no error
a = "words inside quotes fijsdfhh are spell checked"

#\n is newline
#\t is tab
#\b is nondestructive backspace 
#\\ is 1 literal backslash entered into the string
#\'  Escaped single quote in double quotes manipulates how the quote is stored for user in raw, or byte strings
#\a  ascii BEL aka BELL
#\f form feed
#\r line feed
#\v vertical tab (holy shit this is amazing,  "123456789\vasdf makes the second asdf newline + 9 chars
#\ooo   ASCII character with octal value ooo
#\xhh...        ASCII character with hex value hh...

a = "special escape codes \n \r \t \b \a \f \b \v \' \\ should be brilliant blue in dbl quotes"
a = 'single quote special escape codes \n \r \t \b \a \f \b \v \' \\ should be brilliant blue'



#I expect a string with an unterminated doublequote and single quote to be obviously wrong (non brown,)
a = "aaaaaaf
a = 'bbbbbbb


a = "\147"   #this is g in octal, should be blue
print(a)   #prints g

a = '\147'   #this is g in octal, should be blue
print(a)   #prints g

byte_string = b'my byte string'      #b should be bright
unicode_string = u'my byte string'

fail_string = fail'failure string'     #syntax error

no_dot = " \. "

a = "asdf"         #I'd like the dbl quotes to jump out and bite me in the face, they are important

a = 'asdf'         #I'd like the single quotes to jump out and bite me in the face, they are important

#BAD
a &&= asdf     #Huge error with double ampersand equals
a !~ asdf      #syntax error with bang tilda

a =~ 5        #remarkably equals tilda is good

#BAD
5 <=> 5

a = 300 >> 5      #right shift ok, red
a = 300 << 5      #left shift ok, red

#I can say && from inside quotes without an error though


#Good, dictionary definition
twilight_sparkle = {0: '', 1: 'derpy'}
rainbow_dash = Math.sqrt(1*5)


#syntax errors unmatched quote delimiters follow, must be easily visible
foo = "asdf'
foo13 = 'asdf"

foo = "asdf asdf asdf'     #syntax error one double quote can't span multiple lines

asdf"            #syntax error, can't span multiple lines
")}]
if (4 && 3):
    if (5 || 3):
    pass
        this_is_a_tab_no_its_not_ok

#syntax error, bad indentation
if (4 and 3):
    if (5 or 3):
    wrong_indent = 5

#Unterminated double quote is a big fail, must be obvious its wrong: 
foo = "asdf asdf asdf'     #syntax error one double quote can't span multiple lines


unnecessary_whitespace_after_this_line              
#FOLLOWING WHITESPACE LINE SHOULD BE ALL TEAL
                                                                                    

#float something = 5    #python isn't a typed language, float at start is fail
#    int something = 5    #python isn't a typed language, int at start is fail

#BAD
float something = 5    #python isn't a typed language, float at start is fail
    int something = 5    #python isn't a typed language, int at start is fail

def foobar():
    return = 7    #derp, no you can't have equals after return


#foobar.trim()     #syntax error: python has no string trim
#thing = strip(foobar)  #syntax error: no method named strip
#thing = foobar.strip()  #correct

foobar.trim()     #syntax error: python has no string trim
thing = strip(foobar)  #syntax error: no method named strip
thing = foobar.strip()  #correct


#syntax error, python 'else if' is always a syntax error
if (True):
    pass
else if(False):
    pass


#syntax error on 'else' no conditional allowed
if (False):
    print("k")
else(True):
    print("done")

#else without a colon is a syntax error
if (False):
    print("k")
else                    #syntax err
    print("done")



foo = 'text in single quotes\n'
moo = "unicode \u2713 text in double \t quotes"
print("the aliens are on route, we must prepare")

class MyClass(penguin):
    def __init__(self, *args):
        self.x = 10
if (mode=0777):
    sys.path.append("mypath")
execfile("/home/el/tuvok.py");

abs(53)

#the word for shouldn't be red in comments
def drop_the_caffeine_and_crack_pipe_dont_make_me_taze_you():
  pony = {'ls -l', {"time for robohug"} }
  for cmd in pony:
    p = mycrappyimport.fromulate(cmd, bacon=True, x=@wtf_bro)
    if cmd.strip() == "":
      raise Http404
    if ("" in goatse):
      try:
        global epicglobal
      except SystemExit:
        pass
def derpyhooves(Thread):
  def bonbon():
    romulans = 2 * (4 / 1)
    noodley_appendage = 5 % (3 ^ 7)
    return romulans
  def run(self):
    print("fluttershy" + str('666') + str("666"))

//python syntax error here, it's not java comment

def slug(self):
  if self.parent is not None:
    yarr(__debug__)
exit(0)
#regex parser starts screwing the pooch, but the screwup coloring is quarantined on the one strange line
def screwdup(stupid='yeah (23) wtf', oohkay="wtf[ brackets?? ]", screwed="{} yeah True"):
    print(min(max([3,5,2])))   """builtins"""      '''extra comment'''
asdf = 5
ab = { 'mykey'     :  "mc my value"
       "spammer"   :  "mcspam"}
del ab['spammer']
shoplist = ["carrot", "banana", "grape"]
foobar="()@#!@?&*("
exit(9)

#all your base are belong to us now
foo = 'text in single quotes\n'
moo = "unicode \u2713 text in double \t quotes"
print("the aliens are on route, we must prepare")

class MyClass(penguin):
    def __init__(self, *args):
        self.x = 10

sys.path.append("mypath")
execfile("/home/el/tuvok.py");

def drop_the_caffeine_and_crack_pipe_dont_make_me_taze_you():
  pony = {'ls -l', {"time for robohug"} }
  for cmd in pony:
    p = mycrappyimport.fromulate(cmd, bacon=True, x=@wtf_bro)
    if cmd.strip() == "":
      raise Http404
    if ("" in goatse):
      try:
        global epicglobal
      except SystemExit:
        pass
def derpyhooves(Thread):
  def bonbon():
    romulans = 2 * (4 / 1)
    noodley_appendage = 5 % (3 ^ 7)
    return romulans
  def run(self):
    print("fluttershy" + str('666') + str("666"))

//python syntax error here

def slug(self):
  if self.parent is not None:
    yarr(__debug__)
exit(0)
#regex parser starts screwing the pooch, but the screwup coloring is quarantined on the one strange line
def screwdup(stupid='yeah (23) wtf', oohkay="wtf[ brackets?? ]", screwed="{} yeah True"):
    print(min(max([3,5,2])))   """builtins"""      '''extra comment'''
asdf = 5
ab = { 'mykey'     :  "mc my value"
       "spammer"   :  "mcspam"}
del ab['spammer']
shoplist = ["carrot", "banana", "grape"]
foobar="()@#!@?&*("
exit(9)

if (!myvar):
    pass

stuff = !True


#syntax error: exit and quit commands by themselves just refer to the function, and does nothing,
exit(
quit


)
#correct: exit and quit with parens are script stoppage
exit()
quit()

#highly annoying (but not illegal), the following lines have unacceptable tabbing
    def blahasdf():
                asdf




#BAD The following line uses equals assignment incorrectly:
if (key = "LM"):
    pass


#syntax error: typical eric error, python doesn't accept parenthesis:
for (x in range(3)):
    print(x)

#syntax error: typical eric error, you can't iterate an integer
for x in 10:
    print(x)

#syntax error: missing colon notwithstanding
for x in 1234
    print(x)

#good
for x in range(3):
    print(x)

a = "text with exclamation at end is okay!"


#Correct: Just because it has 'if' in the name doesn't mean it is wrong
last_modified_date = datetime.datetime.fromtimestamp(mtime)



#good:
if (True or
        False):
    pass

#good:
if (True and
        False):
    pass

#good:
if (True and
        False):
    pass

#good:
if (True and   \
        False):
    pass

#good:
if (True and \
        False):
    pass

#GOOD if asdf:
#if asdf:
if (stuff): 
    pass
#GOOD
if (stuff):
    pass

#GOOD
    if True:
        pass

#good
a = 34 + \
23



#BAD
if (True and False){
    pass

#BAD
for i in range(3) {
    pass

#BAD
if (True
        False):
    pass

#BAD
if (True 
        False):
    pass

#BAD
if (stuff() and stuff())
    pass

#BAD
if stuff()
    pass

#BAD
if True
    pass

#BAD
if True and
    False
    pass

#BAD
if True or
    False
    pass



#bad
a = 34 +
23




def blah(foo):
    pass

#good
#a = blah("asdf" 
#"asdf2")

print(a)



#FUCKING NOICE, all the unnecessary parents are highlighted as evil, absolute mind blown
#BAD (extra parenthesis):

predictProdFile(theta, csv_filename="n_dimensional_prod_queries.csv"), "\n")

predictProdFile(theta, csv_filename="n_dimensional_prod_queries.csv"], "\n")


predictProdFile(theta, csv_filename="n_dimensional_prod_queries.csv"}, "\n")

predictProdFile(theta, csv_filename="n_dimensional_prod_queries.csv")), "\n")


#bad, unterminated left parenthesis
if (foo == 2:
    a = 5

#bad right paren without left
if foo == 2):
    a = 5

#BAD: must have parenthesis
if TRUE:
    a = 5

#BAD: because TRUE is improper case
if (TRUE):
    a = 5

#correct: python can have parens or not
if True:
    a = 5

#syntax error, true is camelcase
if (TRUE):
    a = 5

#syntax error, must be double equals
if (a = 5):
    pass

#syntax error, must be double equals
if a = 5
    pass


#BAD:
a = "asdf" +
        "asdf2"

#GOOD:
a = "asdf" + \
        "asdf2"

#GOOD, should not trigger on the //
output = commands.getstatusoutput(
    "timeout 4 w3m -dump http://blag.reverseengineerthebrain.com")[1]


#correct:
    if not test_needs_rerun(last_triggerfile_exists, last_triggerfile_name, badger_every_n_minutes):
        pass

    if (file_mover_fail == False and os.path.exists("/home/el/bin/file_mover/tmp/returnmsg2.txt")):
        pass


#BAD, i++ not allowed
variable++

#bad: split without a dot before it, fail
a = split(5)


np.float32(asdf)

dtype(asdf)

#sweet purple indicating computer vision library use
cv2.Canny(asdf)

#BAD:
a = "asdf".length(asdf)



#SEARCH HIGHLIGHTING TESTS
#1 when I do a text search like /foo CursorLine should highlight the background a little lighter 
#  foo    foo
#foo   foo  

#Searching higlight orders of operations and priority.  Search for 'foo' when foo is highlighted
#teal doesn't modify the color

#INDENTATION TESTS
#1  Pressing enter after a comment touching the left side should bring cursor to left most
good
    #2  Pressing enter after a comment with 4 indent should start with same indent as prev
    good

#3 typing a function definition and hitting enter after the colon should bring cursor 4 in
#note, reason we're good is because .py files suck in the indent script files.  
#It's because of the smart way we are doing the job
def abc():
    asdf



#BAD (missing parenthesis before square bracket, R is wrong
df2 = df[sample(as.integer(df)]
df2 = is.vector(df)
a = 'phineas.asdf'    #words ending in 'as.' are still okay



#typing a 180 width line should not autowrap, good
asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asd fasdf asdf asdf asdf asdf asdf asdf j


#GOOD, surprisingly allowed considered foo is a function:
foo(
)

#this builtin len( should be blue as per tradition even with all variants of neighbors
len(stuff)                   #hugged against left side, blue
    len(stuff)               #whitespace is okay, still blue
1 + len(stuff)               #plus before len, still blue
    1 + len(stuff)           #whitespace and plus
    list(len(stuff))         #nested other blue list with blue len
  a = len(stuff)             #assignment allowed, still blue
  a = list(len())            #BAD, RED, len must have at least 1 argument
b = foobar(len(stuff))       #len blue, nested in meaningless function
b = foobar(1,len(stuff))     #comma before len, nospace
b = foobar(1, len(stuff))    #comma before len, space
df2 = df[list(len(df)]       #BAD, red, syntax error here, unmatched left paren
blarnlen(asdf)               #should not be blue
a = 1 * len(stuff)           #all arithmatic is good blue
a = 1 - len(stuff)           #all arithmatic is good blue
a = 1 / len(stuff)           #all arithmatic is good blue
a = list(1, len(stuff))      #list with commas and len blue nested
a = (len(blah))              #wrapping parents orange, len blue, strange but okay


#BAD, no casing of tostring is acceptable, all teal fail:
print("d is: ", toString(d))
print("d is: ", tostring(d))
print("d is: ", to.string(d))
print("d is: ", to.asdfasf(d))
