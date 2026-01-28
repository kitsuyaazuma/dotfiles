return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = function()
		local highlight = {
			"CursorColumn",
			"WhiteSpace",
		}
		return {
			indent = {
				highlight = highlight,
				char = "",
			},
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = true,
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"Trouble",
					"alpha",
					"dashboard",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"notify",
					"snacks_dashboard",
					"snacks_notif",
					"snacks_terminal",
					"snacks_win",
					"toggleterm",
					"trouble",
				},
			},
		}
	end,
}
