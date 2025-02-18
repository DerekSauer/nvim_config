local user_options = require("config.user_options")

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Use system clipboards as default yank register.
if vim.fn.has("win32") == 1 or vim.fn.has("mac") then
    vim.opt.clipboard = "unnamed"
else
    vim.opt.clipboard = "unnamedplus"
end

-- Use Powershell on Windows instead of cmd.
if vim.fn.has("win32") == 1 then
    if vim.fn.executable("pwsh") == 1 then
        vim.opt.shell = "pwsh"
    else
        vim.opt.shell = "powershell"
    end

    vim.opt.shellcmdflag =
        "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
    vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
    vim.opt.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end

vim.opt.number = true -- Enable line numbers in the gutter.
vim.opt.relativenumber = true -- Use relative line numbering.
vim.opt.numberwidth = 3 -- Minimum 3 columns in the number line.
vim.opt.showmode = false -- Do not showing editing mode, obvious from cursor.
vim.opt.signcolumn = "yes" -- Force sign column to always be visible.
vim.opt.laststatus = 3 -- Global status bar for all windows.
vim.opt.cmdheight = 0 -- Hide the command line when not in use.
vim.opt.updatetime = 1000 -- Delays after no typing before the CursorHold event is fired.
vim.opt.lazyredraw = true
vim.opt.splitright = true -- Open new vertical windows to the right.
vim.opt.splitbelow = true -- Open new horizontal windows below current windows.

vim.opt.expandtab = true -- Insert spaces when pressing the TAB key.
vim.opt.tabstop = user_options.tabstop -- A TAB character will be displayed as this many spaces.
vim.opt.softtabstop = user_options.tabstop -- Number of spaces to insert in place of a TAB character.
vim.opt.shiftwidth = user_options.tabstop -- Number of spaces to insert when indenting.

vim.opt.wrap = false -- Disable soft line wrapping by default.
vim.opt.breakindent = true -- Enable indenting soft wrapped lines.
vim.opt.breakindentopt = string.format("shift:%s", user_options.tabstop) -- Add additional indent space to soft wrapped lines.
vim.opt.showbreak = "⤷ " -- Characters displayed at the start of soft wrapped lines.
vim.opt.linebreak = true -- Break lines at whitespace when soft wrapping.

vim.opt.scrolloff = 5 -- Minimum number of lines to maintain on screen when scrolling.
vim.opt.sidescrolloff = 5 -- Minimum number of columns to maintain on screen when scrolling.

vim.opt.winblend = user_options.winblend -- Transparency of popup windows.
vim.opt.pumblend = user_options.pumblend -- Transparency of popup menus.

vim.opt.foldenable = false -- Disable folds by default.
vim.opt.foldmethod = "expr" -- Use a function to manage folds.
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use tree sitter parsing to create folds.

vim.opt.ignorecase = true -- Ignore character case when searching.
vim.opt.smartcase = true -- Unless explicitly searching for upper case characters.
vim.opt.hlsearch = true -- Hightlight search results while typing.

-- Disable remote plugin providers.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
