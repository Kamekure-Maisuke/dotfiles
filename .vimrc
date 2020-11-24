" オプション
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
set listchars=tab:»-,eol:↲,trail:-,extends:»,precedes:«,nbsp:%
set statusline=%n:\ %<%f\ %m%r%h%w[%{&fileformat}][%{has('multi_byte')&&\ &fileencoding!=''?&fileencoding:&encoding}],%c\ %P
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=None
set tabstop=4
syntax enable  " syntax

" クリップボード定義
if has("mac")
  set clipboard+=unnamed
else
  set clipboard^=unnamedplus
endif

" キーマッピング追加
let mapleader = "\<Space>"
nnoremap H ^
noremap L g_
inoremap <Leader>jj <Esc>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <silent> <Leader>vr :new ~/.vimrc<CR>
nnoremap <silent> <Leader>r :source ~/.vimrc<CR>
noremap <Leader><Leader> <C-w>w
map <leader>n :call RenameFile()<cr>
map <Leader>a myggVG
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>x

" 独自関数
" Space + n でカレントファイル名変更
function! RenameFile()
    let old = expand('%')
    let new = input('NewFileName : ', old , 'file')
    if new != '' && new != old
        exec ':saveas ' . new
        exec ':silent !rm ' . old
        redraw!
    endif
endfunction