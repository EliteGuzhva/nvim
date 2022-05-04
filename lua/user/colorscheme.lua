vim.opt.background = "dark"

local colorscheme = "onedark"

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

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Colorscheme `" .. colorscheme .. "` not found!")
	return
end
