set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'sickill/vim-monokai'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'
Plugin 'junegunn/fzf'
Plugin 'dracula/vim', { 'name': 'dracula' }


" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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


" go config
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"	 " format with goimports instead of gofmt

let g:go_highlight_fields = 1
let g:go_highlight_functions = 1

" javascript config
let g:javascript_plugin_jsdoc = 1

" change map keyboard button
let mapleader = " "

syntax enable
set t_Co=256              " enable 256-color mode.
set number                " show line numbers
set relativenumber
" colorscheme monokai
packadd! dracula
colorscheme dracula


" Plugin 'kien/ctrlp.vim' Config:
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'


"" TODO: all of the bellow is on testing
" Format config
" set expandtab
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
" set autoindent            " auto-indent
" set shiftround            " always indent/outdent to the nearest tabstop

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype go setlocal tabstop=4 sw=4 sts=4
autocmd Filetype json setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

"" Folding configuration, automatically folds file when open
set foldcolumn=1
set foldmethod=syntax
"" there is an issue, how to not fold on save? https://github.com/fatih/vim-go/issues/3098
let g:go_fmt_experimental=1


"" go to def
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

"" go testing
map <leader>tt :GoTest<CR>

"" go debug testing
au FileType go map <leader>ts :GoDebugTest<CR>
au FileType go map <leader>tb :GoDebugBreakpoint<CR>
au FileType go map <leader>tc :GoDebugContinue<CR>
au FileType go map <leader>tn :GoDebugNext<CR>
au FileType go map <leader>tx :GoDebugStop<CR>

"" resize split
map <leader>[ :vertical resize +5<CR>
map <leader>] :vertical resize -5<CR>

"" NERDTree
map <C-n> :NERDTreeToggle<CR>

"" closing brackets, https://vim.fandom.com/wiki/Automatically_append_closing_characters
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

"" closing parenthesis
inoremap (      ()<Left>
inoremap (<CR>  (<CR>}<Esc>)
inoremap ((     (
inoremap ()     ()


"" fzf
nnoremap <c-p> :Files<CR>
