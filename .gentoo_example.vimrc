# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi
alias whatismyip="lynx --dump http://ipecho.net/plain | tr -d ''"

# Put your fun stuff here.
#alias angeliqe="ssh 10.0.0.10 -p 22"
#angeliqe is on a different network so I have to go out, then in to get there:
alias angeliqe="ssh -p 5001 localhost"
alias angeliqe_local="ssh 10.0.0.10 -p 22"

alias mbook="ssh el@10.0.0.10 -p 10722"  #Requires port forward on charity router
#alias apollo="ssh 10.0.0.3 -p 10522"
#alias apollo="ssh 192.168.1.6 -p 10522"
#alias apollo="ssh 192.168.1.8 -p 10522"
alias apollo="ssh 10.204.138.128 -p 10522"
alias voyager="ssh -o ServerAliveInterval=30 10.0.0.14 -p 10022"
#alias rosewill="ssh -o ServerAliveInterval=30 10.0.0.18 -p 10222"
#alias rosewill="ssh -o ServerAliveInterval=30 192.168.1.7 -p 10222"
#alias rosewill="ssh -o ServerAliveInterval=30 192.168.1.8 -p 10222"
alias rosewill="ssh -o ServerAliveInterval=30 10.204.138.122 -p 10222"
alias justhost="ssh reversf4@reverseengineerthebrain.com"
alias ll="ls -l"
alias ls="ls --color=auto"
alias locate="sudo updatedb; sudo locate "
alias paint="kolourpaint"
alias pdf="okular"
alias oct="octave -q"
alias vi="vim"
alias el="ssh -o ServerAliveInterval=30 ericlesc@69.195.124.181"  #sitelock security measure CDN redirect, use ip
alias mac="ssh -o ServerAliveInterval=30 machines@machinesentience.com"
alias refresh="cd /home/el/bin/migrate_blog; javac Main.java && java Main"
alias wekacli="java -cp '.:/usr/share/weka/lib/weka.jar'"
alias site="cd /var/www/localhost/htdocs/blog/"
alias domco="ssh -l ubuntu -i /home/el/bin/domco/key.pem domco.us"
alias termpix="/home/el/bin/termpix/target/debug/termpix "
#alias awsec2="ssh -i ec2-user@54.210.206.149"  #lol don't clobber aws tool
alias buff="ssh -X eleschinski3@buffet02.cc.gatech.edu"
alias flv2mp4=flv2mp4
#alias redshift='PGPASSWORD=asdfasdf psql "host=52.207.120.81 user=softnas dbname=softnas port=5439 sslmode=verify-ca sslrootcert=/home/el/.ssh/redshift-ssl-ca-cert.pem"'
#alias kurz_bare='PGPASSWORD=asdfasdf psql "host=10.0.0.18 user=pgadmin dbname=kurz_prod port=5432"'
alias kurz='pgcli postgres://pgadmin:nochin4u@10.0.0.18:5432/kurz_prod'
alias sub="/home/el/bin/sublime_text_3/sublime_text"
alias htop="htop -s Tree"

alias matlab="/mnt/3tb_defiant/MATLAB_install_huge/bin/matlab -nodisplay"
alias olddefiant="ssh el@10.204.138.134 -p 10122"  #ps weborg

####################  source.mp4  start_time  end_time                      output.mp4
alias mp4splice="ffmpeg -i $1 -ss 00:00:00 -t 00:00:00 -vcodec copy -acodec copy $2"

#attempting to get a startup hook on python for modules
#alias python="python -i ~/.pythonrc.py"


#################  source1.mp4  source2.mp4
# encodes source1.mp4 and source2.mp4 to intermediate1 and intermediate2.ts and joins them together into output.mp4
alias mp4join='ffmpeg -i $1 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate1.ts; ffmpeg -i $2 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate2.ts; ffmpeg -i "concat:intermediate1.ts|intermediate2.ts" -c copy -bsf:a aac_adtstoasc output.mp4"'


