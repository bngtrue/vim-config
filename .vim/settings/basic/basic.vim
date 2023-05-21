" FUNCTIONS ------------------------------------------------------------ {{{

" }}}

" MAPPINGS ------------------------------------------------------------ {{{

let mapleader = ',' 

" записать в файл на ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>

" закрыть текущий файл
nnoremap <C-c> :wq<CR>
inoremap <C-c> <Esc>:wq<CR>
vnoremap <C-c> <Esc>:wq<CR>

" переключение подсветки при поиске
 nnoremap <leader> :set hlsearch!<RETURN>

" окрыть буфер вертикально или горизонтально
" nnoremap  :vertical split<RETURN>
" nnoremap  :horizontal split<RETURN>

" переход между открытыми буферами
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" }}}

" VIMSCRIPT ------------------------------------------------------------ {{{

" основные
set nocompatible " off совместимость с Vi
filetype on " определение типа файла
filetype plugin on " загрузка и включение плагинов для определённого типа файла
filetype indent on " загрузить файл отступа для определённого типа файла

" файлы
set title " отображение названия файла в заголовке
set nobackup " не делать резервные копии изменённого файла
set nowritebackup " не делать резервные копии
set noswapfile " не использовать файлы подкачки .swp
set viminfo=""
set encoding=utf-8 " кодировка utf-8
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" настройка командной строки
set showcmd " показать командную строку
set showmode " отображение режимов ввода
set cmdheight=3 " высота cmd
set updatetime=300 " увеличить частоту обновлений сообщений
set laststatus=2 " строка состояния будет отображаться всегда
set history=1000 " количество хранимых команд в истории

" поиск по файлу
set incsearch " выделение совпадающих символов при поиске
set ignorecase " игнорировать регистры символов
set smartcase " подстраивает поиск под регистр при поиске
set hlsearch " включить подсветку символов при поиске
set cursorline " положение курсора (строка)
set cursorcolumn " положение курсора (столбец)
set mouse=a
autocmd InsertEnter,InsertLeave * set cursorline! " не подсвечивать положение курсора в режиме insert 

" подсветка, темы (UI)
set syntax=on " подсветка синтаксиса
set background=dark " бэк в чёрный
set t_Co=256 " узкаываем что терминал поддерживает 256 цветов
if has("termguicolors")
	set termguicolors
endif
colorscheme gruvbox " цветова схема gruvbox

" отступы и строки
set number
set numberwidth=4
set tabstop=2 " количество пробелов для символа табуляции
set softtabstop=2 " кол-во пробелов при <BackSpace>
set shiftwidth=2 " кол-во пробелов (между лексеммами)
set smartindent " копирует оступы с предыдущей строки
set smarttab " отступ в начале = shiftwidth
set nowrap " не переносить строки

autocmd BufNewFile * :write " автозапись при создании нового буфера

" }}}
