"The following three lines map Ctrl+s to save in vi.  You can comment 
"these out, it has nothing to do with syntax highlighting or colors.

" optional lines to turn on pressing F2 to toggle paste mode
noremap <F2> :set invpaste paste?<CR>i
set pastetoggle=<F2>

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

"======== Good for windows users who want to paste with Ctrl-V to snap it in to paste mode
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

syntax on
set background=dark
set hlsearch
set nu
" set smartindent  "smartindent doesn't take care of python hashtag comments correctly, use cindent:    
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set textwidth=100   "The textwidth is the width of a line before forced wrapping takes place
filetype on
filetype plugin indent on


"This stores a file under ~/.vim/view that keeps data about the window 
"view and cursor for all files so it snaps back on reopen 
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

au BufReadPost,BufNewFile *.twig colorscheme koehler 
au BufReadPost,BufNewFile *.css colorscheme slate
au BufReadPost,BufNewFile *.js colorscheme slate2
au BufReadPost,BufNewFile *.py colorscheme molokaiyo
au BufReadPost,BufNewFile *.html colorscheme monokai
au BufReadPost,BufNewFile *.java colorscheme monokai
" au BufReadPost,BufNewFile *.php colorscheme monokai

" Default line highlighting for unknown filetypes
hi String ctermfg=140
hi CursorLine ctermbg=235
hi CursorLine guibg=#D3D3D3 cterm=none

"What follows are optional things, I like them

au BufNewFile,BufRead *.py 
        \ set tabstop=4 
        "\ set shiftwidth=4     "aand fedora doesn't like this parameter, remove this line.
        \ set expandtab 
        \ set autoindent 
        \ set fileformat=unix

" Commenting blocks of code.
" This specifies the comment character when specifying block comments.
autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'

"this makes it so you can Shift-V highlight lots of text then press ,cc to
"comment it or ,cu to uncomment.  
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"This mission critical workaround hack tells vim to restore cursor to the last line.
"Be sure to set: "Thip, crinkle, sploit" to "stopit, just be right".  lolz
"Also it could be the functionality is disabled in your /etc/vim/vimrc or 
"your ~/.viminfo is owned by root.  
"http://askubuntu.com/questions/223018/vim-is-not-remembering-last-position
"autocmd BufReadPost *
"  \ if line("'\"") > 1 && line("'\"") <= line("$") |
"  \   exe "normal! g`\"" |
"  \ endif


"I like the vertical bar on insert mode, others do not like.  You decide.
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

" Make it so Alt + up down left right works when switching vim windows                                                         
nnoremap <A-Up> :wincmd k<cr>
nnoremap <A-Down> :wincmd j<cr>
nnoremap <A-Left> :wincmd l<cr>
nnoremap <A-Right> :wincmd h<cr>

