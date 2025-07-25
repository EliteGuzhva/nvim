local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup({
	-- Add these key bindings
	toggler = {
		line = 'gcc',
		block = 'gbc',
	},
	opleader = {
		line = 'gc',
		block = 'gb',
	},
	extra = {
		above = 'gcO',
		below = 'gco',
		eol = 'gcA',
	},
	mappings = {
		basic = true,
		extra = true,
	},
	pre_hook = function(ctx)
		-- Integration with nvim-ts-context-commentstring
		local U = require("Comment.utils")

		-- Determine whether to use linewise or blockwise commentstring
		local location = nil
		if ctx.ctype == U.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})
