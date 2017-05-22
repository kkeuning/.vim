set nocompatible              " be iMproved, required
filetype off                  " required
" Load vim-plug
" Assumes curl is available and .vim/autoload directory exists
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

let base16colorspace=256  " Access colors present in 256 colorspace"

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
Plug 'tomasr/molokai'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gabesoft/vim-ags'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'
Plug 'dracula/vim'
Plug 'akmassey/vim-codeschool'
Plug 'altercation/vim-colors-solarized'
Plug 'Yggdroot/indentLine'
Plug 'chriskempson/base16-vim'
" filetype plugins
Plug 'vim-ruby/vim-ruby'
Plug 'elzr/vim-json', {'for' : 'json'}
"Plug 'tejr/vim-tmux', {'for': 'tmux'}
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
Plug 'corylanou/vim-present', {'for' : 'present'}
Plug 'edkolev/tmuxline.vim'
"Plug 'itchyny/lightline.vim' "lightline or airline, not both
Plug 'exu/pgsql.vim'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

if has("nvim")
	Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
	Plug 'zchee/deoplete-go', { 'do': 'make'}
	" Use deoplete.
	let g:deoplete#enable_at_startup = 1
    "set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
else
	Plug 'Shougo/neocomplete.vim'
	let g:neocomplete#enable_at_startup = 1
endif
"Plug 'Valloric/YouCompleteMe'
"Plugin 'marijnh/tern_for_vim'
call plug#end()

" Put your non-Plugin stuff after this line
"
set t_Co=256

set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set nu

syntax on
let g:airline_powerline_fonts = 1
"let g:airline_powerline_fonts = 0
set guifont=Source\ Code\ Pro\ for\ Powerline:h18
"nnoremap <Leader>t :ConqueTerm mix test<CR>
nnoremap <Leader>b :ConqueTerm bash<CR>
nnoremap <Leader>n :ConqueTerm node<CR>
"au FileType go nmap <Leader>t :ConqueTerm make test<CR>
"au FileType go nmap <Leader>b :ConqueTerm make build<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:airline#extensions#tabline#enabled = 1

let g:ConqueTerm_StartMessages = 0

"JSX configuration
let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  "let g:ackprg = 'pt -l'
endif
if has("gui_macvim")
    colors base16-tomorrow-night
    "set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
else 
    "Spacegray is the fallback colorscheme
    "base16-tomorrow-night is preferred but will not work in all terminals
"    colors Spacegray
    hi VertSplit ctermfg=59 ctermbg=59 term=NONE
    highlight LineNr ctermfg=grey
endif
if has("nvim")
    "set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
    colors base16-tomorrow-night
endif
let g:sql_type_default = 'pgsql'
