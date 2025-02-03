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
            on_attach = function(bufnr)
                local _ = require("gitsigns")
                local map = vim.keymap.set

                map("n", "<leader>gp", function()
                    vim.cmd("Gitsigns prev_hunk")
                end, { buffer = bufnr, desc = "Jump to previous hunk" })
                map("n", "<Leader>gn", function()
                    vim.cmd("Gitsigns next_hunk")
                end, { buffer = bufnr, desc = "Jump to next hunk" })
                map("n", "<Leader>gs", function()
                    vim.cmd("Gitsigns preview_hunk")
                end, { buffer = bufnr, desc = "Preview hunk" })
                map("n", "<Leader>gd", function()
                    vim.cmd("Gitsigns diffthis")
                end, { buffer = bufnr, desc = "Diff buffer or selection" })
                map("n", "<Leader>ga", function()
                    vim.cmd("Gitsigns stage_hunk")
                end, { buffer = bufnr, desc = "Stage current hunk" })
                map("n", "<Leader>gr", function()
                    vim.cmd("Gitsigns reset_hunk")
                end, { buffer = bufnr, desc = "Unstage current hunk" })
                map("n", "<Leader>gA", function()
                    vim.cmd("Gitsigns stage_buffer")
                end, { buffer = bufnr, desc = "Stage current buffer" })
                map("n", "<Leader>gR", function()
                    vim.cmd("Gitsigns reset_buffer")
                end, { buffer = bufnr, desc = "Unstage current buffer" })

                local wk = require("which-key")
                wk.add({
                    { "<leader>g", group = "Git", buffer = bufnr },
                })
            end,
        },
    },
}
