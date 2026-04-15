vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


   --installation of plugins
    use({'tpope/vim-commentary'})

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require('nvim-treesitter.configs').setup({
                -- Список языков для автоматической установки
                ensure_installed = { "cpp", "c", "lua", "vim", "vimdoc" },

                -- Автоматическая установка отсутствующих парсеров при входе в буфер
                auto_install = true,

                highlight = {
                    enable = true, -- Включает умную подсветку
                    additional_vim_regex_highlighting = false,
                },
            })
        end
    }

    --colorscheme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    use ({'yamatsum/nvim-cursorline'})
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

    use {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300

            require("which-key").setup({
              -- your configuration comes here
            })

            vim.keymap.set("n", "<leader>mr", function()
              require("which-key").show({ global = false })
            end, { desc = "Buffer Local Keymaps (which-key)" })
        end
    }

    -- Shows marks on the left
    use {
      "chentoast/marks.nvim",
      event = "BufReadPost",
      config = function()
        require("marks").setup({
        })
      end
    }

    -- Trouble: Удобный список ошибок, предупреждений и LSP-символов
    -- Позволяет не искать красные подчеркивания по всему файлу, а видеть их в одном окне.
    use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup({
          auto_close = false, -- Панель не закрывается сама, когда ты исправил последнюю ошибку
          restore = true,     -- При повторном открытии запоминает, где был курсор и какие папки открыты
          opts = {},          -- Использовать стандартные настройки (v3)
        })

        -- Подсказка по биндам (лучше продублировать их в файл с keymaps):
        -- <leader>xx - Открыть список всех ошибок в проекте
        -- <leader>xb - Ошибки только в текущем буфере
        -- <leader>xs - Список функций и переменных (Symbols) сбоку
      end
    }

    -- gitsigns подсветка добавленного
    use {
      'lewis6991/gitsigns.nvim',
      config = function() require('gitsigns').setup() end
    }

    -- TODO: comments
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function() require("todo-comments").setup {} end
    }

    -- Разноцветные скобачьки
    use 'hiphish/rainbow-delimiters.nvim'

    -- Покажет в какой функции я сейчас нахожусь
    use { 'nvim-treesitter/nvim-treesitter-context' }

    -- Аргументы
    use {
      "ray-x/lsp_signature.nvim",
      config = function() require'lsp_signature'.setup() end
    }

    -- Better clangd
    use "p00f/clangd_extensions.nvim"
end)
