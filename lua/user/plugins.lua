local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer. Close and reopen Neovim!")
    vim.cmd([[packadd packer.nvim]])
end

-- Sync packages on edit
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Safe call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install plugins
return packer.startup(function(use)
    -- Packer itself
    use("wbthomason/packer.nvim")

    -- Required by other lua plugins
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")

    -- Themes
    use("arcticicestudio/nord-vim")
    use({ "dracula/vim", as = "dracula" })
    use("ayu-theme/ayu-vim")
    use("adrian5/oceanic-next-vim")
    use("morhetz/gruvbox")
    use("sonph/onehalf")
    use("arzg/vim-colors-xcode")
    use("tomasiser/vim-code-dark")
    use("bluz71/vim-nightfly-guicolors")
    use("EliteGuzhva/gruvbox-material")
    use("rmehri01/onenord.nvim")
    use("navarasu/onedark.nvim")
    use({ "catppuccin/nvim", as = "catppuccin" })

    -- Status line
    use("nvim-lualine/lualine.nvim")

    -- Project
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
    use("ahmedkhalf/project.nvim")

    -- Tabs
    use("akinsho/bufferline.nvim")
    use("moll/vim-bbye")

    -- Completion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim")
    use("ray-x/lsp_signature.nvim")

    -- Debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- Mason
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        "jay-babu/mason-null-ls.nvim",
    })

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- VCS
    use("lewis6991/gitsigns.nvim")
    use("juneedahamed/vc.vim")

    -- Terminal
    use("akinsho/toggleterm.nvim")

    -- Language specific
    use("rust-lang/rust.vim")
    use("dart-lang/dart-vim-plugin")
    use("EliteGuzhva/build_config.nvim")

    -- Misc
    use("windwp/nvim-autopairs")
    use("rcarriga/nvim-notify")
    use({ "numToStr/Comment.nvim", tag = "v0.6" })

    -- Legacy vim plugins
    use("junegunn/goyo.vim")
    use("junegunn/limelight.vim")
    use("junegunn/vim-easy-align")
    use("tpope/vim-surround")
    use("unblevable/quick-scope")
    use("christoomey/vim-system-copy")
    use("szw/vim-maximizer")
    use("lyokha/vim-xkbswitch")
    use("JamshedVesuna/vim-markdown-preview")
    use("mhinz/vim-startify")
    -- use('liuchengxu/vim-which-key')
    use("tibabit/vim-templates")

    -- Sync if it is the first time
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
