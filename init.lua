vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

if vim.g.neovide then
  vim.opt.clipboard = "unnamedplus"
  vim.keymap.set("v", "<C-v>", '"+P', { noremap = true, silent = true })
  vim.keymap.set("n", "C-v", '"+P', { noremap = true, silent = true })
  vim.keymap.set("v", "<C-v>", '"+P', { noremap = true, silent = true })
  vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true }) -- Insert
  vim.keymap.set("c", "<C-v>", "<C-r>+", { noremap = true, silent = true }) -- Command-line
  vim.keymap.set("t", "<C-v>", '<C-\\><C-n>"+Pi', { noremap = true, silent = true })
  vim.keymap.set("n", "<C-c>", '"+yy', { noremap = true, silent = true })
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.1)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.1)
  end)
  vim.o.guifont = "JetBrainsMono Nerd Font"
  vim.cmd "cd D:/project/"
end
