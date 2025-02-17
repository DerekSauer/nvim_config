return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<leader>dD",
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "Breakpoint Condition",
            },
            {
                "<leader>dd",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Toggle Breakpoint",
            },
            {
                "<leader>dc",
                function()
                    require("dap").continue()
                end,
                desc = "Run/Continue",
            },
            {
                "<leader>dC",
                function()
                    require("dap").run_to_cursor()
                end,
                desc = "Run to Cursor",
            },
            {
                "<leader>dg",
                function()
                    require("dap").goto_()
                end,
                desc = "Go to Line (No Execute)",
            },
            {
                "<leader>di",
                function()
                    require("dap").step_into()
                end,
                desc = "Step Into",
            },
            {
                "<leader>dj",
                function()
                    require("dap").down()
                end,
                desc = "Down",
            },
            {
                "<leader>dk",
                function()
                    require("dap").up()
                end,
                desc = "Up",
            },
            {
                "<leader>dl",
                function()
                    require("dap").run_last()
                end,
                desc = "Run Last",
            },
            {
                "<leader>do",
                function()
                    require("dap").step_out()
                end,
                desc = "Step Out",
            },
            {
                "<leader>dO",
                function()
                    require("dap").step_over()
                end,
                desc = "Step Over",
            },
            {
                "<leader>dP",
                function()
                    require("dap").pause()
                end,
                desc = "Pause",
            },
            {
                "<leader>dr",
                function()
                    require("dap").repl.toggle()
                end,
                desc = "Toggle REPL",
            },
            {
                "<leader>ds",
                function()
                    require("dap").session()
                end,
                desc = "Session",
            },
            {
                "<leader>dt",
                function()
                    require("dap").terminate()
                end,
                desc = "Terminate",
            },
            {
                "<leader>dw",
                function()
                    require("dap.ui.widgets").hover()
                end,
                desc = "Widgets",
            },
        },
        init = function()
            local wk = require("which-key")
            wk.add({ "<leader>d", group = "Debugging" })
        end,
        config = function()
            local dap = require("dap")

            vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
            vim.fn.sign_define("DapBreakpoint", { text = "" })
            vim.fn.sign_define("DapBreakpointCondition", { text = "" })
            vim.fn.sign_define("DapBreakpointRejected", { text = "" })
            vim.fn.sign_define("DapLogPoint", { text = "" })
            vim.fn.sign_define("DapStopped", { text = "" })

            if not dap.adapters then
                dap.adapaters = {}
            end

            dap.adapters.codelldb = {
                type = "executable",
                command = "codelldb",
            }

            -- Alias `lldb` to `codelldb` so existing .vscode/launch.json configurations function.
            dap.adapters.lldb = {
                type = "executable",
                command = "codelldb",
            }

            -- Probe-rs requires additional configuration.
            dap.adapters["probe-rs-debug"] = {
                type = "server",
                port = "${port}",
                executable = {
                    command = vim.fn.expand("$HOME/.cargo/bin/probe-rs"),
                    args = { "dap-server", "--port", "${port}" },
                },
            }

            -- Associate `probe-rs` with Rust files.
            require("dap.ext.vscode").type_to_filetypes["probe-rs-debug"] = { "rust" }

            -- Set up of handlers for RTT and probe-rs messages.
            -- If RTT is enabled, probe-rs sends an event after init of a channel.
            -- This has to be confirmed or otherwise probe-rs wont sent the rtt data.
            dap.listeners.before["event_probe-rs-rtt-channel-config"]["plugins.nvim-dap-probe-rs"] = function(
                session,
                body
            )
                local utils = require("dap.utils")
                utils.notify(
                    string.format(
                        'probe-rs: Opening RTT channel %d with name "%s"!',
                        body.channelNumber,
                        body.channelName
                    )
                )
                local file = io.open("probe-rs.log", "a")
                if file then
                    file:write(
                        string.format(
                            '%s: Opening RTT channel %d with name "%s"!\n',
                            os.date("%Y-%m-%d-T%H:%M:%S"),
                            body.channelNumber,
                            body.channelName
                        )
                    )
                end
                if file then
                    file:close()
                end
                session:request("rttWindowOpened", { body.channelNumber, true })
            end

            -- After confirming RTT window is open, we will get rtt-data-events.
            dap.listeners.before["event_probe-rs-rtt-data"]["plugins.nvim-dap-probe-rs"] = function(_, body)
                local message = string.format(
                    "%s: RTT-Channel %d - Message: %s",
                    os.date("%Y-%m-%d-T%H:%M:%S"),
                    body.channelNumber,
                    body.data
                )
                local repl = require("dap.repl")
                repl.append(message)
                local file = io.open("probe-rs.log", "a")
                if file then
                    file:write(message)
                end
                if file then
                    file:close()
                end
            end

            -- Probe-rs can send messages, which are handled with this listener.
            dap.listeners.before["event_probe-rs-show-message"]["plugins.nvim-dap-probe-rs"] = function(_, body)
                local message = string.format("%s: probe-rs message: %s", os.date("%Y-%m-%d-T%H:%M:%S"), body.message)
                local repl = require("dap.repl")
                repl.append(message)
                local file = io.open("probe-rs.log", "a")
                if file then
                    file:write(message)
                end
                if file then
                    file:close()
                end
            end
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        opts = {},
        keys = {
            {
                "<leader>du",
                function()
                    require("dapui").toggle({})
                end,
                desc = "Toggle debug UI",
            },
            {
                "<leader>de",
                function()
                    require("dapui").eval()
                end,
                desc = "Debug Eval",
                mode = { "n", "v" },
            },
        },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup(opts)
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}
