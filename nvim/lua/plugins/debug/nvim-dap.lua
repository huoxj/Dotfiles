-- breakpoint symbols
local dap_breakpoint = {
    breakpoint = {
        text = "",
        texthl = "LspDiagnosticsSignError",
        linehl = "",
        numhl = "",
    },
    rejected = {
        text = "",
        texthl = "LspDiagnosticsSignHint",
        linehl = "",
        numhl = "",
    },
    stopped = {
        text = "",
        texthl = "LspDiagnosticsSignInformation",
        linehl = "DiagnosticUnderlineInfo",
        numhl = "LspDiagnosticsSignInformation",
    },
}

return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        keys = {
            -- add a keymap to browshttps://github.com/cmu-db/bustub.gite plhttps://github.com/cmu-db/bustub.gitugin files
            -- stylua: ignore
            {
                "<leader>dc",
                function() require("dap").continue() end,
                desc = "Dap: launch/continue gdb",
            },
            {
                "<leader>ds",
                function()
                    require("dap").step_over()
                end,
                desc = "Dap: step over",
            },
            {
                "<leader>dS",
                function()
                    require("dap").step_into()
                end,
                desc = "Dap: step in",
            },
            {
                "<leader>d<c-s>",
                function()
                    require("dap").step_out()
                end,
                desc = "Dap: step out",
            },
            {
                "<leader>dq",
                function ()
                    require("dap").terminate()
                end,
                desc = "Dap: terminate process"
            },
            {
                "<leader>db",
                function ()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Dap: toggle breakpoint"
            }
        },
        config = function()
            local dap = require("dap")
            local gdbpath = "/usr/local/bin/gdb"
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
            }
            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                    gdbpath = function()
                        return gdbpath
                    end,
                },
                {
                    name = "Select and attach to process",
                    type = "gdb",
                    request = "attach",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    pid = function()
                        local name = vim.fn.input('Executable name (filter): ')
                        return require("dap.utils").pick_process({ filter = name })
                    end,
                    cwd = '${workspaceFolder}',
                    gdbpath = function()
                        return gdbpath
                    end,
                },
                {
                    name = 'Attach to gdbserver :1234',
                    type = 'gdb',
                    request = 'attach',
                    target = 'localhost:1234',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    gdbpath = function()
                        return gdbpath
                    end,
                },
            }
            dap.configurations.c = dap.configurations.cpp;
            -- dap.configurations.c = {
                --     name = "Launch file",
                --     type = "gdb",
                --     request = "launch",
                --     gdbpath = function()
                    --         return "/usr/local/bin/gdb"
                    --     end,
                    --     cwd = "${workspaceFolder}",
                    -- }
                    vim.fn.sign_define("DapBreakpoint", dap_breakpoint.breakpoint)
                    vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
                    vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected) 
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        opts = function()
            local dap, dapui = require("dap"), require("dapui")
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
            return {
                enabled = true, -- enable this plugin (the default)
                enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                show_stop_reason = true, -- show stop reason when stopped for exceptions
                commented = false, -- prefix virtual text with comment string
                only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
                all_references = false, -- show virtual text on all all references of the variable (not only definitions)
                filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
                -- Experimental Features:
                virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
                all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
                virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
            }
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
    },
}
