return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
	},
	opts = {
		ensure_installed = {
			"gopls",
			"lua_ls",
			"pyright",
			"rust_analyzer",
			"terraformls",
			"ts_ls",
			"yamlls",
		},
		automatic_enable = {
			exclude = {
				"rust_analyzer",
				"terraformls",
			},
		},
	},
}