#pgcli is best thing ever
#pgcli postgres://amjith:pa$$w0rd@example.com:5432/app_db



flv2mp4(){
    #cut off last 4 characters
    v2=${1::-4}
    ffmpeg -i $1 -codec copy $v2.mp4
}
take_screenshot(){
    /usr/bin/python3 /home/el/bin/screenshot.py $1
}
alias ss=take_screenshot


ericleschinski_connect() {
    result=`/usr/bin/tmux has-session -t ericleschinski 2>&1`
    #bash for trim spaces left and right

    if [[ $result == *"find session ericleschinski"* ]] || [[ $result == *"no server running on"* ]]; then
        echo -e "rebooted.. you have to login manually first using command el and password";
        sleep 2
        /usr/bin/tmux -2 new -s ericleschinski
    else
        #This command attachs us to the existing ericleschinski instance
        /usr/bin/tmux -2 a -t ericleschinski
    fi
}
machinesentience_connect() {
    result=`/usr/bin/tmux has-session -t machinesentience 2>&1`
    #bash for trim spaces left and right
    #result=`echo $result | xargs`

    if [[ $result == *"find session machinesentience"* ]] || [[ $result == *"no server running on"* ]] || [[ $result == *"no sessions"* ]]; then
        echo -e "rebooted.. you have to login manually first using command mac and password";
        sleep 2
        /usr/bin/tmux -2 new -s machinesentience
    else
        #This command attachs us to the existing machinesentience instance
        /usr/bin/tmux -2 a -t machinesentience
    fi
}

#tmux is kickass, use command tmux to make a new screen and ericleschinski to get in, then use 'e' to attach.
alias e=ericleschinski_connect
alias m=machinesentience_connect



alias ev3="ssh root@10.0.0.16 -p 22"
alias ajax="ssh 10.0.0.19 -p 10622"
alias rasp="ssh pi@10.0.0.17"
alias fire="ssh 10.0.0.3 -p 10522 'cd /workspace/MissileDefense; sudo /usr/bin/python /workspace/MissileDefense/retaliation.py fire'"
alias halt="sudo halt"
alias reboot="sudo reboot"




HISTSIZE=100000
HISTFILESIZE=200000

#I like defiant to have a cool blue bold console prompt:
PS1='\[\033[1;36m\]\u@defiant\[\033[1;36m\] \w \n\$\[\033[00m\] '

export SVN_EDITOR="/usr/bin/vim"

#this makes it so that pressing ctrl-d in the terminal doesn't close konsole until you do it twice
export IGNOREEOF=2

#export PYTHONPATH="/usr/lib64/python2.7/site-packages"
#export PYTHONPATH="/home/el/lib/python2.7/site-packages"
export PYTHONPATH=$PYTHONPATH:/home/el/bin:/home/el/mo_money

export EDITOR="/usr/bin/vim"

export PATH="$HOME/.rbenv/bin:$PATH"

eval $(dircolors -b $HOME/.dircolors)

#I think this maps Ctrl-S in vim to 'save file'
bind -r '\C-s'
stty -ixon

# Reset
#Color_Off='\e[0m'       # Text Reset
#Excellent help with whole color spectrum bash colors:

#https://askubuntu.com/questions/558280/changing-colour-of-text-and-background-of-terminal
#https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt


#== SHOW THE RAINBOW OF BACKGROUND COLORS IN BASH ===============================
##!/bin/bash
#for((i=16; i<256; i++)); do
#    printf "\e[48;5;${i}m%03d" $i;
#    printf '\e[0m';
#    [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
#done


#pretty lightish blue: 0;96
#38 is code for background
#48 is code for foreground
#BackgroundWhite =  \e[48;5;255m
#BackgroundGreen =  \e[48;5;046m

# Regular Colors
#Black='\e[0;30m'        # Black
#White='\e[0;37m'        # White
#Red='\e[0;31m'          # Red
#Green='\e[0;32m'        # Green
#Blue='\e[0;34m'         # Blue
#Yellow='\e[0;33m'       # Yellow
#Purple='\e[0;35m'       # Purple
#Cyan='\e[0;36m'         # Cyan
#Pink='\e[01;38;5;213m'  # Pink

