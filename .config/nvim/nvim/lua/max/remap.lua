local vim = vim

vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- autoclose brackets etc
--vim.keymap.set("i", "{", "{}<left>");
--vim.keymap.set("i", "(", "()<left>");
--vim.keymap.set("i", "[", "[]<left>");
--vim.keymap.set("i", '"', '""<left>');
--vim.keymap.set("i", "'", "''<left>");
--vim.keymap.set("i", "`", "``<left>");
