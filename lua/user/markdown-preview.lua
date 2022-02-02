vim.g.vim_markdown_preview_hotkey = "<leader>vm"
vim.g.vim_markdown_preview_github = true

if vim.fn.has("mac") then
    vim.g.vim_markdown_preview_browser = "Safari"
else
    vim.g.vim_markdown_preview_browser = "Firefox"
end
