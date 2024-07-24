-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
-- -- Neovim
-- -- Move Lines
keymap.set("n", "<c-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap.set("n", "<c-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap.set("i", "<c-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<c-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<c-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<c-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
-- keymap.set("n", "<C-q>", "<cmd>qa!<CR>", { desc = "Close Neovim" })
-- keymap.set("n", "<s-s>", "<cmd>wa<CR>", { desc = "Save Changes" })
