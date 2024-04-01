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
	"Plug 'dense-analysis/ale'
	Plug 'scrooloose/nerdcommenter'
	Plug 'easymotion/vim-easymotion'
	Plug 'sickill/vim-monokai'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'pangloss/vim-javascript'
	Plug 'cespare/vim-toml'
	Plug 'rust-lang/rust.vim'

	"" Themes
	Plug 'joshdick/onedark.vim'
	Plug 'dracula/vim', { 'as': 'dracula' }

	Plug 'https://github.com/github/copilot.vim.git'

	"" https://thoughtbot.com/blog/align-github-flavored-markdown-tables-in-vim
	Plug 'junegunn/vim-easy-align'

	"" Installation instruction on Neovim: /Users/luisaguilera/.local/share/nvim/plugged/youcompleteme (README.md)
	Plug 'valloric/youcompleteme'

	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim' , { 'tag': '0.1.5' }

	" TODO: https://neovim.io/doc/user/lsp.html#:~:text=QUICKSTART%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20*lsp%2Dquickstart*
	"" Still experimenting as it makes Neovim slow
	"" Plug 'neovim/nvim-lspconfig'
	" TODO: Install https://github.com/hrsh7th/nvim-cmp/#recommended-configuration
	"
	""  Terraform plugins
	Plug 'hashivim/vim-terraform'

	"" Tilt plugins
	Plug 'cappyzawa/starlark.vim'
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


"colorscheme monokai
colorscheme onedark
"packadd! dracula
"colorscheme dracula


"==================== Golang config ====================
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_fmt_command = "gopls"	 " format with goimports instead of gofmt
let g:go_gopls_gofumpt=1

"" https://github.com/daixiang0/gci
"" let g:go_fmt_command = "gci print"	 " format with goimports instead of gofmt


let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

"" there is an issue, how to not fold on save? https://github.com/fatih/vim-go/issues/3098
let g:go_fmt_experimental=1

" Enable all of the linters you want for Go.
"let g:ale_linters = {'go': ['golangci-lint', 'gofmt']}

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

au Filetype go map <leader>ts :normal i time.Sleep(time.Minute*10<CR>

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
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist)|(\.(swp|ico|git|svn))$'


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
  set colorcolumn=120 " sets 100 characters line length max
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

" Set fold method to indent on yaml,yml files
autocmd FileType yaml,yml setlocal foldmethod=indent


"" resize split
map <leader>[ :vertical resize -5<CR>
map <leader>] :vertical resize +5<CR>

"" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

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

"" Set list
set list
set listchars=tab:▸·

"" lua require('lspconfig').gopls.setup{}

"" Set clipboard with yank copy
"" https://stackoverflow.com/questions/677986/how-to-copy-a-selection-to-the-os-x-clipboard
set clipboard=unnamed



"" ====================== EXPERIMENTAL. https://github.com/hrsh7th/nvim-cmp/#recommended-configuration
set completeopt=menu,menuone,noselect

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

"" Remove unwanted spaces
"" https://vim.fandom.com/wiki/Remove_unwanted_spaces#:~:text=One%20way%20to%20make%20sure,all%20trailing%20whitespace%20before%20saving.
map <leader>dts :%s/\s\+$//e<CR>

"" Delete trim spaces only on certain fileTypes
autocmd FileType c,cpp,java,php,go,js,yml autocmd BufWritePre <buffer> %s/\s\+$//e


"" Markdown configs
let g:markdown_folding=1

"let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'golang']


" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>


" Format current file JSON format
" :%!jq .
"
"
"" Copilot setup
"
"" let g:copilot_node_command = 'path to nodejs binary'


"" To use fzf in Vim, add the following line to your .vimrc:
set rtp+=/opt/homebrew/opt/fzf


"" Ignore s3 folders
"" Ignore s3/prod folders
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|dist|\.git|\.svn|\.hg|\.bzr|_darcs|CVS|s3|prod)$',
  \}


"" Detect Starlark file Tiltfile
autocmd BufNewFile,BufRead Tiltfile* setlocal ft=tiltfile syntax=starlark


let g:rust_clip_command = 'pbcopy'
let g:rustfmt_autosave = 1

