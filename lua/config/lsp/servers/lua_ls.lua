-- Settings for `lua_ls` LSP server.
local settings = {
    Lua = {
        hint = {
            enable = true,
            arrayIndex = "Disable",
        },
        diagnostics = {
            globals = { "vim", "USER_SETTINGS" },
            disable = { "missing-fields" },
        },
        workspace = {
            library = {
                vim.fn.expand("$VIMRUNTIME/lua"),
                vim.fn.stdpath("config") .. "/lua",
            },
            checkThirdParty = false,
        },
        format = {
            enabled = false,
        },
        codeLens = {
            enable = false,
        },
        completion = {
            callSnippet = "Replace",
        },
    },
}

return {
    settings = settings,
}
