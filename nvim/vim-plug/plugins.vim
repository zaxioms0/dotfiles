call plug#begin()

    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'morhetz/gruvbox'   
    Plug 'ryanoasis/vim-devicons'

    Plug 'itchyny/lightline.vim'
    Plug 'shinchu/lightline-gruvbox.vim'

    let g:lightline = {}
    let g:lightline.colorscheme = 'dracula' "gruvbox/dracula

    source /home/zaxioms/.config/nvim/vim-plug/plugins/sml.vim
    source /home/zaxioms/.config/nvim/vim-plug/plugins/lean.vim
    source /home/zaxioms/.config/nvim/vim-plug/plugins/vimtex.vim
    source /home/zaxioms/.config/nvim/vim-plug/plugins/lspconfig.vim
call plug#end()
