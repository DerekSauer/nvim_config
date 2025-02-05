local M = {}

function M.lsp_keymap_setup(client, bufnr)
    if client.supports_method("textDocument/declaration") then
        vim.keymap.set("n", "<leader>lD", function()
            Snacks.picker.lsp_declarations()
        end, { desc = "Goto declaration", buffer = bufnr })
    end

    if client.supports_method("textDocument/definition") then
        vim.keymap.set("n", "<leader>ld", function()
            Snacks.picker.lsp_definitions()
        end, { desc = "Goto definition", buffer = bufnr })
    end

    if client.supports_method("textDocument/typeDefinition") then
        vim.keymap.set("n", "<leader>lo", function()
            Snacks.picker.lsp_type_definitions()
        end, { desc = "Goto type definition", buffer = bufnr })
    end

    if client.supports_method("textDocument/implementation") then
        vim.keymap.set("n", "<leader>li", function()
            Snacks.picker.lsp_implementations()
        end, { desc = "Goto implementation", buffer = bufnr })
    end

    if client.supports_method("textDocument/references") then
        vim.keymap.set("n", "<leader>lr", function()
            Snacks.picker.lsp_references()
        end, { desc = "Show type references", buffer = bufnr })
    end

    if client.supports_method("textDocument/documentSymbol") then
        vim.keymap.set("n", "<leader>ls", function()
            Snacks.picker.lsp_symbols()
        end, { desc = "Show document symbols", buffer = bufnr })
    end

    if client.supports_method("workspace/symbol") then
        vim.keymap.set("n", "<leader>lS", function()
            Snacks.picker.lsp_workspace_symbols()
        end, { desc = "Show workspace symbols", buffer = bufnr })
    end

    if client.supports_method("textDocument/diagnostic") then
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_prev()
        end, { desc = "Goto previous diagnostic", buffer = bufnr })

        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_next()
        end, { desc = "Goto next diagnostic", buffer = bufnr })

        vim.keymap.set("n", "<leader>ll", function()
            Snacks.picker.diagnostics()
        end, { desc = "Show diagnostic window", buffer = bufnr })

        vim.keymap.set("n", "<leader>lq", function()
            vim.diagnostic.setloclist()
        end, { desc = "Show diagnostic list", buffer = bufnr })
    end

    if client.supports_method("textDocument/prepareCallHierarchy") then
        vim.keymap.set("n", "<leader>lI", function()
            vim.lsp.buf.incoming_calls()
        end, { desc = "Show incoming calls", buffer = bufnr })

        vim.keymap.set("n", "<leader>lO", function()
            vim.lsp.buf.outgoing_calls()
        end, { desc = "Show outgoing calls", buffer = bufnr })
    end

    if client.supports_method("textDocument/hover") then
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, { desc = "Show documentation", buffer = bufnr })

        vim.keymap.set("n", "<leader>lk", function()
            vim.lsp.buf.hover()
        end, { desc = "Show documentation", buffer = bufnr })
    end

    if client.supports_method("textDocument/rename") then
        vim.keymap.set("n", "<leader>lR", function()
            vim.lsp.buf.rename()
        end, { desc = "Rename symbol", buffer = bufnr })

        vim.keymap.set("n", "<F2>", function()
            vim.lsp.buf.rename()
        end, { desc = "Rename symbol", buffer = bufnr })
    end

    if client.supports_method("textDocument/codeAction") then
        vim.keymap.set("n", "<leader>la", function()
            vim.lsp.buf.code_action()
        end, { desc = "Show code actions", buffer = bufnr })

        vim.keymap.set("n", "<F4>", function()
            vim.lsp.buf.code_action()
        end, { desc = "Show code actions", buffer = bufnr })
    end

    if client.supports_method("textDocument/signatureHelp") then
        vim.keymap.set("n", "<leader>lh", function()
            vim.lsp.buf.signature_help()
        end, { desc = "Show signature help", buffer = bufnr })
    end

    if client.supports_method("textDocument/inlayHint") then
        Snacks.toggle.inlay_hints():map("<leader>ly")
    end

    local wk = require("which-key")
    wk.add({
        { "<leader>l", group = "LSP", buffer = bufnr },
    })
end

return M