# Bold is signified by code [1m  (note the 1 before the 30m)
#justbold = '\e[1m'       # Bold

#BBlack='\e[1;30m'       # Black
#BRed='\e[1;31m'         # Red
#BGreen='\e[1;32m'       # Green
#BYellow='\e[1;33m'      # Yellow
#BBlue='\e[1;34m'        # Blue
#BPurple='\e[1;35m'      # Purple
#BCyan='\e[1;36m'        # Cyan
#BWhite='\e[1;37m'       # White

# Underline
#UBlack='\e[4;30m'       # Black
#URed='\e[4;31m'         # Red
#UGreen='\e[4;32m'       # Green
#UYellow='\e[4;33m'      # Yellow
#UBlue='\e[4;34m'        # Blue
#UPurple='\e[4;35m'      # Purple
#UCyan='\e[4;36m'        # Cyan
#UWhite='\e[4;37m'       # White

# Background
#On_Black='\e[40m'       # Black
#On_Red='\e[41m'         # Red
#On_Green='\e[42m'       # Green
#On_Yellow='\e[43m'      # Yellow
#On_Blue='\e[44m'        # Blue
#On_Purple='\e[45m'      # Purple
#On_Cyan='\e[46m'        # Cyan
#On_White='\e[47m'       # White

# High Intensity
#IBlack='\e[0;90m'       # Black
#IRed='\e[0;91m'         # Red
#IGreen='\e[0;92m'       # Green
#IYellow='\e[0;93m'      # Yellow
#IBlue='\e[0;94m'        # Blue
#IPurple='\e[0;95m'      # Purple
#ICyan='\e[0;96m'        # Cyan
#IWhite='\e[0;97m'       # White

# Bold High Intensity
#BIBlack='\e[1;90m'      # Black
#BIRed='\e[1;91m'        # Red
#BIGreen='\e[1;92m'      # Green
#BIYellow='\e[1;93m'     # Yellow
#BIBlue='\e[1;94m'       # Blue
#BIPurple='\e[1;95m'     # Purple
#BICyan='\e[1;96m'       # Cyan
#BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
#On_IBlack='\e[0;100m'   # Black
#On_IRed='\e[0;101m'     # Red
#On_IGreen='\e[0;102m'   # Green
#On_IYellow='\e[0;103m'  # Yellow
#On_IBlue='\e[0;104m'    # Blue
#On_IPurple='\e[0;105m'  # Purple
#On_ICyan='\e[0;106m'    # Cyan

TERM=xterm-256color

#purpose of vr is to set the 'v' to that file and r to run it in the
#selected filename, for example  vr python myfile.py
set_v_and_r() {
    #this is a bit of a haaaxx because it's forcing python, but is for
    #java and others later on, I expect to run java programs good like this
    name_of_compiler=$1
    name_of_file=$2
    cp /home/el/bin/wrapper_main_python.py .
    mv ./wrapper_main_python.py ./wrapper_${name_of_file}
    name_of_file_no_py=${name_of_file::-3}
    echo "import $name_of_file_no_py" >> wrapper_${name_of_file}
    alias v="vi $name_of_file"
    alias r="$name_of_compiler wrapper_$name_of_file"
}
alias vr=set_v_and_r

set_v_and_r_with_python() {
    name_of_compiler="python"
    name_of_file=$1
    cp /home/el/bin/wrapper_main_python.py .
    mv ./wrapper_main_python.py ./wrapper_${name_of_file}
    name_of_file_no_py=${name_of_file::-3}
    echo "import $name_of_file_no_py" >> wrapper_${name_of_file}
    alias v="vi $name_of_file"
    alias c="cat $name_of_file"
    alias r="$name_of_compiler wrapper_$name_of_file"
}
alias vrp=set_v_and_r_with_python



