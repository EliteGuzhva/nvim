local M = {}

-- Function signature on typing
local function lsp_func_signature(bufnr)
	local status_ok, lsp_signature = pcall(require, "lsp_signature")
	if not status_ok then
		return
	end

	local cfg = {
		bind = true,
		hint_prefix = "",
		handler_opts = {
			border = "rounded",
		},
		transparency = 30,
	}

	lsp_signature.on_attach(cfg, bufnr)
end

-- Set up LSP keymaps for a buffer
local function lsp_keymaps(bufnr)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
end

-- Enable document highlighting if LSP supports it
local function lsp_highlight_document(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
		vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

M.setup = function()
	-- Configure diagnostics with sign text (replaces deprecated vim.fn.sign_define)
	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})

	-- LspAttach autocmd (replaces on_attach callback)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local bufnr = args.buf
			lsp_keymaps(bufnr)
			if client then
				lsp_highlight_document(client, bufnr)
			end
			lsp_func_signature(bufnr)
		end,
	})
end

-- Use cmp_nvim for LSP
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
