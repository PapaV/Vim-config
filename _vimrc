set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set helplang=ru

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" настраиваю для работы с русскими словами (чтобы w, b, * понимали
" русские слова)
set iskeyword=@,48-57,_,192-255

" Настроим кол-во символов пробелов, которые будут заменять \t
set tabstop=2
set shiftwidth=2
set smarttab
set et " включим автозамену \t в \s по умолчанию

set ai " включим автоотступы для новых строк
set cin " включим отступы в стиле Си

" Далее настроим поиск и подсветку результатов поиска и совпадения скобок
set showmatch
set hlsearch
set incsearch
set smartcase

set lz " ленивая перерисовка экрана при выполнении скриптов

if has('gui')
colorscheme PapaV
if has('win32')
set guifont=Lucida_Console:h10:cRUSSIAN::
endif
endif

" Пытаемся занять максимально большое пространство на экране. Как водится, по-разному на разных системах
if has('gui')
if has('win32')
" раскомментить для отключения полного экрана под виндой
" let g:loaded_maximize=1
elseif has('gui_gtk2')
au GUIEnter * :set lines=9999 columns=9999
endif
endif

syntax on

set number

:set guioptions-=T

set backspace=indent,eol,start " что бы нажатие клавиши Backspace и через конец строки и отступы.
set wrapmargin=5 " отступ от правой границы окна, где надо начинать перенос. Удобнее textwidth, если размеры окна изменяются.

" в vim используется для изменения регистра текущего символа. Строго говоря, эта операция нарушает 
" идеологию vi о том, что для каждой операции можно добавлять movement. Эта опция включает такую возможность, 
" теперь, например, "~W" изменит регистр до конца слова.
set tildeop "~"x
set scrolloff=3 " сколько строк вверху и внизу экрана показывать при скроллинге. Очень удобно.

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line

" No annoying error noises
set noerrorbells
set visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Speed up macros
set lazyredraw

" Show us the command we're typing
set showcmd

" Wrap on these
set whichwrap+=<,>,[,]

" Use the cool tab complete menu
set wildmenu
set wildignore=*.o,*~

