require("config.neovim_options")

require("config.auto_commands")

require("config.keymapping")

require("config.package_manager")

-- Attempt to set the user's default colorscheme, falling back to Neovim's default
local ok, _ = pcall(vim.cmd.colorscheme, require("config.user_options").colorscheme)
if not ok then
    vim.cmd.colorscheme("default")
end
