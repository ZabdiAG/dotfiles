let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1


au FileType go map <leader>got :GoTest<CR>
au FileType go map <leader>gotf :GoTestFunc<CR>

au FileType go map <leader>godt :GoDebugTest<CR>
au FileType go map <leader>godtf :GoDebugTestFunc<CR>
au FileType go map <leader>godb :GoDebugBreakpoint<CR>
au FileType go map <leader>godc :GoDebugContinue<CR>
au FileType go map <leader>godn :GoDebugNext<CR>
au FileType go map <leader>gods :GoDebugStop<CR>

au FileType go map <leader>goi :GoImplements<CR>
au FileType go map <leader>gor :GoReferrers<CR>
au Filetype go map <leader>goc :GoCoverageToggle<CR>
au Filetype go map <leader>gocb :GoCoverageBrowser<CR>


au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au Filetype go map <leader>ts :normal i time.Sleep(time.Minute*10<CR>


" when cursor is inside brackets or parenthesis, and hit return key, it will insert a new
" line and indent it, move closing bracket to the next line
au FileType go inoremap <expr> <CR> getline('.') =~# '^\s*}' ? "\<C-o>O" : "\<CR>"
