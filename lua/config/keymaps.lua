-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness

-- Neovim
keymap.set("n", "<esc>", "<cmd>nohl<cr>")
keymap.set("n", "<C-q>", "<cmd>qa!<CR>", { desc = "Close Neovim" })
keymap.set("n", "<s-s>", "<cmd>wa<CR>", { desc = "Save Changes" })