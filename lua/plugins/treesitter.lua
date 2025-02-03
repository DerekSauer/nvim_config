return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = function()
            vim.cmd("TSUpdate")
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "vim", "vimdoc", "lua" },
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                indent = {
                    enable = true,
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Cr>",
                        node_incremental = "<Cr>",
                        node_decremental = "<Bs>",
                        scope_incremental = false,
                    },
                },
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = true,
        event = "BufReadPre",
        config = function()
            require("treesitter-context").setup({ mode = "cursor", max_lines = 3 })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = true,
        event = "InsertEnter",
        config = true,
    },
    {
        "windwp/nvim-autopairs",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = true,
        event = "InsertEnter",
        config = true,
    },
}
