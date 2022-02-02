-- Global Neovim options
local options = {
	exrc = true,
	secure = true,
	number = true,
	relativenumber = true,
	splitbelow = true,
	splitright = false,
	smartindent = true,
	expandtab = true,
	tabstop = 4,
	shiftwidth = 4,
	mouse = "a",
	backup = false,
	undofile = true,
	termguicolors = true,
	laststatus = 2,
	showmode = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Filetype specific options
vim.cmd([[
    autocmd FileType text setlocal textwidth=78
    autocmd Filetype dart setlocal tabstop=2 shiftwidth=2
    autocmd Filetype h    setlocal tabstop=2 shiftwidth=2
    autocmd Filetype hpp  setlocal tabstop=2 shiftwidth=2
    autocmd Filetype c    setlocal tabstop=2 shiftwidth=2
    autocmd Filetype cc   setlocal tabstop=2 shiftwidth=2
    autocmd Filetype cpp  setlocal tabstop=2 shiftwidth=2
    autocmd Filetype py   setlocal tabstop=4 shiftwidth=4
]])
