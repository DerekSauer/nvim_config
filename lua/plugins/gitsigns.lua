return {
    -- Git integration for buffers.
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = "BufReadPost",
        opts = {
            preview_config = {
                border = require("config.user_options").border,
            },
        },
    },
}
