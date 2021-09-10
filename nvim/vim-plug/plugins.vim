" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " File Explorer
    Plug 'scrooloose/NERDTree'
    
    " Auto pairs for '(' '[' '{'
    " Plug 'jiangmiao/auto-pairs'

    Plug 'ryanoasis/vim-devicons'
    
    " Themes
    Plug 'dracula/vim',{'as':'dracula'}
    Plug 'romainl/flattened',{'as':'flattened'}
   
    Plug 'rust-lang/rust.vim'
    " Long bois
    source $HOME/.config/nvim/vim-plug/plugins/ale.vim
    source $HOME/.config/nvim/vim-plug/plugins/coc.vim
    source $HOME/.config/nvim/vim-plug/plugins/airline.vim
    source $HOME/.config/nvim/vim-plug/plugins/black.vim
    source $HOME/.config/nvim/vim-plug/plugins/emmet.vim
    source $HOME/.config/nvim/vim-plug/plugins/vimtex.vim
call plug#end()

