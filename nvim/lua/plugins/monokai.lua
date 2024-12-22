return {
	"loctvl842/monokai-pro.nvim",
	config = function()
		vim.cmd([[colorscheme monokai-pro]])
		require("monokai-pro").setup({})
	end,
}
