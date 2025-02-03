-- Briefly highlight yanked text.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight copied text",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})
