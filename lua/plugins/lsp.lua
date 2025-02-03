return {
    -- Default LSP configurations.
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Package manager for LSP servers, DAP servers, linters, and formatters.
            {
                "williamboman/mason.nvim",
                lazy = true,
                event = { "UIEnter" },
                opts = {
                    ui = {
                        border = require("config.user_options").border,
                    },
                },
            },

            -- Interop between Mason.nvim and lsp-config.
            {
                "williamboman/mason-lspconfig.nvim",
                lazy = true,
                dependencies = {
                    "williamboman/mason.nvim",
                    "neovim/nvim-lspconfig",
                },
                opts = {},
            },

            -- LSP progress messages and notifications.
            {
                "j-hui/fidget.nvim",
                lazy = true,
                opts = {
                    progress = {
                        suppress_on_insert = true,
                        ignore_done_already = true,
                        ignore_empty_message = true,
                    },

                    notification = {
                        override_vim_notify = true,
                    },
                },
            },

            -- LSP driven auto completion.
            {
                "Saghen/blink.cmp",
                dependencies = {
                    "echasnovski/mini.icons",
                    "xzbdmw/colorful-menu.nvim",
                },
                version = "*",
                lazy = true,
                opts = {
                    keymap = {
                        preset = "enter",
                    },

                    completion = {
                        accept = {
                            auto_brackets = {
                                enabled = true,
                            },
                        },
                        menu = {
                            border = require("config.user_options").border,
                            draw = {
                                columns = { { "kind_icon" }, { "label", gap = 1 } },
                                components = {
                                    kind_icon = {
                                        ellipsis = false,
                                        text = function(ctx)
                                            local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                            return kind_icon
                                        end,
                                        highlight = function(ctx)
                                            local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                            return hl
                                        end,
                                    },
                                    label = {
                                        text = function(ctx)
                                            return require("colorful-menu").blink_components_text(ctx)
                                        end,
                                        highlight = function(ctx)
                                            return require("colorful-menu").blink_components_highlight(ctx)
                                        end,
                                    },
                                },
                            },
                        },
                        documentation = {
                            auto_show = true,
                            auto_show_delay_ms = 200,
                            window = {
                                border = require("config.user_options").border,
                            },
                        },
                        ghost_text = {
                            enabled = true,
                        },
                        list = {
                            selection = {
                                preselect = false,
                            },
                        },
                    },

                    signature = {
                        enabled = true,
                        window = {
                            border = require("config.user_options").border,
                        },
                    },
                },
            },
        },
        lazy = false,
        event = { "BufReadPre" },
        config = function()
            require("config.lsp")
        end,
    },
}
