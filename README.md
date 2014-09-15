Code syntax highlighting and color settings for vim.
=====================

What is this?
---------

This will enable your code to look beautiful within vim for the following code types:

java, python, html, javascript, php, css, bash, haml, viml

If you don't recognize some of these don't worry, you won't see them unless you use them.

If anything here doesn't work for you or you see anything wrong, let me know eric.leschinski@hotmail.com and I'll try to fix it.  It works for me, but then again I know how to surmount problems you may not know how to.

When you open python files in vi, it will look something like this:

PYTHON:

![Imgur](http://i.imgur.com/W26xaan.png)

JAVA:

![Imgur](http://i.imgur.com/d27fa1d.png)

HTML:

![Imgur](http://i.imgur.com/hl2G0U8.png)

SCRIPT files like .bashrc:

![Imgur](http://i.imgur.com/kWPuoXe.png)

I designed this to work for Ubuntu 12.10, Fedora 17 and Gentoo 3.10.17.  It should work with all linux distributions.


Installation instructions:
---------

My home directory is /home/el, yours may be different, from here forward replace /home/el with your user.


Install vim and git
    sudo apt-get install vim
    sudo apt-get install git

Make your .vim directory if it doesn't exist.

    mkdir /home/el/.vim
    cd /home/el/.vim
    git clone https://github.com/sentientmachine/erics_vim_syntax_and_color_highlighting.git 

That puts a directory called erics_vim_syntax_and_color_highlighting in your .vim directory.  Got to yank out the files and put them where they belong:

    mv erics_vim_syntax_and_color_highlighting/* .
    
Then you can delete the extraneous files (don't run this command unless you know what it does and why it does it) when it doubt do a tutorial.

    rm -rf erics_vim_syntax_and_color_highlighting

Edit your .vimrc:

    vi /home/el/.vimrc
    
Put this code at the bottom of your .vimrc, create it if it doesn't exist:

    "The following three lines map Ctrl+s to save in vi.  You can comment 
    "these out, it has nothing to do with syntax highlighting or colors.
    :nmap <c-s> :w<CR>
    :imap <c-s> <Esc>:w<CR>a
    :imap <c-s> <Esc><c-s>


    set background=dark
    set hlsearch
    set nu
    set smartindent
    set tabstop=4
    set shiftwidth=4
    set expandtab
    filetype on
    filetype plugin indent on
    
    au BufReadPost *.twig colorscheme koehler 
    au BufReadPost *.css colorscheme slate 
    au BufReadPost *.js colorscheme elflord 
    au BufReadPost *.py colorscheme molokai
    au BufReadPost *.html colorscheme monokai
    au BufReadPost *.java colorscheme monokai
    au BufReadPost *.php colorscheme monokai
    
    

Add the following line to the bottom of your: 

a.  /home/el/.profile (create it if it doesn't exist) 

 OR
 
b.  /home/el/.bashrc (should already exist)

    TERM=xterm-256color

Restart the terminal so the changes can take effect.

Everything should be done, to test it to see if it works, open a code file like this:

    vim mypython.py

Follow the instructions below.







Test it with a python file:
---------


Then put this python code in a file called /home/el/mypython.py:

    #!/usr/bin/python -tt
    
    import subprocess, sys 
    from django.http import HttpResponse
    from pinkie_pie import unit_tests as unit
    
    twilight_sparkle = {0: '', 1: 'derpy'}
    rainbow_dash = Math.sqrt(1*5)
    
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
    

open the file you just made:

    vi mypython.py

Now the code files should look like the images at the top.  If not, go over the instructions and look for mistakes, it works for me.



Test it with a Java file:
---------


Then put this python code in a file called /home/el/myjava.java:

    
    package mypackage;
    import java.awt.Point;  import java.io.*;
    import java.util.ArrayList;
    public class CalculateStats {
        public static void main(String[] args) throws Exception{
            int a, b = 10; 
            String foo = "ok";
            System.out.println("hi \n " + b + 9 * (2 % 1));
            final Point p = new Point(23, 94);
            float browndischarge = 13.75f;
            if (browndischarge > 3 && true)
                throw new RuntimeException("too many " +
                       "cats clogging the intertubes");
            else
                browndischarge = 5 & 3;
        
            foo = "hello" + foo;
            //the aliens are on route, we must prepare
            fromulate();
        }   
        protected enum Choices {
            NORTH(1), SOUTH(2), EAST(3), DENNIS(4);
            private int value;
            private Choices(int value){ this.value = value; }
        }   
        public static boolean fromulate() throws FoobarException{
            Runnable r = new Runnable(){
                public void run(){
                    for(int x = 0; x <= 10; x++){
                        boolean pinkiepie = true;
                    } //The aliens are approaching, man 
                }     //your stations and prime the nuclear 
            };        //thunder well cannons that hurl 100
                      //ton objects at 6 times escape velocity.
            int j = -3;    
            while(j != 5){ 
                j++;    
            }    
            Thread t = new Thread(r);
            t.start();
            return (true || false); 
        }   
        private String testtry(){
            int[] myIntArray = new int[3];
            String[] myStrArray = {"herp", "derp"};
            try{
                int b = 0;   /* Fluttershy is best pony */
                int a = 5 / b % 3 * 9;
            }   
            catch(ArithmeticException e){ 
                System.out.println(e.getMessage());
            }   
            ArrayList<String> myArr = new ArrayList<String>();
            myArr.add("derpy mcderp");
            return myArr.get(0);
        }   
    }
    class FoobarException extends Exception{}


open the file you just made:

    vi myjava.java

Now the code files should look like the images at the top.




Test it with an HTML file:
---------

Put this html code in a file called /home/el/myhtml.java:

    <!DOCTYPE html>
    <html>
        <head>
            <title>Yes we can.</title>
            <meta name="twitter:card" content="summary">
            <link rel="stylesheet" type="text/css" href="styles.css">
            <style>
                p { background-color:#b0c4de; }
                body { background-image:url('trogdor.gif'); }
                .myclasscontainer { margin-left:auto; }
                #mytagid { color:green }
            </style>
        </head>
        <body>
        <h1>Headings are light purplish</h1>
        <b>Woah Kickass, VI can bold the b tags? In the html document?</b>
        &nbsp;&lt;&gt;&cent;&pound;&yen;&sect; <!-- check out my html entities -->
        <!-- The aliens are on route, they are preparing the biological weapons -->
        <p>Myparagraph</p><br /><hr>
        <a href="http://sentientmachine.blogspot.com">ah pity the fool</a>
        <img src='kittykat.png' alt="kitler" width='104'>15 petabytes of cats</img>
        <i>Italic text is auto-highlighted like this</i>
        <a href="mailto:snowden@nsa.gov">
        Iphone batteries can't be removed so NSA can turn the mic via backdoor</a>
        <div id="mytagid">Net neutrality will be dead soon, meshnet will carry</div>
        <div class="myclass">the tortch as old internet becomes "TV" with fees</div>
        <del>pay-per-view to visit a website, taxes per click, and corruption</del>
        <table border=1><tr><td></td></tr></table>
        <div style="color:#40B3DF;background-color:Grey">fun colors</div>
        <form action="GET">
            <input type="text" name="user">  
        </form>
        <script type="text/javascript">
            document.write("How is babby formed?");
            var howgirlgatpragnant = "they need to do way instain mother";
        </script>
        <pre>this text is visually selected and the cursor is here </pre>
      </body>
    </html>

Save it, open it, and it should be colorized like on the top images.




Test it with a SCRIPT file:
---------

Important: You must name the file with no extension and starting with a dot like .bashtemp:

Put this script code in a file called /home/el/.bashtemp:

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
    
    alias example='this line is selected, cursor is here: '


Open the file and it should be colorized like at the top.






Test it with a php file:
---------


Then put this php code in a file called /home/el/myphp.php

    <?php
      print hello;
      //working on some code that shows all the syntax options.
    ?>


open the file you just made:

    vi myphp.php

Now the code files should look like the images at the top.



Notes!
---------
If you put these commands in the .vimrc under /root/ then crontab may complain of .vimrc errors.  My solution to this was to not put any of these commands in the /root/.vimrc the consequence of this is you can't get colors when using vi as root.  
