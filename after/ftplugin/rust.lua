local bufnr = vim.api.nvim_get_current_buf()
local wk = require("which-key")

wk.add({ "<leader>r", group = "Rust", buffer = bufnr })

vim.keymap.set("n", "<leader>ra", function()
    vim.cmd.RustLsp("codeAction")
end, { desc = "Code actions", buffer = bufnr })

vim.keymap.set("n", "<leader>rb", function()
    vim.cmd.RustLsp("debug")
end, { desc = "Debug", buffer = bufnr })

vim.keymap.set("n", "<leader>rB", function()
    vim.cmd.RustLsp("debuggables")
end, { desc = "List debug targets", buffer = bufnr })

vim.keymap.set("n", "<leader>rr", function()
    vim.cmd.RustLsp("run")
end, { desc = "Run", buffer = bufnr })

vim.keymap.set("n", "<leader>rR", function()
    vim.cmd.RustLsp("runnables")
end, { desc = "List runnables", buffer = bufnr })

vim.keymap.set("n", "<leader>rt", function()
    vim.cmd.RustLsp("testables")
end, { desc = "List tests", buffer = bufnr })

vim.keymap.set("n", "<leader>rT", function()
    vim.cmd.RustLsp({ "testables", bang = true })
end, { desc = "Rerun last tests", buffer = bufnr })

vim.keymap.set("n", "<leader>rm", function()
    vim.cmd.RustLsp("expandMacro")
end, { desc = "Expand macro", buffer = bufnr })

vim.keymap.set("n", "<leader>rM", function()
    vim.cmd.RustLsp("rebuildProcMacros")
end, { desc = "Rebuild proc macros", buffer = bufnr })

vim.keymap.set("n", "<leader>re", function()
    vim.cmd.RustLsp("explainError")
end, { desc = "Explain error", buffer = bufnr })

vim.keymap.set("n", "<leader>rE", function()
    vim.cmd.RustLsp({ "explainError", "cycle" })
end, { desc = "Next error", buffer = bufnr })

vim.keymap.set("n", "<leader>rd", function()
    vim.cmd.RustLsp("renderDiagnostic")
end, { desc = "Show diagnostic", buffer = bufnr })

vim.keymap.set("n", "<leader>rD", function()
    vim.cmd.RustLsp({ "renderDiagnostic", "cycle" })
end, { desc = "Next diagnostic", buffer = bufnr })

vim.keymap.set("n", "<leader>r<C-d>", function()
    vim.cmd.RustLsp("relatedDiagnostics")
end, { desc = "Jump to related diagnostics", buffer = bufnr })

vim.keymap.set("n", "<leader>rc", function()
    vim.cmd.RustLsp("openCargo")
end, { desc = "Open Cargo.toml", buffer = bufnr })

vim.keymap.set("n", "<leader>rk", function()
    vim.cmd.RustLsp("openDocs")
end, { desc = "Show documentation", buffer = bufnr })

vim.keymap.set("n", "<leader>rp", function()
    vim.cmd.RustLsp("parentModule")
end, { desc = "Jump to parent module", buffer = bufnr })
