-- Configurations
local dap = require("dap")

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = vim.fn.stdpath("data") .. "/debug_adapters/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.adapters.codelldb = {
    id = "codelldb",
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/debug_adapters/vscode-lldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
    },
}

if vim.g.bc_config ~= nil then
    local opts = vim.g.bc_config["launch"]
    local cwd = opts["cwd"]
    local exe = opts["exe"]
    local args = opts["args"]

    dap.configurations.cpp = {
        {
            name = "gdb",
            type = "cppdbg",
            request = "launch",
            program = cwd .. "/" .. exe,
            args = args,
            cwd = cwd,
            stopAtEntry = false,
            externalConsole = false,
            MIMode = "gdb",
            setupCommands = {
                {
                    description = "Enable pretty-printing for gdb",
                    text = "-enable-pretty-printing",
                    ignoreFailures = true,
                },
            },
        },
        {
            name = "lldb",
            type = "codelldb",
            request = "launch",
            program = cwd .. "/" .. exe,
            args = args,
            cwd = cwd,
            stopOnEntry = false,
            externalConsole = false,
            MiMode = "lldb",
            setupCommands = {
                {
                    description = "Enable pretty-printing for lldb",
                    text = "-enable-pretty-printing",
                    ignoreFailures = true,
                },
            },
        },
        {
            name = "ar13_debug",
            type = "cppdbg",
            request = "launch",
            program = cwd .. "/" .. exe,
            args = args,
            cwd = cwd,
            stopAtEntry = false,
            externalConsole = false,
            MIMode = "gdb",
            miDebuggerPath = vim.g.bc_config["launch"]["cwd"] .. "/virtualrunenv_gdb.sh",
            setupCommands = {
                {
                    description = "Enable pretty-printing for gdb",
                    text = "-enable-pretty-printing",
                    ignoreFailures = true,
                },
            },
        },
    }
end

require("dap-python").setup("python3")

-- UI
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
