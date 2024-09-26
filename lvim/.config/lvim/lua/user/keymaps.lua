local keymap = vim.keymap

local opts = { silent = true, noremap = true }

keymap.set("i", "jk", "<ESC>", opts)

-- set leader
vim.g.mapleader = " "


-- split window
keymap.set("n", "<leader>|", ":vsplit<CR>", opts)
keymap.set("n", "<leader>-", ":split<CR>", opts)

-- -- move window
-- keymap.set("n", "<C-j>", "<C-w>j", opts)
-- keymap.set("n", "<C-k>", "<C-w>k", opts)
-- keymap.set("n", "<C-l>", "<C-w>l", opts)
-- keymap.set("n", "<C-h>", "<C-w>h", opts)

-- -- nvim tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- -- no hls search
-- keymap.set("n", "<leader>h", ":nohlsearch<CR>", opts)


-- -- select all
-- keymap.set("n", "<c-a>", "ggVG", opts)

keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap.set("n", "<c-a>", "ggVG", opts)

lvim.builtin.which_key.mappings['sP'] = {
    "<cmd>Telescope projects<CR>", "Project"
}
