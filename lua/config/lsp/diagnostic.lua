local severity_signs = {
    [vim.diagnostic.severity.ERROR] = "",
    [vim.diagnostic.severity.WARN] = "",
    [vim.diagnostic.severity.HINT] = "",
    [vim.diagnostic.severity.INFO] = "",
}

local diagnostic_config = {
    underline = true,
    update_in_insert = false,
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = function(diagnostic)
            return severity_signs[diagnostic.severity]
        end,
    },
    severity_sort = true,
    signs = {
        text = severity_signs,
    },
}

-- Set global icon and color for diagnostics symbols.
for severity, icon in pairs(diagnostic_config.signs.text) do
    local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

-- Configure the diagnostics system.
vim.diagnostic.config(diagnostic_config)
