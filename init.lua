require("user.options")
require("user.keymaps")
require("user.lazy")
require("user.colorscheme")
require("user.completion")
require("user.mason")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.toggleterm")
require("user.lualine")
require("user.project")
require("user.build_config")
require("user.dap")
require("user.whichkey")
require("user.noice")
require("user.dressing")

-- Legacy
require("user.quick-scope")
require("user.markdown-preview")
require("user.xkb-switch")
require("user.templates")
require("user.alpha")

-- Source local .nvimrc
local local_vimrc = vim.fn.getcwd() .. "/.nvimrc"
if vim.loop.fs_stat(local_vimrc) then
	vim.cmd("source " .. local_vimrc)
end
