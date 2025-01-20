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
	" MUST
	Plug 'preservim/nerdtree'
	Plug 'preservim/nerdcommenter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'easymotion/vim-easymotion'
	Plug 'https://github.com/github/copilot.vim.git'

	Plug 'junegunn/vim-easy-align'

	Plug 'airblade/vim-gitgutter'

	Plug 'junegunn/fzf.vim'
	Plug 'kevinhwang91/nvim-ufo'
	Plug 'kevinhwang91/promise-async' " Needed by nvim-ufo
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim' , { 'tag': '0.1.6' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	Plug 'nvim-orgmode/orgmode'

	" Code related
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'cespare/vim-toml'
	Plug 'rust-lang/rust.vim'
	Plug 'https://github.com/lifepillar/pgsql.vim'
	Plug 'hashivim/vim-terraform'
	Plug 'cappyzawa/starlark.vim'

	"" Themes
	Plug 'rebelot/kanagawa.nvim'

	" Experimenting
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'L3MON4D3/LuaSnip'
call plug#end()


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use: filetype plugin on


" change map keyboard button
let mapleader = " "


"" toggle highlight search
map <leader>hl :set hlsearch!<CR>

"" jq, JSON prettier file
map <leader>jq :%!jq . <CR>

syntax enable
set t_Co=256              " enable 256-color mode.
set number                " show line numbers
set relativenumber

colorscheme kanagawa

" https://github.com/lifepillar/pgsql.vim
let g:sql_type_default = 'pgsql'

" Highlight characters that go over 100 columns (by drawing a border on the 101st)
if exists('+colorcolumn')
  set colorcolumn=120 " sets 120 characters line length max
  " highlight ColorColumn ctermbg=white
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%101v.\+/
endif


autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
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

"" Set list, show tab characters
set list
set listchars=tab:▸·

"" Set clipboard with yank copy
"" https://stackoverflow.com/questions/677986/how-to-copy-a-selection-to-the-os-x-clipboard
set clipboard=unnamed


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

"" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"" Git commands
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gdb :Git diff %<CR>
nnoremap <leader>gds :Git diff --staged<CR>
nnoremap <leader>gdsb :Git diff --staged %<CR>
nnoremap <leader>ga :Git add %<CR>

"" ====================== EXPERIMENTAL. https://github.com/hrsh7th/nvim-cmp/#recommended-configuration
set completeopt=menu,menuone,noselect
