vim.pack.add({
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
})

require('telescope').setup({
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            preview_width = 0.55,
        },
    },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>f?', function() builtin.find_files({ find_command = { "rg", "--files", "--sort=path", "--hidden" } }) end, { desc = 'Telescope Hidden Files' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)

-- Edit Neovim configuration
vim.keymap.set('n', '<leader>en', function() builtin.find_files { cwd = vim.fn.stdpath("config") } end)
