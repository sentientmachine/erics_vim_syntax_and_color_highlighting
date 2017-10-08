execute pathogen#infect()

set nocompatible       "use the modern version of Vim, not the one backwards compatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'VundleVim/YouCompleteMe'
"Plugin 'lambdalisue/vim-manpager'
Plugin 'scrooloose/syntastic'
Plugin 'VundleVim/neomake'
Plugin 'VundleVim/YouCompleteMe'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
"Plugin 'VundleVim/Nvim-R'
Plugin 'martingms/vipsql'
Plugin 'VundleVim/dbext.vim'
Plugin 'scrooloose/nerdcommenter'    "Enables <leader> cc to comment visual selection neatly


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" END VUNDLE THINGS

"======== Good for windows users and linux users who want to paste 
"with Ctrl-V to snap it in to paste mode automatically so it doesn't mess up jk
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

"=====END =======



"The following three lines map Ctrl+s to save in vi.  You can comment 
"these out, it has nothing to do with syntax highlighting or colors.

" optional lines to turn on pressing F2 to toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

map <f12> :!ctags -R .<cr>
nnoremap <f5> :redraw!<cr>

"This is for ctags, Ctrl-t and Ctrl-] is hard to hit so I make that Ctrl h and Ctrl l
nnoremap <c-h> <c-]>
nnoremap <c-l> <c-t>

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

syntax on
set background=dark
set hlsearch
"Show line numbers
set nu
" set smartindent  "smartindent doesn't take care of python hashtag comments correctly, use cindent
set cindent
"literal tabs should be shown as 4 spaces wide.
set tabstop=4
set shiftwidth=4
"when you press tabs it expands into tabstop spaces
set expandtab
set cursorline
"Textwidth defines how wide the line can be in characters before vim automatically adds a newline.
"I don't like autowrapping in my code files, but do where I write things.  Set to 0 to disable
"#shortcut is :set tw=0
set textwidth=0

filetype on
filetype plugin indent on

