-- Configurations
local dap = require("dap")

if vim.g.bc_config ~= nil and vim.g.bc_config["launch"] ~= nil then
    local opts = vim.g.bc_config["launch"]
    local cwd = "${workspaceFolder}/" .. opts["cwd"]
    local exe = opts["exe"]
    local args = opts["args"]

    -- TODO: read from launch.json
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
            miDebuggerPath = cwd .. "/virtualrunenv_gdb.sh",
            setupCommands = {
                {
                    description = "Enable pretty-printing for gdb",
                    text = "-enable-pretty-printing",
                    ignoreFailures = true,
                },
            },
        },
        {
            name = "ar13_debug_lldb",
            type = "codelldb",
            request = "launch",
            program = cwd .. "/" .. exe,
            args = args,
            cwd = cwd,
            stopAtEntry = false,
            externalConsole = false,
            MiMode = "lldb",
            miDebuggerPath = cwd .. "/virtualrunenv_lldb.sh",
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

-- UI
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
