local status_ok, avante = pcall(require, "avante")
if not status_ok then
	return
end

-- Avante is configured via lazy.nvim opts
-- This file can be used for custom setup if needed

-- Custom keymaps for Avante (in addition to auto-set ones)
vim.keymap.set("n", "<leader>aa", "<cmd>AvanteAsk<cr>", { desc = "Avante: Ask" })
vim.keymap.set("v", "<leader>aa", "<cmd>AvanteAsk<cr>", { desc = "Avante: Ask" })
vim.keymap.set("n", "<leader>ar", "<cmd>AvanteRefresh<cr>", { desc = "Avante: Refresh" })
vim.keymap.set("n", "<leader>ae", "<cmd>AvanteEdit<cr>", { desc = "Avante: Edit" })
vim.keymap.set("n", "<leader>at", "<cmd>AvanteToggle<cr>", { desc = "Avante: Toggle" })
vim.keymap.set("n", "<leader>as", "<cmd>AvanteSwitchProvider<cr>", { desc = "Avante: Switch Provider" })
