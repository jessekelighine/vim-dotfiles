#!/usr/bin/zsh

# git submodule add 

### ~/.config/nvim/pack/color/start (colorscheme)
git clone https://github.com/franbach/miramare  color/start/miramare
git clone https://github.com/sainnhe/everforest color/start/everforest

### ~/.config/nvim/pack/main/start
git clone https://github.com/jeetsukumaran/vim-indentwise    main/start/vim-indentwise
git clone https://github.com/michaeljsmith/vim-indent-object main/start/vim-indent-object
git clone https://github.com/tpope/vim-surround              main/start/vim-surround
git clone https://github.com/tpope/vim-commentary            main/start/vim-commentary
git clone https://github.com/tpope/vim-repeat                main/start/vim-repeat
git clone https://github.com/tpope/vim-vinegar               main/start/vim-vinegar
# git clone https://github.com/tpope/vim-fugitive              main/start/vim-fugitive
git clone https://github.com/junegunn/fzf.vim                main/start/fzf.vim
git clone https://github.com/junegunn/vim-peekaboo           main/start/vim-peekaboo
git clone https://github.com/junegunn/vim-easy-align         main/start/vim-easy-align
git clone https://github.com/mbbill/undotree                 main/start/undotree
git clone https://github.com/wellle/targets.vim              main/start/targets.vim
# git clone https://github.com/google/vim-searchindex          main/opt/vim-searchindex

### ~/.config/nvim/pack/lang/start (language support)
git clone --branch stable https://github.com/jalvesaq/Nvim-R lang/start/Nvim-R

# git clone https://github.com/neovim/nvim-lspconfig lang/start/lspconfig
# git clone https://github.com/hrsh7th/nvim-cmp/     lang/start/nvim-cmp
# git clone https://github.com/hrsh7th/cmp-buffer/   lang/start/cmp-buffer
# git clone https://github.com/hrsh7th/cmp-path/     lang/start/cmp-path
# git clone https://github.com/hrsh7th/cmp-nvim-lsp  lang/start/cmp-nvim-lsp
# git clone https://github.com/hrsh7th/vim-vsnip     lang/start/vim-vsnip
# git clone https://github.com/hrsh7th/cmp-vsnip     lang/start/cmp-vsnip
# git clone https://github.com/nvim-treesitter/nvim-treesitter main/start/nvim-treesitter
