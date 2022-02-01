local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer. Close and reopen Neovim!"
    vim.cmd [[packadd packer.nvim]]
end

-- Sync packages on edit
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Safe call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    }
}

-- Install plugins
return packer.startup(function(use)
    -- Packer itself
    use "wbthomason/packer.nvim"

    -- Required by other lus plugins
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    -- Themes
    use "arcticicestudio/nord-vim"
    use { "dracula/vim", as = "dracula" }
    use "ayu-theme/ayu-vim"
    use "adrian5/oceanic-next-vim"
    use "morhetz/gruvbox"
    use "sonph/onehalf"
    use "arzg/vim-colors-xcode"
    use "tomasiser/vim-code-dark"
    use "bluz71/vim-nightfly-guicolors"
    use "EliteGuzhva/gruvbox-material"
    use "rmehri01/onenord.nvim"
    use "navarasu/onedark.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Sync if it is the first time
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
