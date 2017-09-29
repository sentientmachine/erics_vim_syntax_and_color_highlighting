
#this file belongs in the directory where your python site-packages is defined:
#for me on gentoo: /home/el/.local/lib64/python2.7/site-packages/usercustomize.py
#see: https://github.com/sentientmachine/better-exceptions/blob/master/README.md

use_better_exceptions = True     #flip this to false to use the other one

if (use_better_exceptions):
    import better_exceptions
    better_exceptions.MAX_LENGTH = 500

else:
    try:

        #exec("/home/el/bin/wrapper_main_python.py")

        import sys
        #
        from pygments.style import Style
        from pygments.token import Keyword, Name, Comment, String, Error, \
             Number, Operator, Generic

        class MyStyle(Style):
            """ 
            A colorful style, inspired by the manni terminal highlighting style.
            """
        
            background_color = '#f0f3f3'
        
            styles = { 
                #Whitespace:         '#bbbbbb',
                Comment:            'italic #0099FF',
                Comment.Preproc:    'noitalic #009999',
                Comment.Special:    'bold',
            
                Keyword:            'bold #006699',
                Keyword.Pseudo:     'nobold',
                Keyword.Type:       '#007788',
            
                Operator:           '#FF0000',
                Operator.Word:      'bold #000000',
                Name.Builtin:       '#FF44FF',      #this one defines the Error's FileName
                Name.Function:      '#CC00FF',
                Name.Class:         'bold #00AA88',
                Name.Namespace:     'bold #00CCFF',
                Name.Exception:     'bold #CC0000',
                Name.Variable:      '#003333',
                Name.Constant:      '#336600',
                Name.Label:         '#9999FF',
                Name.Entity:        'bold #999999',
                Name.Attribute:     '#330099',
                Name.Tag:           'bold #330099',
                Name.Decorator:     '#9999FF',
        
                String:             '#CC3300',
                String.Doc:         'italic',
                String.Interpol:    '#AA0000',
                String.Escape:      'bold #CC3300',
                String.Regex:       '#33AAAA',
                String.Symbol:      '#FFCC33',
                String.Other:       '#CC3300',
        
                #Number:             'bg:#FFFFFF #FF6600',         #this one defines the error's line number
                Number:             'bg:#555555 bold #FFFFFF', 
                Generic.Heading:    'bold #003300',
                Generic.Subheading: 'bold #003300',
                Generic.Deleted:    'border:#CC0000 bg:#FFCCCC',
                Generic.Inserted:   'border:#00CC00 bg:#CCFFCC',
                Generic.Error:      'bg:#FF0000 bold #000000',
                Generic.Emph:       'italic',
                Generic.Strong:     'bold',
                Generic.Prompt:     'bold #000099',
                Generic.Output:     '#AAAAAA',
                Generic.Traceback:  'bg:#FF0000 bold #00FF00',
        
                Error:              'bg:#FFAAAA #AA0000'
                #Error:              'bg:#FF0000 bold #AA0000'
                #Error:              'bg:#00FF00 bold #00FF00'
            }
        

        
        def myexcepthook(type, value, tb):
            import traceback
            from pygments import highlight
            from pygments.lexers import get_lexer_by_name
            #from pygments.formatters import TerminalFormatter
            from pygments.formatters import Terminal256Formatter
       

            #from pygments.styles import get_all_styles
            #print(list(get_all_styles()))
            #exit()

            tbtext = ''.join(traceback.format_exception(type, value, tb))
            lexer = get_lexer_by_name("pytb", stripall=True)
        #    formatter = TerminalFormatter(bg='dark')
        #    #formatter = TerminalFormatter(colorscheme=COLOR_SCHEME)
        #    formatter = Terminal256Formatter(style='friendly')
        #    formatter = Terminal256Formatter(style='default')
        #    formatter = Terminal256Formatter(style='colorful')
            #formatter = Terminal256Formatter(style='vim')
            #formatter = Terminal256Formatter(style='fruity')
            #formatter = Terminal256Formatter(style='manni')      #good, except for FileName
            #formatter = Terminal256Formatter(style=MyStyle)
            #formatter = Terminal256Formatter(YourStyle)
            formatter = Terminal256Formatter(style=MyStyle)


            #formatter = Terminal256Formatter(style='igor')      #terrible
            #formatter = Terminal256Formatter(style='xcode')      #terrible
            #formatter = Terminal256Formatter(style='autumn')      #ok
            #formatter = Terminal256Formatter(style='vs')          #terrible
            #formatter = Terminal256Formatter(style='rrt')
            #formatter = Terminal256Formatter(style='native')
            #formatter = Terminal256Formatter(style='perldoc')
            #formatter = Terminal256Formatter(style='borland')    #bad
            #formatter = Terminal256Formatter(style='tango')      #bad
            #formatter = Terminal256Formatter(style='emacs')
            #formatter = Terminal256Formatter(style='monokai')     #best one yet
            #formatter = Terminal256Formatter(style='monokaiyo')
            #formatter = Terminal256Formatter(style='paraiso-dark')
            #formatter = Terminal256Formatter(style='murphy')
            #formatter = Terminal256Formatter(style='bw')
            #formatter = Terminal256Formatter(style='pastie')
            #formatter = Terminal256Formatter(style='paraiso-light')
            #formatter = Terminal256Formatter(style='trac')            #ok
            sys.stderr.write(highlight(tbtext, lexer, formatter))
        #
        sys.excepthook = myexcepthook
        print("ROCKETMAN!")

    except ImportError:
        print("Can't load your things")
        print("Either exit here, or perform remedial actions")
        exit()
        
