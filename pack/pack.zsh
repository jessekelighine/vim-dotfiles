#!/usr/bin/zsh

# git rm <path-to-submodule>
# git submodule add 

### ~/.config/nvim/pack/color/start (colorscheme)
git submodule add https://github.com/franbach/miramare  color/start/miramare
git submodule add https://github.com/sainnhe/everforest color/start/everforest

### ~/.config/nvim/pack/main/start
git submodule add https://github.com/jeetsukumaran/vim-indentwise    main/start/vim-indentwise
git submodule add https://github.com/michaeljsmith/vim-indent-object main/start/vim-indent-object
git submodule add https://github.com/wellle/targets.vim              main/start/targets.vim
git submodule add https://github.com/tpope/vim-surround              main/start/vim-surround
git submodule add https://github.com/tpope/vim-commentary            main/start/vim-commentary
git submodule add https://github.com/tpope/vim-repeat                main/start/vim-repeat
git submodule add https://github.com/tpope/vim-vinegar               main/start/vim-vinegar
# git submodule add https://github.com/tpope/vim-fugitive              main/start/vim-fugitive
git submodule add https://github.com/junegunn/fzf.vim                main/start/fzf.vim
git submodule add https://github.com/junegunn/vim-easy-align         main/start/vim-easy-align
# git submodule add https://github.com/junegunn/vim-peekaboo           main/start/vim-peekaboo
# git submodule add https://github.com/mbbill/undotree                 main/start/undotree
# git submodule add https://github.com/google/vim-searchindex          main/opt/vim-searchindex

### ~/.config/nvim/pack/lang/start (language support)
git submodule add --branch stable https://github.com/jalvesaq/Nvim-R lang/start/Nvim-R

# git submodule add https://github.com/neovim/nvim-lspconfig lang/start/lspconfig
# git submodule add https://github.com/hrsh7th/nvim-cmp/     lang/start/nvim-cmp
# git submodule add https://github.com/hrsh7th/cmp-buffer/   lang/start/cmp-buffer
# git submodule add https://github.com/hrsh7th/cmp-path/     lang/start/cmp-path
# git submodule add https://github.com/hrsh7th/cmp-nvim-lsp  lang/start/cmp-nvim-lsp
# git submodule add https://github.com/hrsh7th/vim-vsnip     lang/start/vim-vsnip
# git submodule add https://github.com/hrsh7th/cmp-vsnip     lang/start/cmp-vsnip
# git submodule add https://github.com/nvim-treesitter/nvim-treesitter main/start/nvim-treesitter
