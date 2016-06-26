set nocompatible              " be iMproved, required
filetype off                  " required

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'elixir-lang/vim-elixir'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/Syntastic'
Plug 'pthrasher/conqueterm-vim'
Plug 'sjl/badwolf'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'moll/vim-bbye'
Plug 'rust-lang/rust.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'mxw/vim-jsx'
Plug 'ajh17/Spacegray.vim'
Plug 'fatih/vim-go'
Plug 'Shougo/neocomplete.vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gabesoft/vim-ags'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'
"Plug 'Valloric/YouCompleteMe'
"Plugin 'marijnh/tern_for_vim'
"Plug 'chriskempson/base16-vim'
call plug#end()

" Put your non-Plugin stuff after this line
"
set t_Co=256

set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set nu
colors Tomorrow-Night-Bright
syntax on
let g:airline_powerline_fonts = 1
set guifont=Inconsolata\ for\ Powerline:h18
"nnoremap <Leader>t :ConqueTerm mix test<CR>
nnoremap <Leader>b :ConqueTerm bash<CR>
nnoremap <Leader>n :ConqueTerm node<CR>
"au FileType go nmap <Leader>t :ConqueTerm make test<CR>
"au FileType go nmap <Leader>b :ConqueTerm make build<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:airline#extensions#tabline#enabled = 1

let g:ConqueTerm_StartMessages = 0
let g:jsx_ext_required = 0
let g:neocomplete#enable_at_startup = 1
highlight link xmlEndTag xmlTag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

if has("gui_macvim")
    colors Tomorrow-Night
    "set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
endif
