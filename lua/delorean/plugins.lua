local plugins = {
    {
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        opts = function ()
            return {
                style = "moon"
            }
        end,
        config = function()
            vim.cmd.colorscheme('tokyonight-night')
            vim.cmd("highlight Todo guifg=#EF3A8E guibg=transparent")
        end
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "→", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
            },
        }
    },

    {
        'nvim-lua/plenary.nvim',
        name = "plenary"
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {"plenary"},
        opts = {
            pickers = {
                find_files = {
                    -- theme = "ivy"
                },
                git_files = {
                    -- theme = "ivy"
                },
                git_status = {
                    -- theme = "dropdown"
                },
                grep_string = {
                    -- theme = "dropdown"
                },
                live_grep = {
                    -- theme = "dropdown"
                },
            }
        }
    },

    'mbbill/undotree',

    -- Git integration
    'tpope/vim-fugitive',
    'Xuyuanp/nerdtree-git-plugin',
    'airblade/vim-gitgutter',

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    'jlanzarotta/bufexplorer',

    {
        'scrooloose/nerdcommenter',
        config = function ()
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDCommentEmptyLines = 1
            vim.g.NERDTrimTrailingWhitespace = 1
        end
    },

    {
        'scrooloose/nerdtree',
        config = function ()
            vim.g.NERDTreeMinimalUI = 1
            vim.g.NERDTreeDirArrows = 1
            vim.g.NERDTreeDirArrowExpandable = '│'
            vim.g.NERDTreeDirArrowCollapsible = '→'
            vim.g.NERDTreeGitStatusIndicatorMapCustom = {
                Modified  = "•",
                Staged    = "+",
                Untracked = "*",
                Renamed   = "»",
                Unmerged  = "=",
                Deleted   = "-",
                Dirty     = "✘",
                Clean     = "■",
                Ignored   = '!',
                Unknown   = "?"
            }
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = 'ayu_dark',
            },
        }
    },

    {
        'akinsho/toggleterm.nvim', version = "*", config = true
    },

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    {
        -- "jose-elias-alvarez/null-ls.nvim",
        "nvimtools/none-ls.nvim",
        dependencies = {"plenary"},
        event = "VeryLazy",
    },
}

return plugins
