-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.autoformat = false

if vim.g.neovide then
	-- vim.g.neovide_transparency = 0.8
	vim.opt.guifont = { "FiraCode Nerd Font", ":h13" }
end
