" FUNCTIONS --------------------------------------------------------------- {{{

" проверяет есть ли backspace перед курсором 
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" отображает документацию в новом окне
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" навигация по коду
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" использовать <TAB> для перемещения к следующему элементу в списке
" или же если нету перед курсором backspace вставить отступ <TAB> 
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" использовать сочетание shift+<TAB> для перемещения к предыдущему элементу
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Сделайте <CR>, чтобы принять выбранный элемент завершения, или уведомите coc.nvim о форматировании
" <Cg> вы прерываете текущую отмену, пожалуйста, сделайте свой собственный выбор
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Используйте K, чтобы показать документацию в окне предварительного просмотра
nnoremap <silent> K :call ShowDocumentation()<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" }}}