whenchanged_cpp_function() {
    file_to_watch=$1
    #date +%H:%M:%S
    #g++ -o s $file_to_watch && ./s;
    when-changed -s $file_to_watch "date +%H:%M:%S; g++ -o s $file_to_watch && ./s; printf -- '\n------ C Plus Plus ------- '";
}
alias whenchanged_cpp=whenchanged_cpp_function

whenchanged_perl_function() {
    file_to_watch=$1
    #date +%H:%M:%S
    #g++ -o s $file_to_watch && ./s;
    when-changed -s $file_to_watch "date +%H:%M:%S; perl $file_to_watch; printf -- '\n------ Perl ------- '";
}
alias whenchanged_perl=whenchanged_perl_function

whenchanged_m_function() {
    file_to_watch=$1
    #date +%H:%M:%S
    when-changed -s $file_to_watch "date +%H:%M:%S; octave -q $file_to_watch; printf -- '\n------ Octave ------- '";
}
alias whenchanged_m=whenchanged_m_function

whenchanged_php_function() {
    file_to_watch=$1
    #date +%H:%M:%S
    when-changed -s $file_to_watch "date +%H:%M:%S; php $file_to_watch; printf -- '\n------ PHP ------- '";
}
alias whenchanged_php=whenchanged_php_function

whenchanged_c_function() {
    file_to_watch=$1
    #date +%H:%M:%S
    #g++ -o s $file_to_watch && ./s;
    when-changed -s $file_to_watch "date +%H:%M:%S; cc -o s $file_to_watch && ./s; printf -- '\n------ C ------- '";
}
alias whenchanged_c=whenchanged_c_function

whenchanged_python_function() {
    #python default to python2.7
    file_to_watch=$1
    when-changed -s $file_to_watch "date +%H:%M:%S; python $file_to_watch; printf -- '------ PYTHON2 ------- '";
}
alias whenchanged_python=whenchanged_python_function

whenchanged_python2_function() {
    #python default to python2.7
    file_to_watch=$1
    date +%H:%M:%S
    python2c $file_to_watch;
    printf -- '\n ------ PYTHON2.7 ------- ';
    when-changed $file_to_watch "date +%H:%M:%S; python2c $file_to_watch; printf -- '------ PYTHON2.7 ------- '";
}
alias whenchanged_python2=whenchanged_python2_function

whenchanged_text_function() {
    #load file and use that as re-runner
    file_to_watch=$1
    date +%H:%M:%S
    directory=`sed -n '2p' < $file_to_watch`
    echo $directory
    command_to_rerun=`sed -n '3p' < $file_to_watch`
    fil_1=`sed -n '4p' < $file_to_watch`
    fil_2=`sed -n '5p' < $file_to_watch`
    fil_3=`sed -n '6p' < $file_to_watch`
    fil_4=`sed -n '7p' < $file_to_watch`
    fil_5=`sed -n '8p' < $file_to_watch`
    eval $command_to_rerun
    printf -- '\n ------ RERUN ------- ';
    #when-changed $file_to_watch "date +%H:%M:%S; python2c $file_to_watch; printf -- '------ PYTHON2.7 ------- '";
    when-changed $file_to_watch $fil_1 $fil_2 $fil_3 $fil_4 $fil_5 -c "date +%H:%M:%S; $command_to_rerun; printf -- '------ PYTHON2.7 ------- '";
}
alias whenchanged_text=whenchanged_text_function


whenchanged_python3_function() {
    #python default to python3
    file_to_watch=$1
    date +%H:%M:%S
    python3 $file_to_watch;
    printf -- '\n ------ PYTHON3 ------- ';
    when-changed $file_to_watch "date +%H:%M:%S; python3 $file_to_watch; printf -- '------ PYTHON3 ------- '";
}
alias whenchanged_python3=whenchanged_python3_function
whenchanged_javascript_5() {
    file_to_watch=$1
    when-changed -s $file_to_watch "date +%H:%M:%S; node $file_to_watch; printf -- '------ Javascript 5 -------'";
}
alias whenchanged_javascript_5=whenchanged_javascript_5

