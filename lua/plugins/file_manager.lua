local user_options = require("config.user_options")

return {
    -- Neovim file explorer: edit your filesystem like a buffer.
    {
        "stevearc/oil.nvim",

        dependencies = {
            {
                "echasnovski/mini.icons",
                lazy = true,
                opts = {},
            },
        },

        lazy = true,

        cmd = {
            "Oil",
            "Oil --float",
        },

        keys = {
            {
                "<leader>e",
                function()
                    -- Work around to open oil with preview window already visible.
                    local oil = require("oil")

                    oil.open_float()

                    -- Wait until oil has opened, for a maximum of 1 second.
                    vim.wait(1000, function()
                        return oil.get_cursor_entry() ~= nil
                    end)

                    if oil.get_cursor_entry() then
                        oil.open_preview()
                    end
                end,
                desc = "Open file explorer",
            },
        },

        opts = {
            columns = {
                "icon",
                "size",
                "mtime",
            },

            keymaps = {
                ["<BS>"] = { "actions.parent", mode = "n" },
                ["."] = { "actions.open_cwd", mode = "n" },
                ["q"] = { "actions.close", mode = "n" },
                ["<ESC>"] = { "actions.close", mode = "n" },
            },

            float = {
                max_width = 0.8,
                max_height = 0.8,
                padding = 2,
                border = user_options.border,
                preview_split = "right",
                win_options = {
                    winblend = user_options.winblend,
                },
            },

            preview_win = {
                win_options = {
                    winblend = user_options.winblend,
                },
            },

            confirmation = {
                border = user_options.border,
                win_options = {
                    winblend = math.floor(user_options.winblend / 2),
                },
            },

            progress = {
                border = user_options.border,
                win_options = {
                    winblend = math.floor(user_options.winblend / 2),
                },
            },

            ssh = {
                border = user_options.border,
                win_options = {
                    winblend = math.floor(user_options.winblend / 2),
                },
            },

            keymaps_help = {
                border = user_options.border,
                win_options = {
                    winblend = math.floor(user_options.winblend / 2),
                },
            },
        },
    },
}
