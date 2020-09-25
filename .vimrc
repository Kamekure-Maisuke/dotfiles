" option
set encoding=utf-8  " encoding
set nobackup " not backupfile
set noswapfile " not swapfile
set autoread " autoreload file
set hidden " Open other files while editing buffers
set showcmd " Display the input command on the status
set modelines=0  " security
set autoindent  " auto indent
set number  " line numbering
set mouse=a  " support mouse
set laststatus=2  " Display statusline
set cursorline  " display current line
set virtualedit=onemore  " Move the cursor to one character at the end of the line.
set smartindent  " smart indent
set showmatch  " Corresponding brackets
set wildmode=list:longest  " Command Completion
set list  " Visualizing the blank
set listchars=eol:↲,trail:-,extends:»,precedes:«,nbsp:%
syntax enable  " syntax

" mapping key
" use space key
let mapleader = "\<Space>"
inoremap <Leader>jj <Esc>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
map <leader>n :call RenameFile()<cr>

" emacs keybind
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>x

" autocmd
augroup vimrc
  autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif  " auto remove blank
augroup END

" function
function! RenameFile()  " rename currentfile
    let old = expand('%')
    let new = input('新規ファイル名: ', old , 'file')
    if new != '' && new != old
        exec ':saveas ' . new
        exec ':silent !rm ' . old
        redraw!
    endif
endfunction
