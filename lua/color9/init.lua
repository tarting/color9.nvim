local M = {}

-- default configuration 
<<<<<<< HEAD
M.config = {
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  palette_overrides = {},
}
=======
M.config = {}
>>>>>>> fd0a542 (init)

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

    local groups = require("color9.groups").setup()

    -- add highlights
    for group, settings in pairs(groups) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end
return M
