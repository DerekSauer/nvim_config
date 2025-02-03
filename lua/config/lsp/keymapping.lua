local M = {}

function M.lsp_keymap_setup(client, bufnr)
    if client.supports_method("textDocument/declaration") then
        vim.keymap.set("n", "<leader>lD", function()
            vim.lsp.buf.declaration()
        end, { desc = "Goto declaration", buffer = bufnr })
    end

    if client.supports_method("textDocument/definition") then
        vim.keymap.set("n", "<leader>ld", function()
            vim.lsp.buf.definition()
        end, { desc = "Goto definition", buffer = bufnr })
    end

    if client.supports_method("textDocument/typeDefinition") then
        vim.keymap.set("n", "<leader>lo", function()
            vim.lsp.buf.type_definition()
        end, { desc = "Goto type definition", buffer = bufnr })
    end

    if client.supports_method("textDocument/implementation") then
        vim.keymap.set("n", "<leader>li", function()
            vim.lsp.buf.implementation()
        end, { desc = "Goto implementation", buffer = bufnr })
    end

    if client.supports_method("textDocument/references") then
        vim.keymap.set("n", "<leader>lr", function()
            vim.lsp.buf.references()
        end, { desc = "Show type references", buffer = bufnr })
    end

    if client.supports_method("textDocument/documentSymbol") then
        vim.keymap.set("n", "<leader>ls", function()
            vim.lsp.buf.document_symbol()
        end, { desc = "Show document symbols", buffer = bufnr })
    end

    if client.supports_method("workspace/symbol") then
        vim.keymap.set("n", "<leader>lS", function()
            vim.lsp.buf.workspace_symbol()
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
            vim.diagnostic.open_float()
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
        vim.keymap.set("n", "<leader>ly", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Toggle inlay hints", buffer = bufnr })
    end

    local wk = require("which-key")
    wk.add({
        { "<leader>l", group = "LSP", buffer = bufnr },
    })
end

return M
