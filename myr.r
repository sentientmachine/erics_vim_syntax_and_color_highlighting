#This is a .R file, Comments should be light gray, ASCII characters !@#$%^&*()_+-=,./<>? OK!
#TODO: FIXME: NOTE: BUG: These capital words after an R comment should be white and eye catchy
#This wordasdf is misspelled and should be red background.  sentences should start with capital, blue background if not
#a rare word adscititious is technically correct but so rare it's highlighted this way
#lines should never have superfluous spaces at the end like this one       
θ
# non ASCII in comment or code, red background: θ
#example of rare word is here boolean, marked lighter grey background.  You know this is an inventor, 
#like Gauss for Gaussian.

#RScript bullshit three types of Assignment:
y <- 89
y = 89
y <<- 89

y <- 89L
y <- 89l
y = 89
y <<- 89

y <- 89.5
y <- 1.2
y = 1234.1234
y <<- 5.5

a = 5,5

a = 1e+85
a = 1e+85   #Exponential notation should be purple
gogogo(1e+85)
gogogo(231e-5)   #Exponential notation should be purple

a = "string stuff"
a = "string stuff"  #Strings should be 


print y 
    print y#must have parens not okay, whitespace shouldn't affect
    print y
print(y)
print (y)
#print with end of line hugging right is stupid function-drop to stdout
print

#correctly used Booleans should be purple
x = TRUE
x = FALSE

x = T
x = F

x = T  #T and F is another way
x = F  #for TRUE and FALSE

x = TRUE    #and even with comments after
x = FALSE   #and even with comments after

myfunction(TRUE)
myfunction(FALSE)

myfunction(TRUE)#and even with comments after
myfunction(FALSE)  #and even with comments after

a = Nan
a = Nan   #Nan has to be capped lower capped
    a = Nan   #Nan has to be capped lower capped

a = NaN
a = NaN   #Nan has to be all caps with purple
    a = NaN   #Nan has to be all caps with purple

a = nan
a = nan   #Nan has to be capped lower cap, with comment disrupt
    a = nan   #Nan has to be all capped lower cap with indenting
foobarian(nan)
foobarian(Nan)
foobarian(NAN)
foobarian(NAN)   #NaN should be purple
foobarian(NaN)
foobarian(NaN)   #NaN should be purple

#I should be allowed to say Nanoo and oonan without a red from the NAN colors

    #pressing tab should be replaced with spaces



#Bad code examples
train = function(x, y, threshold, alpha, decay, epoch_limit, theta) {

    x = True
    x = True      #improper capitalization of Boolean


    x = true
    x = true      #improper capitalization of Boolean lower
    foobar(true)
    foobar(true)   #and comment

    len("asdf")   #len function not recognized
    a = length("asdf")
    type(False)
type(False)
print(type(False))
print(type(FALSE))
print(typeof(FALSE))

    typeof(False)   #works with a comment on right too

typeof(False)   #Bad indenation shouldn't be a problem, red goes to end of line, but whatever

    typeof(FALSE)
    typeof(FALSE)    #K now we are good

    typeof(FALSE);
    typeof(FALSE);    #Semicolons are discouraged but allowed

    a = length("asdf")
    exit  #exit not found?  assholes!
    quit   #quit also not found
    quit()   #got to use parens

    return theta
    Return         #return must be all lowercase
    return(5)
    return

}
#Invocation of function should be highlighted nice
train = function(1, "foobar")


#c is a builtin R function that returns a vector of type double and class numeric
whatevers = c(1,2,3)

is.vector(whatevers)
is.vector(whatevers)  #is.vector returns Boolean if thing is vector should be pleasing blue
x = is.vector(whatevers)  #is.vector returns Boolean if thing is vector should be pleasing blue

print(is.vector(whatevers))
print(is.vector(whatevers))    #is.vector returns Boolean if thing is vector should be pleasing blue

print(x)

    a = INF
    a = InF
    a = Inf
    a = Inf  #comment here, still purple
    a = inf

a = Na
a = na
a = NA 
a = NA  #comment here, still purple I should be able to say na in comment without problem

a = NULL
a = NULL  #R is variable in naming conventions, sometimes all caps NULL, TRUE, NA sometimes camel case Inf, 
a = Null
a = null
foobarbaz(Null)
foobarbaz(NULL)

a = data.frame(c(1,2,3))
if(data.frame(c(1,2,3)) == whatever){
    #Pass isn't correct
    pass
}


X <- vector(mode="character", length=10)

dtype(X)


a = 3:5
a = 3:5   #vector sequence

readrds("whatever.csv")   #readRds needs to be capitalized like readRDS(...)
saverds("whatever.csv")   #saveRds needs to be capitalized like saveRDS(...)

#the word function or function( itself shouldn't be blue in comments

train = function(x, y, threshold, alpha, decay, epoch_limit, theta) {
    return(theta)
}

#typing a 180 width line should not autowrap, good
asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asd fasdf asdf asdf asdf asdf asdf asdf j

#typing a 180 width comment should not autowrap
#asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf

wordasdf = 5     #variable names can't be misspelled
print(wordasdf)

is.atomic(logical())
is.atomic(integer())
is.atomic(numeric())
is.atomic(complex())
is.atomic(character())
is.atomic(raw())
is.atomic(NULL)
is.atomic(list())        # is.vector==TRUE
is.atomic(expression())  # is.vector==TRUE
is.atomic(pairlist())    # potential "gotcha": pairlist() returns NULL
is.atomic(pairlist(1))   # is.vector==FALSE
