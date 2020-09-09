set number
set numberwidth=1
set mouse=a
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set tabstop=2
set autoindent
set laststatus=2

let mapleader = " "

set nocompatible              " be iMproved, required

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" IDE
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

"Prettier para formateo dde exto
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }

"Sintax Lenguajes y tecnologias
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'styled-components/vim-styled-components', { 'branch': 'main' }
Plugin 'jparise/vim-graphql'
Plugin 'othree/yajs.vim'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'

"emmet
Plugin 'mattn/emmet-vim'

"autocompletado
Plugin 'roxma/nvim-yarp'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/vim-hug-neovim-rpc'

"autocompletado de javascript
Plugin 'carlitux/deoplete-ternjs'
Plugin 'ternjs/tern_for_vim'

"debugin con ale
Plugin 'w0rp/ale'

"Autocompletado  con IA
Plugin 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

"Corchetes
Plugin 'jiangmiao/auto-pairs'

"comentarios
Plugin 'tpope/vim-commentary'

"tema
Plugin 'morhetz/gruvbox'

"snnipets
Plugin 'SirVer/ultisnips'
Plugin 'epilande/vim-react-snippets'

"cambiador  de corchetes
Plugin 'tpope/vim-surround'

"multicursor
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}

"auto import

call vundle#end()            " required

filetype plugin indent on    " required

"Temma color
syntax enable
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark 

"carga de los colores en archivos grandes
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"autocompletado
let g:deoplete#enable_at_startup = 1

" Give more space for displaying messages.
set cmdheight=2

"keywords fzf
map ; :Files<CR>
let g:fzf_preview_window = 'right:60%'

"cursor mode
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"

"linea mode
au InsertEnter * set cul
au InsertLeave * set nocul

"keywords
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

"needTree
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"needTree git
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"lineas git
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

"barra 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

"emmet
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript' : {
    \      'extends' : 'jsx',
    \  },
  \}
autocmd FileType html,css,javascript.jsx EmmetInstall

"cambios de buffer
map <Leader>j :bprev<Return>
map <Leader>k :bnext<Return>
