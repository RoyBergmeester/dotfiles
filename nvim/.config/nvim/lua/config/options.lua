-- Make sure to setup `mapleader` and `maplocalleader` before
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic settings
vim.opt.number = true                                   -- Line numbers
vim.opt.relativenumber = true                           -- Relative line numbers
vim.opt.cursorline= false                               -- Highlight the current line
vim.opt.wrap = false                                    -- Don't wrap lines
vim.opt.clipboard = "unnamedplus"                       -- Yank to systems clipboard
vim.opt.scrolloff = 10                                  -- Keep 10 lines above/below cursor
vim.opt.sidescroll = 8                                  -- Keep 8 columns left/right of cursor
vim.opt.colorcolumn = "80,120"                          -- Set vertical lign at X characters

-- Indentation
vim.opt.tabstop = 4                                     -- Tab width
vim.opt.shiftwidth = 4                                  -- Indent width
vim.opt.expandtab = true                                -- Use spaces instead of tabs
vim.opt.smartindent = true                              -- Smart auto-indenting

-- Search settings
vim.opt.ignorecase = true                               -- Case insensitive search
vim.opt.smartcase = true                                -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                                -- Don't highlight search results
vim.opt.incsearch = true                                -- Show matches as you type

-- Autocommands
vim.api.nvim_create_autocmd("TextYankPost", { callback = function() vim.highlight.on_yank() end }) -- Highlight yanked text

-- UNDO setting
vim.opt.undofile = true

local undodir = "~/.local/share/nvim/undodir"
local undodir_path = vim.fn.expand(undodir)
vim.opt.undodir = undodir_path
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, "p")
end

-- Diagnostics
vim.diagnostic.config({
 virtual_text = {
    prefix = '●',  -- or '▎', '■', '»'
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
