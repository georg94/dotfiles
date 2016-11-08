set nocp
" Enable syntax highlighting
syntax enable
set background=dark
colorscheme solarized

"Always show current position
set ruler

" Always show line numbers
set number

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Use spaces instead of tabs
 set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set wrap "Wrap lines

" ---
set showmatch
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

set laststatus=2
set showtabline=2

" set wildmenu wildmode=longest:full
command Q q
