local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		-- C/C++
		formatting.clang_format.with({
			extra_args = { "--style=file" },
		}),

		-- CMake
		formatting.cmake_format,

		-- Lua
		formatting.stylua.with({
			extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
		}),

		-- Python
		formatting.black.with({
			extra_args = { "--fast", "-l", "120" },
		}),
		-- Note: flake8 and mypy diagnostics are not available in none-ls builtins
		-- Use pyright LSP for Python diagnostics instead
		-- diagnostics.flake8.with({
		--     extra_args = { "--max-line-length", "120" },
		-- }),
		-- diagnostics.mypy.with({
		--     extra_args = { "--ignore-missing-imports" },
		-- }),
	},
})
