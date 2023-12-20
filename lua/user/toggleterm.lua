local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 15,
	open_mapping = [[<C-t>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = false,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local float = Terminal:new({name = "float", count = 1000 })
function _FLOAT_TOGGLE()
	float:toggle()
end

local split = Terminal:new({ name = "split", direction = "horizontal", count = 100 })
function _SPLIT_TOGGLE()
	split:toggle()
end

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, count = 101 })
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, count = 102 })
function _LAZYDOCKER_TOGGLE()
	lazydocker:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true, count = 103 })
function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true, count = 104 })
function _PYTHON_TOGGLE()
	python:toggle()
end

local build_dir = "build"
if vim.g.bc_config ~= nil and vim.g.bc_config["build_dir"] ~= nil then
    build_dir = vim.g.bc_config["build_dir"]
end
local ccmake = Terminal:new({ cmd = "ccmake -B " .. build_dir .. " .", hidden = true, count = 105 })
function _CCMAKE_TOGGLE()
	ccmake:toggle()
end
