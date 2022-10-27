-- Thank God for the keymapping syntactic sugar introduced in 0.5.0

vim.g.mapleader = " "

------------------------------
-- Insert mode               |
------------------------------

------------------------------
-- Normal mode               |
------------------------------
-- Better window movement
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Tab switch buffer
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")

-- QuickFix
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[q", ":cprev<CR>")
vim.keymap.set("n", "<C-q>", ":call QuickFixToggle()<CR>")

-- Move visually
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "gk", "k")

------------------------------
-- Terminal mode             |
------------------------------
-- Terminal window navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

------------------------------
-- Visual mode	             |
------------------------------
-- Move selected line / block of text in visual mode
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")

------------------------------
-- Visual block mode         |
------------------------------
-- Move selected line / block of text in visual mode
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")

------------------------------
-- Exceptions for Mac        |
------------------------------
if vim.fn.has("mac") == 1 then
	vim.keymap.set("n", "<D-h>", "<C-w>h")
	vim.keymap.set("n", "<D-j>", "<C-w>j")
	vim.keymap.set("n", "<D-k>", "<C-w>k")
	vim.keymap.set("n", "<D-l>", "<C-w>l")
	vim.keymap.set("t", "<D-h>", "<C-\\><C-n><C-w>h")
	vim.keymap.set("t", "<D-j>", "<C-\\><C-n><C-w>j")
	vim.keymap.set("t", "<D-k>", "<C-\\><C-n><C-w>k")
	vim.keymap.set("t", "<D-l>", "<C-\\><C-n><C-w>l")
end
