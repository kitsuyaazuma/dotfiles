return {
	"loctvl842/monokai-pro.nvim",
	event = "VimEnter",
	config = function()
		vim.cmd([[colorscheme monokai-pro]])
		require("monokai-pro").setup({})
	end,
}
