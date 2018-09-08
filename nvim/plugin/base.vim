" Filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Noisy shit
set noerrorbells
set novisualbell
set fileformats=unix,mac

" Whitespaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set listchars=tab:▸\ ,trail:.,eol:¬
autocmd FileType c,cpp,java,php,python,ruby,coffee,haskell autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType mustache,sass,css,html autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType conf,zsh autocmd BufWritePre <buffer> :%s/\s\+$//e

" Wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.class,.svn,vendor/gems/*

" My opinion
set wrap


