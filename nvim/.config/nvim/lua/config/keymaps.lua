local map = vim.keymap.set

map("n", "<leader><leader>x", "<cmd>source %<CR>")
map("n", "<leader>x", ":.lua<CR>")
map("v", "<leader>x", ":lua<CR>")

-- Oil
-- map("n", "-", "<CMD>Oil<CR>")                           -- Open parent directory

map('n', 'gr', vim.lsp.buf.references)

-- Buffer navigation
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<S-A-l>', '<Cmd>BufferMoveNext<CR>')
map('n', '<S-A-h>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A-l>', '<Cmd>BufferNext<CR>')
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>')
map('n', '<A-q>', '<Cmd>BufferClose<CR>')

-- General keymaps
vim.keymap.set('n', '<C-s>', ':update<CR>')				-- Save file in normal mode
vim.keymap.set('i', '<C-s>', '<Esc>:update<CR>a')		-- Save file in insert mode
vim.keymap.set('v', '<C-s>', '<Esc>:update<CR>gv')		-- Save file in visual mode

vim.keymap.set("n", "J", "mzJ`z")						-- Cursor stays in place when line beneath is moving upwards
vim.keymap.set("n", "<C-d>", "<C-d>zz") 				-- Cursor stays in center of screen moving half-page down
vim.keymap.set("n", "<C-u>", "<C-u>zz")					-- Cursor stays in center of screen moving half-page up

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")			-- Move selected text 1 line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")			-- Move selected text 2 line up
