return {
	"stevearc/conform.nvim",
	event = "BufReadPre",
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt" },
			python = { "ruff_format" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = { timeout_ms = 500 },
	},
}
