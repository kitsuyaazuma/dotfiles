if vim.g.neovide then
	vim.g.neovide_opacity = 0.9
	vim.g.neovide_cursor_vfx_mode = ""
	vim.g.neovide_cursor_animation_length = 0.03
	vim.g.neovide_scroll_animation_length = 0.1
	vim.keymap.set({ "n", "v" }, "<D-v>", '"+p', { noremap = true, silent = true })
	vim.keymap.set("i", "<D-v>", "<C-r>+", { noremap = true, silent = true })
	vim.keymap.set("c", "<D-v>", "<C-R>+", { noremap = true, silent = true })
end
require("config.options")
require("config.lazy")
require("config.autocmds")
