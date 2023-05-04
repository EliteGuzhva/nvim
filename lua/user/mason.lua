-- Mason
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

mason.setup()

-- Mason LspConfig
local masonlsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not masonlsp_ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"cmake",
		"dockerls",
		"docker_compose_language_service",
		"jsonls",
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"yamlls",
	},
})

-- Mason Dap
local masondap_ok, mason_dap = pcall(require, "mason-nvim-dap")
if not masondap_ok then
	return
end

mason_dap.setup({
	ensure_installed = {
		"python",
		"cppdbg",
		"codelldb",
		"bash",
		"dart",
	},
	handlers = {
		function(config)
			mason_dap.default_setup(config)
		end,
	},
})

-- Mason Null-LS
local masonnull_ok, mason_null = pcall(require, "mason-null-ls")
if not masonnull_ok then
	return
end

mason_null.setup({
	ensure_installed = {
		"stylua",
		"black",
		"flake8",
		"mypy",
		"clang_format",
	},
	automatic_setup = true,
	handlers = {
		function(source_name, methods)
			mason_null.default_setup(source_name, methods)
		end,
	},
})
