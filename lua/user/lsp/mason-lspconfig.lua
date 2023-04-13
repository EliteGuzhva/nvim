local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

mason_lspconfig.setup_handlers {
    function (server_name)
        local opts = {
            on_attach = require("user.lsp.handlers").on_attach,
            capabilities = require("user.lsp.handlers").capabilities,
            root_dir = function() return vim.loop.cwd() end,
        }

        if server_name == "clangd" then
            if vim.fn.has("unix") then
                local clangd_opts = {
                    cmd = {
                        "clangd",
                        "--clang-tidy",
                        "--enable-config",
                        "--header-insertion=iwyu"
                    }
                }
                opts = vim.tbl_deep_extend("force", clangd_opts, opts)
            end
        end

        require("lspconfig")[server_name].setup(opts)
    end
}
