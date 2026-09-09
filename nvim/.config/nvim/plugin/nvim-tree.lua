vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, 
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
    filters = {
        dotfiles = false,
        git_ignored = false,
    },
    view = { 
        width = 50,
        relativenumber = true, 
    },
    -- change folder arrow icons
    renderer = {
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "", -- arrow when folder is open
                },
            },
        },
    },
})


vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