"function RestoreViewPane()
    "This mission critical workaround hack tells vim to restore cursor 
    "to the last line.  But don't run it on man pages.
    "Be sure to set: 'Thip, crinkle, sploit' to 'stopit, just be right'.  lolz
    "Also it could be the functionality is disabled in your /etc/vim/vimrc or 
    "your ~/.viminfo is owned by root.  
    "http://askubuntu.com/questions/223018/vim-is-not-remembering-last-position
    "autocmd BufReadPost *
    "  \ if line("'\"") > 1 && line("'\"") <= line("$") |
    "  \   exe "normal! g`\"" |
    "  \ endif
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

au BufReadPost,BufNewFile *.java colorscheme monokai
au BufReadPost,BufNewFile *.cpp colorscheme molokaicpp
au BufReadPost,BufNewFile *.py colorscheme molokaiyo
au BufReadPost,BufNewFile *.html colorscheme monokai
au BufReadPost,BufNewFile *.twig colorscheme koehler 
au BufReadPost,BufNewFile *.css colorscheme slate
au BufReadPost,BufNewFile *.js colorscheme slate2
au BufReadPost,BufNewFile *.json colorscheme monokambat
au BufReadPost,BufNewFile *.php colorscheme molokaiyophp                                                                       
au BufReadPost,BufNewFile *.r colorscheme molokaiyo_r
au BufReadPost,BufNewFile *.R colorscheme molokaiyo_r
au BufReadPost,BufNewFile *.m colorscheme molokaiyo_matlab
au BufReadPost,BufNewFile *.Rmd colorscheme molokaiyo_r
au BufWinEnter,FileType vim colorscheme molokai
au BufReadPost,BufNewFile *.tex colorscheme molokaiyo_tex
au BufWinEnter,FileType tex colorscheme molokaiyo_tex


"this makes it so you can Shift-V highlight lots of text then press ,cc
"to comment it or ,cu to uncomment.  
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
"BUT WAIT USE THIS builtin comment method, ITS BETTER
"Put your cursor where you want the comment block to go
"press Ctrl-Q (alias for Ctrl-Shift-V), arrow down, press shift+I (to insert before)
"type the characters, like " for comment.  Press esc (or jk), give it a second.
"to uncomment, press Ctrl-Q, Arrow down, press x for delete.  Whammo awesome



" Default line highlighting for unknown filetypes
hi String ctermfg=140
hi CursorLine ctermbg=235
hi CursorLine guibg=#D3D3D3 cterm=none

"What follows are optional things, I like them

au BufNewFile,BufRead *.py 
        \ set tabstop=4 
"        \ set shiftwidth=4     "aand fedora/gentoo doesn't like this parameter, remove this line.
        \ set expandtab 
        \ set autoindent 
        \ set fileformat=unix




" Commenting blocks of code.
" This specifies the comment character when specifying block comments.
autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python,php let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
autocmd FileType r                let b:comment_leader = '#'
autocmd FileType rmd              let b:comment_leader = '#'

" This command lets it so if you press F10, it runs the python program
" This will need to be adapted so it runs any program correctly
nnoremap <buffer> <F10> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>


"Stupid Rms files can't keep the screen drawn correctly, workaround
noremap <C-I> <Esc>:syntax sync fromstart<CR>
inoremap <C-I> <Esc>:syntax sync fromstart<CR>



"this makes it so you can Shift-V highlight lots of text then press ,cc to
"comment it or ,cu to uncomment.  
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


"These extra commands tell syntastic to ignore the following kinds of warnings                                                               
let g:syntastic_quiet_messages = { "regex": 'superfluous' }
let g:syntastic_quiet_messages = { "regex": 'superfluous-parens\|too-many-instance-attributes\|too-few-public-methods' }

"I like the vertical bar on insert mode, others do not like.  You decide.
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_wq = 0       "Important that this is 0, or it will error out.
let g:syntastic_error_symbol = 'x'    "replace with any character to denote an error.
let g:syntastic_warning_symbol = '!'
let g:syntastic_python_pylint_post_args="--max-line-length=95"
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }    "Disable syntastic on vi start for python
let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }      "Disable syntastic on vi start for java 
let g:syntastic_mode_map = { 'passive_filetypes': ['r'] }         "Disable syntastic on vi start for java 

"let g:syntastic_mode_map = { 'mode': 'active',
"     \ 'active_filetypes': ['r', 'python'], }

"let g:syntastic_enable_r_lintr_checker = 1
"let g:syntastic_r_lintr_linters = "with_defaults(line_length_linter(120))"


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_r_checkers=['lintr']
"let g:syntastic_r_exec = '/usr/bin/R'

"let g:syntastic_r_lint_styles = 'list(spacing.indentation.notabs, spacing.indentation.evenindent)'

" Map the command :s to :SyntasticToggleMode
:command Sd SyntasticToggleMode
:command Sc w | SyntasticCheck

" let g:syntastic_quiet_messages = { "regex": 'superfluous-parens\|too-many-instance-attributes\|too-few-public-methods\|redefined-outer-name\|invalid-name\|too-many-public-methods\|unused-wildcard-import\|wildcard-import\|trailing-whitespace\|bare-except\|C0103\|R0903\|C0324\|C0321\|C0111\|R0201' }

let g:syntastic_quiet_messages = { "regex": 'superfluous-parens\|too-many-instance-attributes\|too-few-public-methods\|redefined-outer-name\|invalid-name\|too-many-public-methods\|unused-wildcard-import\|wildcard-import\|trailing-whitespace\|bare-except\|broad-except\|rawtypes\|missing-docstring\|unused-import\|bad-continuation\|attribute-defined-outside-init\|line-too-long\|bad-whitespace\|protected-access\|too-many-locals\|too-many-statements\|unused-variable\|no-self-use\|too-many-branches\|too-many-return-statements\|too-many-arguments\|E265\|E303\|E221\|E202\|E262\|E501\|E302\|W391\|E302\|F401\|E251\|E231\|E502\|E128\|E125\|E261\|E225\|W293\|W291\|E712\|E127\|E701\|unnecessary-pass\|multiple-statements\|unused-argument\|E402\|F403\|unidiomatic-typecheck\|relative-import\|too-many-lines\|E401\|too-many-function-args\|global-statement\|E116\|E111\|E129' }


"To get youcompleteme to move the cursor to the upper help buffer, use
"jk<space>wk
"
"let g:ycm_autoclose_preview_window_after_completion=2
"let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_insertion=0
let g:ycm_autoclose_preview_window_after_completion=1



"let g:ycm_path_to_python_interpreter='/usr/bin/python2'
let g:ycm_path_to_python_interpreter='/usr/bin/python'
"let g:ycm_path_to_r_interpreter='/usr/bin/Rscript'
let g:ycm_auto_trigger = 1

"This one is for java, for letting us absorb what is under the lib directory
let g:syntastic_java_javac_classpath=".:./lib/*"

"Map <space>jd to navigate to the implementation definition of the function underneath
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>do :YcmCompleter GetDoc<CR>

"This makes it so pressing enter on a selection selects it.
:inoremap <expr> <Enter> pumvisible() ? "<Esc>a" : "<Enter>"


"The list of filetypes for which youcompleteme (including path completion) should not load
let g:ycm_filetype_blacklist = {
      \ 'javascript' : 1,
      \ 'c' : 1,
      \ 'notes' : 1,
      \ 'vim' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'php' : 1,
      \ 'markdown' : 1
      \}
      " 'sh' : 1,      "It was fucking up on sh before, but now path completion in quotes is good
      " 'java' : 1,    "It was fucking up on java before, but now path completion in quotes is good

" let g:syntastic_java_javac_classpath=".:./lib/*"
" This searches for a .vim.custom file in the current directory and applies
" it if it exists.
if filereadable(".vim.custom")
    so .vim.custom
endif


" Prevent vim from hanging during paste of huge text
if has('arabic')
     set noarabicshape
endif

"On a PC, remap the keys that the default Alt-k through Alt-h map to, to
"the correct window remap commands.
nnoremap <A-Up> :wincmd k<cr>
nnoremap <A-Down> :wincmd j<cr>
nnoremap <A-Left> :wincmd h<cr>
nnoremap <A-Right> :wincmd l<cr>

map <Esc>k :wincmd k<cr>
map <Esc>j :wincmd j<cr>
map <Esc>l :wincmd l<cr>
map <Esc>h :wincmd h<cr>

"In a Mac, remap the keys that the default option-k through option-h map to to
"the correct window remap commands
"map ˚ :wincmd k<cr>
"map ∆ :wincmd j<cr>
"map ¬  :wincmd l<cr>
"map ˙  :wincmd h<cr>
"nnoremap <Esc>[D :wincmd k<cr>
"nnoremap <Esc>[C :wincmd j<cr>
"nnoremap <Esc>[A :wincmd l<cr>
"nnoremap <Esc>[B :wincmd h<cr>

:command V vimshell


"This command makes it so that pressing enter after a #mycomment or
"//mycomment does not add another comment on the next line
"au BufNewFile,BufRead * set formatoptions-=r
"What the hell this doesn't stick!!!
set formatoptions-=r


"This sets it so that new tabs in Konsole get the name of the file.
"let &titlestring = $USER . "@" . hostname() . " " . expand("%:p")
let &titlestring = expand("%:p")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

:imap jk <c-c>
"Map capital C to J which at this point means join lines
:nnoremap C J
"I like my Shift K, J to mean pageup and page down
:nnoremap K <PageUp>
:nnoremap J <PageDown>
:vnoremap K <PageUp>
:vnoremap J <PageDown>

"lower c collides with the great commands ca}  ,  ca)   so use capital C for join lines :nnoremap C J
"Make semicolon behave like colon, wtf they want us to press shift anyway?
:nnoremap ; :

"Experimenting with disabling the escape button, fucking macbook execs
":inoremap      <Esc>    <NOP>
":noremap       <Esc>    <NOP>

"map Ctrl-j to escape
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>

"command Ru execute "!python %"
nnoremap ru execute "!python %"

"Open a cheat sheet
"autocmd FileType html split | edit /home/el/.vim/cheatsheets/html.txt


"nnoremap <F1> :split<Esc>:edit &cheatsheet_file<CR>
"Automatic Help when you press F1 takes you to these cheatsheets:
autocmd FileType html nnoremap <F1> :split<Esc>:edit /home/el/.vim/cheatsheets/html.txt<CR>
autocmd FileType r nnoremap <F1> :split<Esc>:edit /home/el/.vim/cheatsheets/r.txt<CR>
autocmd FileType python nnoremap <F1> :split<Esc>:edit /home/el/.vim/cheatsheets/python.txt<CR>
autocmd FileType java nnoremap <F1> :split<Esc>:edit /home/el/.vim/cheatsheets/java.txt<CR>


"command LatexTable :r ~/.vim/snippets/latex/LatexTable.txt
:source /home/el/.vim/menu.vim
:set wildmenu
:set cpo-=<
:set wcm=<C-Z>
:map <C-n> :emenu <C-Z>
:aunmenu Edit

:nmenu Snippet.Add\ Var         wb"zye:menu! Words.<C-R>z <C-R>z<CR>

:menu Snippet.Change\ Colorscheme  :colorscheme default<CR>
:menu Snippet.Insert\ Dummy\ Text  :i<CR>asdf<CR><Esc>


let g:tex_flavor = "latex"

set spelllang=en
"The default spellfile is /home/el/.vim/spell/en.utf-8.add


"This is from Damian Conway's instantly better vim.
"This is great for a proof of concept in writing my own highlighter:
"When doing a / search, then pressing n, highlight the block you're on and blinking red
"to draw our eyes there.  This rewires n and N to do the highlighing.
"
"nnoremap <silent> n   n:call HLNext(0.4)<cr>
"nnoremap <silent> N   N:call HLNext(0.4)<cr>
"highlight WhiteOnRed ctermfg=red ctermbg=red
"function! HLNext (blinktime)
"    let [bufnum, lnum, col, off] = getpos('.')
"    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
"    let target_pat = '\c\%#\%('.@/.'\)'
"    let ring = matchadd('WhiteOnRed', target_pat, 101)
"    redraw
"    exec 'sleep ' . float2nr(a:blinktime * 2000) . 'm'
"    call matchdelete(ring)
"    redraw
"endfunction

"This is for R crap
"syn iskeyword=@,48-57,_,192-255
"set iskeyword=@,48-57,_
"set iskeyword=@,48-57,192-255 











syntax sync fromstart



set ignorecase " ignore case when searching lowercase
set smartcase  " don't ignore case when inserting uppercase characters

" edit read only files
:cnoremap w!! w !sudo tee % >/dev/null



let mapleader=" "
" quickly open vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" remap ctrl-w   to space w
:nnoremap <leader>w <C-w>
:inoremap <A>w <C-w>




" This is for visql config options:
" " Starts an async psql job, prompting for the psql arguments.
" Also opens a scratch buffer where output from psql is directed.
noremap <leader>po :VipsqlOpenSession<CR>

" Terminates psql (happens automatically if the scratch buffer is closed).
noremap <silent> <leader>pk :VipsqlCloseSession<CR>

" In normal-mode, prompts for input to psql directly.
nnoremap <leader>ps :VipsqlShell<CR>

" In visual-mode, sends the selected text to psql.
vnoremap <leader>ps :VipsqlSendSelection<CR>

" Sends the selected _range_ to psql.
noremap <leader>pr :VipsqlSendRange<CR>

" Sends the current line to psql.
noremap <leader>pl :VipsqlSendCurrentLine<CR>

" Sends the entire current buffer to psql.
noremap <leader>pb :VipsqlSendBuffer<CR>

" Sends `SIGINT` (C-c) to the psql process.
noremap <leader>pc :VipsqlSendInterrupt<CR>

" Which command to run to get psql. Should be simply `psql` for most.
" let g:vipsql_psql_cmd = "psql -Upostgres -d postgres"
let g:vipsql_psql_cmd = "psql"
" this is incompatible with mysql
" The prompt to show when running `:VipsqlShell`
let g:vipsql_shell_prompt = "> "

" What `vim` command to use when opening the scratch buffer
let g:vipsql_new_buffer_cmd = "rightbelow split"


" ======================================================
" DBEXT things:
" ======================================================
"
" MySQL
"let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=el:passwd=nochin4u:dbname=sentientmachine'
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=el:dbname=sentientmachine'
let g:dbext_default_profile_mysql_machines = 'type=MYSQL:host=machinesentience.com:user=machines:port=3306:passwd=`cat /home/el/mysql_machines_pw.txt`:dbname=machines_organizedthought'

"defiant postgresql:
let g:dbext_default_profile_psql_local = 'type=PGSQL:host=127.0.0.1:port=5432:dbname=postgres:user=postgres'

"rosewill postgresql
let g:dbext_default_profile_rosewill_postgresql = 'type=PGSQL:host=10.204.138.122:port=5432:dbname=kurz_prod:user=pgadmin'

"Special settings:
let g:dbext_default_buffer_lines = 35
map <leader>l :DBListTable<CR>

"Pick your database here:
" let g:dbext_default_profile = 'mysql_local'
" let g:dbext_default_profile = 'mysql_machines'
" let g:dbext_default_profile = 'psql_local'
let g:dbext_default_profile = 'rosewill_postgresql'



" SQLite
"let g:dbext_default_profile_sqlite_for_rails = 'type=SQLITE:dbname=/path/to/my/sqlite.db'


"Automatically update the ctags file when you write:
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
"Specify what files the ctag update works on:
autocmd BufWritePost *.py,*.h,*.c call UpdateTags()


"Pressing the asterisk shouldn't jump, and also shouldn't add an item to the jumplist
"This has a problem, it does a 'zz' when the thing under cursor isn't focused.  
nnoremap * :keepjumps normal! mi*`i<CR>


"scrooloose/nerdcommenter
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 0



"blinkenmatchen, DAmian Conway's more instantly better vim
"Doesn't quite work because it plays tug of war with syntax and color files
"nnoremap <silent> n  n:call HLNext()<cr>
"nnoremap <silent> N  N:call HLNext()<cr>
"
"function! HLNext (blinktime)
"    set invcursorline
"    redraw
"    exec 'sleep ' . float2nr(a:blinktime * 200) . 'm'
"    set invcursorline
"    redraw
"endfunction


" Use persistent history.
if !isdirectory("/home/el/.vim/vim-undo-dir")
    call mkdir("/home/el/.vim/vim-undo-dir", "", 0700)
endif
set undodir=/home/el/.vim/vim-undo-dir
set undofile


"commang gx in normal mode opens link under cursor  (also middle click works)
