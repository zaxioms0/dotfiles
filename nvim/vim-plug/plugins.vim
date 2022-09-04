call plug#begin()

    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'morhetz/gruvbox'   
    Plug 'ryanoasis/vim-devicons'

    Plug 'rust-lang/rust.vim'

    Plug 'itchyny/lightline.vim'
    Plug 'shinchu/lightline-gruvbox.vim'
    Plug 'jackguo380/vim-lsp-cxx-highlight'

    let g:lightline = {}
    let g:lightline.colorscheme = 'dracula' "gruvbox/dracula

    source /home/z/.config/nvim/vim-plug/plugins/sml.vim
    source /home/z/.config/nvim/vim-plug/plugins/lean.vim
    source /home/z/.config/nvim/vim-plug/plugins/vimtex.vim

    source /home/z/.config/nvim/vim-plug/plugins/trouble.vim
    source /home/z/.config/nvim/vim-plug/plugins/lspconfig.vim 
    source /home/z/.config/nvim/vim-plug/plugins/telescope.vim
call plug#end()
