vim.opt.background = "dark"

local colorscheme = "catppuccin"

-- One dark specific
if colorscheme == "onedark" then
    local status_ok, onedark = pcall(require, colorscheme)
    if status_ok then
        onedark.setup {
            style = "dark",
            transparent = false,
            ending_tildes = false,
            toggle_style_key = "<leader>ws",
            toggle_style_list = {"light", "dark"}
        }
    end
end

if colorscheme == "catppuccin" then
    local status_ok, catppuccin = pcall(require, colorscheme)
    if status_ok then
        vim.g.catppuccin_flavour = "macchiato"
        catppuccin.setup()

        vim.api.nvim_create_autocmd("OptionSet", {
            pattern = "background",
            callback = function()
                vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "macchiato"))
            end,
        })
    end
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Colorscheme `" .. colorscheme .. "` not found!")
	return
end
