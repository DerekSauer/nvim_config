local map = vim.keymap.set

-- Escape clears search results.
map("n", "<ESC>", "<ESC>:noh<CR>")

-- Leave insert mode when in the terminal.
map("t", "<ESC>", [[<C-\><C-n>]], { desc = "Leave insert mode in terminal" })

-- Cursor remains in place during Visual yank.
map("x", "y", "mmy`m", { desc = "Yank selection" })

-- Buffer controls.
map("n", "<leader><BS>", function()
    vim.cmd("b#")
end, { desc = "Swap to previous buffer" })

map({ "n", "i", "x" }, "<C-s>", function()
    vim.cmd("up")
end, { desc = "Save current buffer" })

map({ "n", "i", "x" }, "<C-S-s>", function()
    vim.cmd("wa")
end, { desc = "Save all buffers" })

-- Window management.
map("n", "<C-h>", "<C-w>h", { desc = "Switch to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch to right window" })

map("n", "<C-Left>", "<C-w>h", { desc = "Switch to left window" })
map("n", "<C-Down>", "<C-w>j", { desc = "Switch to lower window" })
map("n", "<C-Up>", "<C-w>k", { desc = "Switch to upper window" })
map("n", "<C-Right>", "<C-w>l", { desc = "Switch to right window" })

map("n", "<C-S-Left>", function()
    vim.cmd("vertical resize -2")
end, { desc = "Decrease window width" })
map("n", "<C-S-Down>", function()
    vim.cmd("resize -2")
end, { desc = "Decrease window height" })
map("n", "<C-S-Up>", function()
    vim.cmd("resize +2")
end, { desc = "Increase window height" })
map("n", "<C-S-Right>", function()
    vim.cmd("vertical resize +2")
end, { desc = "Increase window width" })

-- Text movements
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down by visible lines" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up by visible lines" })
map({ "n", "x" }, "*", "*N", { desc = "Search for current word or selection" })
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Text editing
map("x", "<", "<gv", { desc = "Indent selection left" })
map("x", ">", ">gv|", { desc = "Indent selection right" })
map("x", "<S-Tab>", "<gv", { desc = "Indent selection left" })
map("x", "<Tab>", ">gv|", { desc = "Indent selection right" })
