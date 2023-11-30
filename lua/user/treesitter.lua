local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"css",
		"cuda",
		"dart",
		"dockerfile",
		"dot",
		"glsl",
		"go",
		"html",
		"java",
		"javascript",
		"json",
		"kotlin",
		"latex",
		"llvm",
		"lua",
		"make",
		"markdown",
		"python",
		"regex",
		"rust",
		"solidity",
		"swift",
		"typescript",
		"vim",
		"yaml",
	},
	sync_install = false,
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
})
