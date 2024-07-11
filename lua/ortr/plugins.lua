vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- installation of plugins

    --colorscheme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- file tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        }
    }

    -- terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}

    -- dropbar
    use({
        'Bekaboo/dropbar.nvim',
        requires = {
          'nvim-telescope/telescope-fzf-native.nvim'
        }
    })
    -- trailing spaces
    use {'jdhao/whitespace.nvim', event = 'VimEnter'}

    use {
        "kwkarlwang/bufjump.nvim",
        config = function()
            require("bufjump").setup({
                forward_key = "<leader>gf",
                backward_key ="<leader>gb",
                on_success = nil,
            })
        end
    }
    
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
        --- Uncomment these if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'}
        }
    }
    use {'vim-airline/vim-airline'}
    use {'lambdalisue/battery.vim'}
    use {'nvim-telescope/telescope.nvim', tag = '0.1.5',
      requires = {
        {'nvim-lua/plenary.nvim'}
      }
    }
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {
        'jbyuki/instant.nvim'
    }
end)
