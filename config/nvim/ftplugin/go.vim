"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'

"let g:go_fmt_command = "gopls"	 " format with goimports instead of gofmt
"let g:go_gopls_gofumpt=1


"" https://github.com/daixiang0/gci
"" let g:go_fmt_command = "gci print"	 " format with goimports instead of gofmt



"" there is an issue, how to not fold on save? https://github.com/fatih/vim-go/issues/3098
"let g:go_fmt_experimental=1


" Status line types/signatures
"" let g:go_auto_type_info = 1

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
