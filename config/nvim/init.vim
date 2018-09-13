if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'lepture/vim-jinja'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-sleuth'
    Plug 'rstacruz/vim-opinion'
    Plug 'morhetz/gruvbox'
    Plug 'altercation/vim-colors-solarized'
    Plug 'junegunn/seoul256.vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'ayu-theme/ayu-vim'
    Plug 'rakr/vim-two-firewatch'
    Plug 'jbmorgado/vim-pine-script'
    Plug 'aklt/plantuml-syntax'
    Plug 'scrooloose/vim-slumlord'
call plug#end()
