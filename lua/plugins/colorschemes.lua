return {
    -- NeoVim colorschemes inspired by the colors of the famous painting by Katsushika Hokusai.
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        event = {
            "ColorSchemePre",
        },
        opts = {
            dimInactive = true,
        },
    },
}
