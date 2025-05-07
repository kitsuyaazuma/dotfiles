return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		{
			"mason.org/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		},
		{
			"mason.org/mason-lspconfig.nvim",
			config = function()
				local lspconfig = require("lspconfig")
				require("mason-lspconfig").setup({
					ensure_installed = {
						"gopls",
						"pyright",
						"rust_analyzer",
                        "terraformls",
						"ts_ls",
                        "yamlls",
					},
                    automatic_enabled = {
                        exclude = { "rust_analyzer", "terraformls" },
                    }
				})
			end,
		},
	},
}
