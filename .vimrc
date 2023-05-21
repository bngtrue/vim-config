" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

" nerdtree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" autocomplete 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" themes
Plug 'morhetz/gruvbox'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

"
"Plug 'tpope/vim-dispatch' 

call plug#end()

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" код ниже позволяет сворачивать код используя марекрный метод складывания
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" базовые настройки vim
source ~/.vim/settings/plugins/gruvbox.vim
source ~/.vim/settings/basic/basic.vim
source ~/.vim/settings/plugins/coc.vim
source ~/.vim/settings/plugins/nerdtree.vim

" настройки для написания кода на c++

if(&ft=='c' || &ft=='cpp' || &ft=='h' || &ft=='hpp')
	source ~/.vim/settings/languages/cpp.vim
endif

" }}}
