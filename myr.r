#This is a .R file, Comments should be light gray, ASCII characters !@#$%^&*()_+-=,./<>? OK!
#TODO: FIXME: NOTE: BUG: These capital words after an R comment should be white and eye catchy
#This wordasdf is misspelled and should be red background.  sentences should start with capital, blue background if not
#a rare word adscititious is technically correct but so rare it's highlighted this way
#lines should never have superfluous spaces at the end like this one       
θ
# non ASCII in comment or code, red background: θ
#example of rare word is here boolean, marked lighter grey background.  You know this is an inventor, 
#like Gauss for Gaussian.

#THE FOLLOWING LINE IS ALL WHITESPACE AND SHOULD BE TEAL
                                                                    


library(ggplot2)

#This line is important to keep around the ggplot2::predict method while we redefine it for our purposes
ggplot2_predict = predict

source(file="dtype.r")

#RScript bullshit three types of Assignment:
y <- 89
y = 89
y <<- 89

y <- 89L
y <- 89l
y = 89e5
y <<- 89

y <- 89.5
y <- 1.2
y = 1234.1234
y <<- 5.5

#BAD, RED: unmatched left parenthesis within others highlighted red, wow fantastic
df2 <<- df[sample(length(df)]


a = 5,5

a = 1e+85
a = 1e+85   #Exponential notation should be purple

gogogo(1e+85)
gogogo(231e-5)   #Exponential notation should be purple

a = "string stuff"
a = "string stuff"  #Strings should be brown


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

    return(list(123))

type(False)
print(type(False))
print(type(FALSE))
print(typeof(FALSE))

    typeof(False)   #works with a comment on right too

typeof(False)   #Bad indenation shouldn't be a problem, red goes to end of line, but whatever

    typeof(FALSE)
    typeof(FALSE)    #K now we are good
    if (!file.exists(filename)){ }

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


#c is a builtin R function that returns a vector of type double and class numeric.  no match: c( or (c(
whatevers = c(1,2,3)
whatevers =c(1,2,3)
stuff = c(1, c(1,2))
a = data.frame(c(1,2,3))
whatevers = 5 + c(1,2,3)
c(1,2,3)



is.vector(whatevers)
is.vector(whatevers)  #is.vector returns Boolean if thing is vector should be pleasing blue
x = is.vector(whatevers)  #is.vector returns Boolean if thing is vector should be pleasing blue

foobaric(asdf)
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

#typing a 180 width comment should not autowrap asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf

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


#only toString should be higlighted, not to.string or to.asdfasf  toString(
print(paste("d is: ", toString(d)))
print(paste("d is: ", tostring(d)))
print(paste("d is: ", to.string(d)))

print(paste("d is: ", to.asdfasf(d)))

to.asdf(
)
#anything.mean is python, this is R so highlight that red
return(sqrt(((predictions - targets) ** 2).mean())



#this nrow( should not be highlighted nor nrow 
nrow(stuff)
    nrow(stuff)
1 + nrow(stuff)
    1 + nrow(stuff)
    sample(nrow(stuff))
  a = nrow(stuff)
  a = sample(nrow(stuff))
b <- foobar(nrow(stuff))
b <- foobar(1, nrow(stuff))
df2 <- df[sample(nrow(df)]
blarnrow(asdf)
a = 1 * nrow(stuff)
a = 1 - nrow(stuff)
a = 1 / nrow(stuff)
a = c(1, nrow(stuff))

a = (nrow(blah))


#ncol should be highlighted in all its variants
ncol(stuff)
    ncol(stuff)
1 + ncol(stuff)
    1 + ncol(stuff)
    sample(ncol(stuff))
  a = ncol(stuff)
  a = sample(ncol(stuff))
b <- foobar(ncol(stuff))
b <- foobar(1, ncol(stuff))
df2 <- df[sample(ncol(df)]
blarncol(asdf)
a = 1 * ncol(stuff)
a = 1 - ncol(stuff)
a = 1 / ncol(stuff)
a = c(1, ncol(stuff))

a = (ncol(blah))


a = data.frame(c(1,2,3))

a$asdf = 5


#this length( should be blue in all its variants
length(stuff)
    length(stuff)
1 +length(stuff)
    1 / length(stuff)
    something[length(stuff)]
  a = length(stuff)
  a = sample(length(stuff))
b <- foobar(length(stuff))
b <- foobar(1,length(stuff))
b <- foobar(1:length(stuff))
df2 <<- df[sample(length(df)]
blarn_length(asdf)
a = 1 * length(stuff)
a = 1 - length(stuff)
a = 1 / length(stuff)
a = c(1, length(stuff))
a = (length(blah))


a = data.frame(c(1,2,3))





#this as.integer( should be blue in all its variants
as.integer(stuff)
    as.integer(stuff)
1 +as.integer(stuff)
    1 / as.integer(stuff)
    something[as.integer(stuff)]
  a = as.integer(stuff)
  a = sample(as.integer(stuff))
b <- foobar(as.integer(stuff))
b <- foobar(1,as.integer(stuff))
b <- foobar(1:as.integer(stuff))
df2 <<- df[sample(as.integer(df)]
blarn_as.integer(asdf)
a = 1 * as.integer(stuff)
a = 1 -as.integer(stuff)
a = 1 / as.integer(stuff)
a = c(1, as.integer(stuff))
a = (as.integer(blah))

#BAD Pass is python, this is r
pass

#necessary ending right paren to stop the above
)

#good
if (3 == 3) {
    a = 'asdf'
}

#r must have parens around if's conditional
if 3 == 3 {
    pass
}

#FUCKING NOICE, all the unnecessary parents are highlighted as evil, absolute mind blown
#BAD (extra parenthesis):
predictProdFile(theta, csv_filename="n_dimensional_prod_queries.csv"), "\n")

predictProdFile(theta, csv_filename="n_dimensional_prod_queries.csv"], "\n")


predictProdFile(theta, csv_filename="n_dimensional_prod_queries.csv"}, "\n")

predictProdFile(theta, csv_filename="n_dimensional_prod_queries.csv")), "\n")


#BAD (missing parenthesis before square bracket
df2 <<- df[sample(as.integer(df)]

#bad if:
if (asdf == 2{
    a = 5

#bad if:
if asdf == 2){
    a = 5

#must have parenthesis
if TRUE{
    a = 5
}

if (TRUE){
    a = 5
}
