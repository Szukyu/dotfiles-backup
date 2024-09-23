vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("autocmd FileType python setlocal tabstop=2 softtabstop=2 shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false
-- vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.keymap.set("n", "<leader>l", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Tab"})
vim.keymap.set("n", "<leader>h", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Tab"})
vim.keymap.set("n", "<leader>w", "<cmd>Bdelete<CR>", { desc = "Close Tab"})
vim.api.nvim_set_keymap("n", "<leader>nn", "<cmd>Noice dismiss<CR>", {noremap = true})
















































