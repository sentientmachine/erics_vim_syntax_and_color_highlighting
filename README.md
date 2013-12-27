Code syntax highlighting and color settings for vim.
=====================

This will enable your code to look beautiful for the following code types:

java, python, html, javascript, php, css, bash, haml, viml

If you don't recognize some of these don't worry, you won't see them unless you use them.

If anything here doesn't work for you or you see anything wrong, let me know eric.leschinski@hotmail.com and I'll try to fix it.  It works for me, but then again I know how to surmount problems you may not know how to.

When you open python files in vi, it will look something like this:

PYTHON:

![Imgur](http://i.imgur.com/W26xaan.png)

JAVA:

![Imgur](http://i.imgur.com/UBwgikk.png)



I designed this to work for Ubuntu 12.10, Fedora 17 and Gentoo 3.10.17.  It should work with all linux distributions.


Important
---------

My home directory is /home/el, yours may be different, from here forward replace /home/el with your user.


Install vim and git
    sudo apt-get install vim
    sudo apt-get install git

Make your .vim directory if it doesn't exist.

    mkdir /home/el/.vim
    cd /home/el/.vim
    git clone https://github.com/sentientmachine/erics_vim_syntax_and_color_highlighting.git 

That puts a directory called Pretty-Vim-Python in your .vim directory.  Got to yank out the files and put them where they belong:

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
    "au BufReadPost *.php colorscheme two2tango
    

Add this line to the bottom of your /home/el/.profile (create it if it doesn't exist) or your /home/el/.bashrc

    TERM=xterm-256color

Restart the terminal so the changes can take effect.  Then put this python code in a file called /home/el/mypython.py:

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

Now the code files should look like the images at the top.


