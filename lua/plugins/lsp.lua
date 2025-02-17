return {
    -- Default LSP configurations.
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Package manager for LSP servers, DAP servers, linters, and formatters.
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        border = require("config.user_options").border,
                    },
                },
            },

            -- Interop between Mason.nvim and lsp-config.
            {
                "williamboman/mason-lspconfig.nvim",
                dependencies = {
                    "williamboman/mason.nvim",
                    "neovim/nvim-lspconfig",
                },
                opts = {},
            },

            -- LSP progress messages and notifications.
            {
                "j-hui/fidget.nvim",
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
                    "rafamadriz/friendly-snippets",
                },
                version = "*",
                opts = {
                    appearance = {
                        use_nvim_cmp_as_default = true,
                    },
                    keymap = {
                        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                        ["<C-e>"] = { "hide", "fallback" },
                        ["<CR>"] = { "accept", "fallback" },
                        ["<Tab>"] = {
                            function(cmp)
                                return cmp.select_next()
                            end,
                            "snippet_forward",
                            "fallback",
                        },
                        ["<S-Tab>"] = {
                            function(cmp)
                                return cmp.select_prev()
                            end,
                            "snippet_backward",
                            "fallback",
                        },
                        ["<Up>"] = { "select_prev", "fallback" },
                        ["<Down>"] = { "select_next", "fallback" },
                        ["<C-p>"] = { "select_prev", "fallback" },
                        ["<C-n>"] = { "select_next", "fallback" },
                        ["<C-up>"] = { "scroll_documentation_up", "fallback" },
                        ["<C-down>"] = { "scroll_documentation_down", "fallback" },
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
                                treesitter = { "lsp" },
                            },
                        },
                        documentation = {
                            auto_show = true,
                            auto_show_delay_ms = 200,
                            update_delay_ms = 50,
                            treesitter_highlighting = true,
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
                                auto_insert = false,
                            },
                        },
                    },

                    signature = {
                        enabled = true,
                        window = {
                            border = require("config.user_options").border,
                        },
                    },

                    cmdline = {
                        sources = function()
                            local type = vim.fn.getcmdtype()
                            -- Search forward and backward
                            if type == "/" or type == "?" then
                                return { "buffer" }
                            end
                            -- Commands
                            if type == ":" then
                                return { "cmdline" }
                            end
                            return {}
                        end,
                    },

                    sources = {
                        default = { "lsp", "path", "snippets", "buffer" },
                        providers = {
                            lsp = {
                                min_keyword_length = 2,
                                score_offset = 0,
                            },
                            path = {
                                min_keyword_length = 0,
                            },
                            snippets = {
                                min_keyword_length = 2,
                            },
                            buffer = {
                                min_keyword_length = 4,
                                max_items = 5,
                            },
                        },
                    },
                },
            },
        },
        config = function()
            require("config.lsp")
        end,
    },
}
