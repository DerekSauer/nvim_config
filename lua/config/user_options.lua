-- User configurable options for Neovim and Plugins.
local user_options = {
    -- Initial colorscheme to use on load.
    colorscheme = "kanagawa",

    -- Border style to use around windows. Can be the following:
    -- none, single, double, rounded, solid, shadow, array of eight characters.
    -- See nvim_open_win() documentation for more details.
    border = "single",

    -- Number of spaces to use for TAB characters and indents.
    tabstop = 4,

    -- Transparency of popup windows. 0 = fully opaque, 100 = fully transparent.
    winblend = 8,

    -- Tranparency of popup menus.
    pumblend = 10,

    -- Enable/Disable LSP inlay hints by default.
    lsp_inlay_hints = true,
}

return user_options
