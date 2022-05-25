set nocompatible	" This option has the effect of making Vim either more Vi-compatible, or
			" make Vim behave in a more useful way.

filetype off		" required


" Automatic installation vim-plug https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif


" Plugin list
call plug#begin() " $HOME/.local/share/nvim/plugged
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-surround'
	Plug 'Yggdroot/indentLine'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'w0rp/ale'
	Plug 'scrooloose/nerdcommenter'
	Plug 'easymotion/vim-easymotion'
	Plug 'sickill/vim-monokai'
	Plug 'fatih/vim-go'
	Plug 'pangloss/vim-javascript'
	Plug 'cespare/vim-toml'
	Plug 'rust-lang/rust.vim'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'https://github.com/github/copilot.vim.git'

	"" Installation instruction on Neovim: /Users/luisaguilera/.local/share/nvim/plugged/youcompleteme (README.md)
	Plug 'valloric/youcompleteme'


	"" TODO: https://neovim.io/doc/user/lsp.html#:~:text=QUICKSTART%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20*lsp%2Dquickstart*
	"" Still experimenting as it makes Neovim slow
	Plug 'neovim/nvim-lspconfig'
	" TODO: Install https://github.com/hrsh7th/nvim-cmp/#recommended-configuration
call plug#end()


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use: filetype plugin on


" change map keyboard button
let mapleader = " "


"" highlight search
" toogle
map <leader>hl :set hlsearch!<CR>


"" jq, JSON prettier file
map <leader>jq :%!jq . <CR>


syntax enable
set t_Co=256              " enable 256-color mode.
set number                " show line numbers
set relativenumber


" colorscheme monokai
packadd! dracula
colorscheme dracula


"==================== Golang config ====================
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"	 " format with goimports instead of gofmt

let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

"" there is an issue, how to not fold on save? https://github.com/fatih/vim-go/issues/3098
let g:go_fmt_experimental=1

" Status line types/signatures
"" let g:go_auto_type_info = 1


au FileType go map <leader>tt :GoTest<CR>
au FileType go map <leader>tf :GoTestFunc<CR>

au FileType go map <leader>tdt :GoDebugTest<CR>
au FileType go map <leader>tdf :GoDebugTestFunc<CR>
au FileType go map <leader>tdb :GoDebugBreakpoint<CR>
au FileType go map <leader>tdc :GoDebugContinue<CR>
au FileType go map <leader>tdn :GoDebugNext<CR>
au FileType go map <leader>tdx :GoDebugStop<CR>

au FileType go map <leader>gi :GoImplements<CR>
au FileType go map <leader>gr :GoReferrers<CR>


au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

"==================== Golang config END ====================


"==================== Rust config ====================

"" Auto formatting with :RustFmt
let g:rustfmt_autosave = 1


"==================== Rust config END====================

"" Javascript config
let g:javascript_plugin_jsdoc = 1
"
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
"
" Highlight characters that go over 100 columns (by drawing a border on the 101st)
if exists('+colorcolumn')
  set colorcolumn=101 " sets 100 characters line length max
  "highlight ColorColumn ctermbg=white
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%101v.\+/
endif

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
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

"" closing parenthesis
inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []

"" closing double quote
inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "
inoremap ""     ""

"" Save/close tab
map <leader>q :q<cr>
map <leader>w :w<cr>
map <leader>wq :wq<cr>


lua require('lspconfig').gopls.setup{}

"" ====================== EXPERIMENTAL. https://github.com/hrsh7th/nvim-cmp/#recommended-configuration
set completeopt=menu,menuone,noselect
