local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
        root_dir = function() return vim.loop.cwd() end,
	}

    if server.name == "clangd" then
        if vim.fn.has("unix") then
            local clangd_opts = {
                cmd = {
                    "clangd",
                    "--clang-tidy",
                    "--enable-config",
                }
            }
            opts = vim.tbl_deep_extend("force", clangd_opts, opts)
        end
    end

	server:setup(opts)
end)
