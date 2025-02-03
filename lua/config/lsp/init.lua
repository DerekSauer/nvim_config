local lsp = require("lspconfig")
local _ = require("mason")
local mason_lsp = require("mason-lspconfig")

-- Configure diagnostic information system.
require("config.lsp.diagnostic")

-- Merge user settings with default LSP settings.
local function make_config(server_name)
    local server_config_path = "config.lsp.servers."
    local merged_config = require("config.lsp.default")

    local server_exists, user_config = pcall(require, server_config_path .. server_name)
    if server_exists then
        merged_config = vim.tbl_deep_extend("force", merged_config, user_config)
    end

    return merged_config
end

-- Configure each installed server, override with user settings if needed.
for _, server_name in pairs(mason_lsp.get_installed_servers()) do
    local opts = make_config(server_name)
    lsp[server_name].setup(opts)
end
