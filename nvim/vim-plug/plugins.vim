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
    Plug 'jiangmiao/auto-pairs'

    "Status
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='dracula'
    let g:airline#extensions#ale#enabled = 1
    
    
    " Themes
    Plug 'dracula/vim',{'as':'dracula'}
    Plug 'romainl/flattened',{'as':'flattened'}
    
    " Long bois
    source $HOME/.config/nvim/vim-plug/plugins/ale.vim
    source $HOME/.config/nvim/vim-plug/plugins/coc.vim

    call plug#end()

