local M = {}

M.config = {}

function M.setup(config)
	M.config = vim.tbl_extend("force", M.config, config or {})
end

M.load = function()
	if vim.version().minor < 7 then
		vim.notify_once("color9.nvim: You must use Neovim version 7.0 or higher")
		return
	end

	-- reset colors
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.g.colors_name = "color9"
	vim.o.termguicolors = true

	local groups = require("color9.groups")

	-- Clear all default highlights
	local clear_groups = groups.get_clear_groups()
	for group, settings in pairs(clear_groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- Add highlights
	local hi_groups = groups.get_hi_groups()
	for group, settings in pairs(hi_groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end
return M
