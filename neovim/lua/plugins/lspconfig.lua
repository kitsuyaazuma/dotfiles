return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
			},
		},
	},
	config = function(_, opts)
		vim.diagnostic.config(opts.diagnostics)
	end,
}
