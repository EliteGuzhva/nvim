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
    guifont = "FiraCode NF:h11"
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Font
vim.g.guifont_face = "FiraCode NF"
vim.g.guifont_default_size = 11
vim.g.guifont_size = vim.g.guifont_default_size

RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s", vim.g.guifont_face, vim.g.guifont_size)
end

ResizeGuiFont = function(delta)
    vim.g.guifont_size = vim.g.guifont_size + delta
    RefreshGuiFont()
end

ResetGuiFont = function()
    vim.g.guifont_size = vim.g.guifont_default_size
    RefreshGuiFont()
end

ResetGuiFont()

local opts = { noremap = true, silent = true }
vim.keymap.set({ 'n', 'i' }, '<C-=>', function() ResizeGuiFont(1) end, opts)
vim.keymap.set({ 'n', 'i' }, '<C-->', function() ResizeGuiFont(-1) end, opts)
vim.keymap.set({ 'n', 'i' }, '<C-0>', function() ResetGuiFont() end, opts)

-- Filetype specific options
vim.cmd([[
    autocmd FileType text setlocal textwidth=78
    autocmd Filetype json setlocal tabstop=2 shiftwidth=2
    autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2
    autocmd Filetype dart setlocal tabstop=2 shiftwidth=2
    autocmd Filetype h    setlocal tabstop=2 shiftwidth=2
    autocmd Filetype hpp  setlocal tabstop=2 shiftwidth=2
    autocmd Filetype c    setlocal tabstop=2 shiftwidth=2
    autocmd Filetype cc   setlocal tabstop=2 shiftwidth=2
    autocmd Filetype cpp  setlocal tabstop=2 shiftwidth=2
    autocmd Filetype py   setlocal tabstop=4 shiftwidth=4
]])
