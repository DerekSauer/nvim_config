-- Default configuration for LSP servers.
local M = {}

function M.on_attach(client, bufnr)
    local user_options = require("config.user_options")

    -- Enable range formatting.
    vim.api.nvim_set_option_value("formatexpr", "v:lua.vim.lsp.formatexpr()", { buf = bufnr })

    -- Enable parsing workspace diagnostics.
    local ok, wd = pcall(require, "workspace-diagnostics")
    if ok then
        wd.populate_workspace_diagnostics(client, bufnr)
    end

    -- Enable inlay hints.
    if user_options.lsp_inlays_hints then
        if client.supports_method("textDocument/inlayHint") then
            if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buftype == "" then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
        end
    end

    -- Setup keymaps for supported LSP functions.
    require("config.lsp.keymapping").lsp_keymap_setup(client, bufnr)
end

M.autostart = true

M.single_file_support = true

M.flags = { debounce_text_changes = 150 }

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("blink.cmp").get_lsp_capabilities(M.capabilities)

return M
