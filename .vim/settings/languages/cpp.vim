" FUNCTIONS ------------------------------------------------------------ {{{

" функция GoogleCPPIndent позаимствована из репозитория https://github.com/vim-scripts/google.vim/blob/master/indent/google.vim
function! GoogleCppIndent()
    let l:cline_num = line('.')

    let l:orig_indent = cindent(l:cline_num)

    if l:orig_indent == 0 | return 0 | endif

    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    if l:pline =~# '^\s*template' | return l:pline_indent | endif

    if l:orig_indent != &shiftwidth | return l:orig_indent | endif

    let l:in_comment = 0
    let l:pline_num = prevnonblank(l:cline_num - 1)
    while l:pline_num > -1
        let l:pline = getline(l:pline_num)
        let l:pline_indent = indent(l:pline_num)

        if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
            let l:in_comment = 1
        elseif l:in_comment == 1
            if l:pline =~ '/\*\(.\{-}\*/\)\@!'
                let l:in_comment = 0
            endif
        elseif l:pline_indent == 0
            if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
                if l:pline =~# '^\s*namespace.*'
                    return 0
                else
                    return l:orig_indent
                endif
            elseif l:pline =~# '\\$'
                return l:orig_indent
            endif
        else
            return l:orig_indent
        endif

        let l:pline_num = prevnonblank(l:pline_num - 1)
    endwhile

    return l:orig_indent
endfunction

" }}}


" MAPPINGS ------------------------------------------------------------ {{{

" }}}


" VIMSCRIPT ------------------------------------------------------------ {{{

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set textwidth=80
set colorcolumn=81
highlight ColorColumn ctermbg=darkgray
set wrap
set cindent
setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
setlocal indentexpr=GoogleCppIndent()
let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

" }}}
