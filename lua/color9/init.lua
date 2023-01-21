local M = {}

M.config = {}

function M.setup(config)
    M.config = vim.tbl_extend("force", M.config, config or {})
end

M.load = function ()
    if vim.version().minor < 7 then
        vim.notify_once("color9.vim: You must use Neovim version 7.0 or higher")
        return
    end

    -- reset colors
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "color9"
    vim.o.termguicolors = true

    local reset_groups = require("color9.groups").reset()

    -- add highlights
    for group, settings in pairs(reset_groups) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end
return M
