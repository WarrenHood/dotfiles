-- Ensure packer in installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Actual plugins

local use = require("packer").use

require("packer").startup(function()
    -- Packer package manager
    use("wbthomason/packer.nvim")

    -- OneDark color scheme
    use("navarasu/onedark.nvim")

    -- LSP Stuff
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })

    -- Autocomplete
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter")


    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- nvim-tree (File Explorer)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- file icons
        },
        tag = 'nightly'
    }

    -- ToggleTerm
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    -- Which key for command suggestions
    use {
        "folke/which-key.nvim",
    }

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Show indent guides
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    }

    -- lualine statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("lualine").setup {

            }
        end
    }

    -- Test runner Stuff
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
        },
        config = function()
            require('neotest').setup {
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                },
            }
        end

    }

    -- Log file syntax highlighting
    use('mtdl9/vim-log-highlighting')

    -- Debugging
    use('mfussenegger/nvim-dap') -- Main debugging plugin
    use {
        'rcarriga/nvim-dap-ui',
        requires = { "mfussenegger/nvim-dap" },
        config = function()
            require('dapui').setup()
        end
    } -- Better debugging UI

    use {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require("nvim-dap-virtual-text").setup()
        end
    } -- Virtual text for nvim-dap

    -- Tab
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
    }


    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
        require("packer").sync()
    end
end)
