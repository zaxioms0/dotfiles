set termguicolors
if &compatible
  set nocompatible
endif

filetype plugin on
source $HOME/.config/nvim/vim-plug/plugins.vim

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/syntax/syntax-source.vim
lua require('lspconfighelper')

source $HOME/.config/nvim/keys/keys.vim
au FileType sml set tw=0
