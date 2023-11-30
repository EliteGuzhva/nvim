local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    root_dir = function() return vim.loop.cwd() end,
}

-- dartls
local dartls_opts = {
    cmd = {
        "dart",
        "language-server",
        "--protocol=lsp"
    }
}
dartls_opts = vim.tbl_deep_extend("force", dartls_opts, opts)
lspconfig.dartls.setup(dartls_opts)

require("user.lsp.mason-lspconfig")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