whenchanged_javascript_6() {
    file_to_watch=$1
    when-changed -s $file_to_watch "date +%H:%M:%S; babel-node $file_to_watch; printf -- '------ Javascript 6 -------'";
}
alias whenchanged_javascript_6=whenchanged_javascript_6

whenchanged_bash() {
    file_to_watch=$1
    when-changed -s $file_to_watch "date +%H:%M:%S; /bin/bash $file_to_watch; printf -- '------ Bash -------'";
}
alias whenchanged_bash=whenchanged_bash

whenchanged_java() {
    file_to_watch=$1
    name_of_file=`cut -d "." -f 1 <<< "$file_to_watch"`
    #echo $1
    #echo $file_to_watch
    #echo $name_of_file

    when-changed -s $file_to_watch "date +%H:%M:%S; javac $file_to_watch && java $name_of_file; printf -- '------ Java -------'";
}
alias whenchanged_java=whenchanged_java


compile_run_wait(){
    extension=`cut -d "." -f 2 <<< $1`
    #printf $extension

    if [ $extension == "js" ]; then                                                                              
        whenchanged_javascript_5 $1
    elif [ $extension == "py" ]; then
        #whenchanged_python3 $1
        whenchanged_python2 $1
    elif [ $extension == "txt" ]; then
        whenchanged_text $1
    elif [ $extension == "sh" ]; then
        whenchanged_bash $1
    elif [ $extension == "java" ]; then
        whenchanged_java $1
    elif [ $extension == "cpp" ]; then
        whenchanged_cpp $1
    elif [ $extension == "c" ]; then
        whenchanged_c $1
    elif [ $extension == "m" ]; then
        whenchanged_m $1
    elif [ $extension == "php" ]; then
        whenchanged_php $1
    elif [ $extension == "pl" ]; then
        whenchanged_perl $1
    fi  
}


alias ifdown=ifdown
alias ifup=ifup

ifdown() { 
    /sbin/ifconfig $1 down 
    /etc/init.d/net.$1 stop 
    return 0 
} 

ifup() { 
    /sbin/ifconfig $1 up 
    /etc/init.d/net.$1 start 
    return 0 
} 


alias pro=compile_run_wait

export CLASSPATH="$CLASSPATH:/home/el/bin/ml_cs7641_project1/lib/libsvm.jar"
export PROMPT_COMMAND='echo -ne "\033]0;$(basename ${PWD})\007"'

eval "$(rbenv init -)"

#export MANPAGER="/usr/bin/most"
#export MANPAGER=/usr/bin/vimmanpager

#export PAGER=/usr/local/bin/vimpager 
#export MANPAGER="/usr/bin/vim -c MANPAGER -"


export PAGER=/usr/bin/vimpager 
alias less=$PAGER 
alias zless=$PAGER 

#export MANPAGER="vimpager"

#alias python="python2c"
#alias python3="python3c"
alias python2="python2c"

set -o noclobber    #make it so stream redirection > does not overwrite without prompt
alias mv="mv -i"    #make mv interactive so if overwrite, then prompt  -i overrides the former so -f will over-override the former
alias cp="cp -i"    #make cp interactive so if overwrite, then prompt. -i overrides the former so -f will over-override

#make it so I can login remotely through ISP's blocking SSH.
#ssh -fN -R 10100:localhost:53 reversf4@reverseengineerthebrain.com > /home/el/tmp.txt

function vipsql {
    vim -c 'setlocal buftype=nofile | VipsqlOpenSession '$@
}


#This line makes it so when you type up arrow or Ctrl+P on the commandline it shows history
#but does not show duplicates.  It keeps them in history, just doesn't show them
export HISTCONTROL=ignoreboth:erasedups

#PYTHONSTARTUP only applies to interactive mode, not when you run it like python whatever.py
#export PYTHONSTARTUP=/home/el/.pythonrc.py
