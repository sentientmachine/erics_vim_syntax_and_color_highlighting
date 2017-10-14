#!/bin/bash
#!/usr/bin/perl -s
STUFFI=9;
#epic comment goes here
#printf true=true
#foo123="okay" 

while [ 1 ]   # Endless loop.
do
  echo "Subshell running . . ."        #runs until Ctrl-c
done

exit 1

#Positional parameters $1,$2,$3 ... and their corresponding array representation, count and IFS expansion $@, $#, and $*.
#$-    current options set for the shell.
#$$    pid of the current shell (not subshell)
#$_    most recent parameter (or the abs path of the command to start the current shell immediately after startup)
#$IFS  the (input) field separator
#$?    most recent foreground pipeline exit status
#$!    PID of the most recent background command
#$0    name of the shell or shell script

echo 'pr 1/3.' | gnuplot        #lolz

echo 'print( 1./3. )' | python   #You clever bugger, inject code into python
echo 1/3 | octave               #send 1/3 into octave, lawl

moo2=500.03        #bash can't understand floats, this fails
echo $moo2
let "moo2+=0.01";    #funny bash has let?,  strange
printf $moo2
exit 1
vartype() {
    local var=$( declare -p $1 )
    local reg='^declare -n [^=]+=\"([^\"]+)\"$'
    while [[ $var =~ $reg ]]; do
            var=$( declare -p ${BASH_REMATCH[1]} )
    done

    case "${var#declare -}" in
    a*)
            echo "ARRAY"
            ;;
    A*)
            echo "HASH"
            ;;
    i*)
            echo "INT"
            ;;
    x*)
            echo "EXPORT"
            ;;
    *)
            echo "OTHER"
            ;;
    esac
}
printf $A
printf vartype($A)


exit 1
if ! [ "1" -eq "2" ]; then

if ! [ "1" -eq "2" ] && [ "foo" != '$foobar' ]; then
    echo 'kay';
fi

FALSE      #FALSE command not found
False      #False command not found
false      #lowercase false is keyword, has value 1
echo $?
true       #lowercase true is keyword, has value 0
echo $?
exit $?       #Dollarsign questionmark returns the return value of the last executed command. e

my_function(){
    echo "ok";
    echo $1;   #Bash params are accessed with $1 through $9
}
my_function yatta

bc <<< 'scale=2; 100/99'     #this prints 1.01, bash has no concept of float
exit 1


moo=500
let "moo += 1";    #funny bash has let?,  strange
printf $moo


print $foo123       #syntax error
printf $foo123      #good

foo= "okay"   #this is a syntax error, no spaces around equals sign
foo = "okay"   #this is a syntax error, no spaces around equals sign
foo123 ="okay" 

FOO="true"   #bash has a keyword true, lowercase, but it's unreliable, 
Foo="TRUE"   #strings  can be whatever are meh
Foo="True"   #asdf
foo="true"   #asdf
foo="okay"   #this is good bash syntax

foo="true"
if ! [ "1" -eq "2" ] && [ "foo" != '$foobar' ]; then
    pass
pass
    pass     
passover
overpass
    #then i pass the test
fi
exit 1 

cat volcanoes.txt | wc -l
cat glaciers.txt >> rivers.txt
cat < lakes.txt
cd ..
cp asdfasdf* satire
env
env | grep PATH

ls -a foobar

sort -s myfiles.txt
mkdir failboat
[ -z $BASH ] || shopt -s expand_aliases
alias BEGINCOMMENT="if [ ]; then"
alias ENDCOMMENT="fi"
BEGINCOMMENT
  echo "This line appears in a commented block"
  echo "And this one too!"
ENDCOMMENT
exit(1)   #syntax error on this line, exit doesn't take parens
sed -ie 's/F8F8F8/E2E2E2 !important/g' stuff.html
printf "okay!\n"; echo -e 'words words\n\n'; 
rm -rf stuff.html
ps aux | grep -ie "evince mine.pdf" | awk '{print $2}' | xargs kill -9
MYSTRING='single quoted';
if [ $STUFFI == "10" ]; then
    echo "yes";
elif [ $STUFFI == "9" ]; then
    echo "maybe";
else
    sudo /etc/init.d/tomcat7 restart
    ssh 10.0.0.3 -p 38534 'cp /home/stuff/stuff.txt /var/lib/tomcat7/mvc.war'
    ssh 2001:0db8:85a3:0000:0000:8a2e:0370:7334 -p 23987 \
        '/bin/xvfb-run --server-args="-screen 0, 1024x768x24" wkhtmltopdf /home/frodo/s.html /home/frodo/b.pdf'
    /bin/chmod 777 /home/el/foo.txt
    su - spidey -c "ls" >> /home/spidey/tmp.txt
fi
sleep 2
current_dir=$(pwd)
filename=$(basename "$1")
unzip myfiles.zip
Rscript convert.r
cp -r ./figure /mnt/thingy
/bin/cp "$1" /mnt/mymount/Videos2/"$filename"
sshfs el@10.0.0.3:/home/frodo/ -p 39478 /mnt/thingy

if [[ $(ps -ef | grep 39587:localhost:354 | grep -v grep | wc -l) != 0 ]]; then
    echo "Rebalance the optic flows!"
else
    ./home/frodo/somefile.sh & 2 > &1
fi
export FOO="bar";
for foobar in *.mp4a; do
  mv "$file" `echo $file | tr ' ' '_'` ; 
done

for file in *.mp4; do mv "$file" `echo $file | tr ' ' '_'` ; done   #comment next to line


#This just in, water is wet and the pope is still catholic.
[ -z "$PS1" ] && return
HISTSIZE=9000
shopt -s histappend
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
  else
  color_prompt=
  fi  
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u]\$ '
fi
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;  
*)
  ;;  
esac

alias la='ls -A'
TERM=xterm-256color


