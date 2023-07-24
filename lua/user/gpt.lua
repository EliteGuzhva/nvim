local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
	return
end

local home = vim.fn.expand("$HOME")
local path_to_config = home .. "/.config/nvim"

chatgpt.setup({
    api_key_cmd = path_to_config .. "/gpt_key.sh"
})
