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
	Plug 'vim-airline/vim-airline'

	Plug 'junegunn/vim-easy-align'

	Plug 'airblade/vim-gitgutter'

	Plug 'junegunn/fzf.vim'
	Plug 'kevinhwang91/nvim-ufo'
	Plug 'kevinhwang91/promise-async' " Needed by nvim-ufo
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim' , { 'tag': '0.1.8' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	Plug 'nvim-orgmode/orgmode'

	" Code related
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'cespare/vim-toml'
	Plug 'rust-lang/rust.vim'
	Plug 'https://github.com/lifepillar/pgsql.vim'
	Plug 'hashivim/vim-terraform'
	Plug 'cappyzawa/starlark.vim'

	Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
	Plug 'lukas-reineke/headlines.nvim'
	Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)

	"" Smooth scrolling
	"" https://github.com/karb94/neoscroll.nvim
	Plug 'karb94/neoscroll.nvim'

	"" Themes
	Plug 'rebelot/kanagawa.nvim'

	" Experimenting
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()

"" Folding configuration, automatically folds file when open
" https://stackoverflow.com/questions/78077278/treesitter-and-syntax-folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
set foldcolumn=1 		     " Show fold column

" Set fold method to indent on yaml,yml files
autocmd FileType yaml,yml setlocal foldmethod=indent

" lazy load foldmethod=syntax for gitcommit
autocmd FileType gitcommit,git setlocal foldmethod=syntax


" change map keyboard button
let mapleader = " "


"" toggle highlight search
map <leader>hl :set hlsearch!<CR>

"" jq, JSON prettier file
map <leader>jq :%!jq . <CR>

set t_Co=256              " enable 256-color mode.
set number                " show line numbers
set relativenumber

colorscheme kanagawa-wave

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
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype vim setlocal ts=2 sw=2 sts=0 tabstop
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype lua setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype org setlocal ts=2 sw=2 sts=0 expandtab




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

"" Force jsonl highlighting
autocmd BufNewFile,BufRead *.jsonl setlocal ft=json

let g:rust_clip_command = 'pbcopy'
let g:rustfmt_autosave = 1

"" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"" ====================== EXPERIMENTAL. https://github.com/hrsh7th/nvim-cmp/#recommended-configuration
set completeopt=menu,menuone,noselect

" 						*g:perl_host_prog*
" Command to start the Perl executable. Must be set before any
" check for has("perl").  >vim
"     let g:perl_host_prog = '/path/to/perl'
if has('perl')
  let g:perl_host_prog = '/usr/bin/perl'
endif

"" create CopilotToggle function
function! CopilotToggle()
  if g:copilot_enabled == 0
    let g:copilot_enabled = 1
    echo "Copilot enabled"
  else
    let g:copilot_enabled = 0
    echo "Copilot disabled"
  endif
endfunction


"" Copilot disabled by default
let g:copilot_enabled = 0
"" toggle copilot disable|enable with vainilla vim
map <leader>cop :call CopilotToggle()<CR>


"" Insert random uuid generated with uuidgen command in the current cursor position avoiding inserting in a new line and removing the new line character
function! InsertUuid()
  let l:uuid = system('uuidgen')
  let l:uuid = substitute(l:uuid, '\n', '', 'g')
  execute "normal i" . l:uuid
endfunction

"" Insert random uuid with leader key
map <leader>uuid :call InsertUuid()<CR>


"" shortcuts for Location List
nnoremap <leader>ll :lwindow<CR>
nnoremap <leader>lq :lclose<CR>
nnoremap <leader>ll :lnext<CR>
nnoremap <leader>lh :lprevious<CR>

"" shortcuts for Quickfix List
nnoremap <leader>kl :cwindow<CR>
nnoremap <leader>kq :cclose<CR>
nnoremap <leader>kl :cnext<CR>
nnoremap <leader>kh :cprevious<CR>
nnoremap <leader>kf :cfile %<CR>
