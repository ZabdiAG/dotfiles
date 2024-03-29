set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

"" From :help provider-python
" PYTHON PROVIDER CONFIGURATION ~
" 						*g:python3_host_prog*
" Command to start Python 3 (executable, not directory). Setting this makes
" startup faster. Useful for working with virtualenvs. Must be set before any
" check for has("python3").  >
let g:python3_host_prog = '/opt/homebrew/bin/python3'
