return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = { "rust_analyzer" },
				})
				require("mason-lspconfig").setup_handlers({
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				})
			end,
		},
	},
}
