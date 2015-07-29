set nocompatible
syntax on
set shiftwidth=2
set cindent cinoptions={0,(0,g0
colorscheme evening
set number
match ErrorMsg '[^ ]\s\+$'
set hlsearch

set expandtab
set softtabstop=2

augroup filetype
  au BufRead Makefile              set ft=make noexpandtab
  au BufRead *.make                set ft=make noexpandtab
  au BufRead *.make.in             set ft=make noexpandtab
  au BufRead SConscript            set ft=python
  au BufRead SConstruct            set ft=python
  au BufRead all-cmds.in           set ft=python
  au BufRead *.msgs                set ft=python
  au BufRead *.go                  set ft=go noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
  au BufRead *.java                set ft=java softtabstop=2 shiftwidth=2 tabstop=2
  au BufRead *.dox                 set ft=cpp.doxygen
  au BufRead *.rst                 set noautoindent nocindent
  au BufRead *.xml                 set equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
augroup END

set backspace=indent,eol,start
autocmd FileType python source ~/.vim/python.vim
autocmd FileType python set shiftwidth=4
set list listchars=tab:>·
set autoindent
set fo+=cr
