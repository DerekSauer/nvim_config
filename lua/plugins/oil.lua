return {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons" },
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            "permissions",
            "size",
        },
        watch_for_changes = true,
        keymaps = {
            ["q"] = { "actions.close", mode = "n" },
            ["<ESC>"] = { "actions.close", mode = "n" },
            ["<BS>"] = { "actions.parent", mode = "n" },
            ["h"] = { "actions.parent", mode = "n" },
            ["l"] = { "actions.select", mode = "n" },
        },
        float = {
            max_width = 0.85,
            max_height = 0.8,
            border = require("config.user_options").border,
            win_options = {
                winblend = require("config.user_options").winblend,
            },
        },
        confirmation = {
            border = require("config.user_options").border,
        },
        progress = {
            border = require("config.user_options").border,
        },
        ssh = {
            border = require("config.user_options").border,
        },
        keymaps_help = {
            border = require("config.user_options").border,
        },
    },
    keys = {
        {
            "<leader>e",
            function()
                require("oil").open_float(nil, { preview = {} })
            end,
            desc = "File explorer",
        },
    },
}
