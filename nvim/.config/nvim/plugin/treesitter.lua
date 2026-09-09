vim.pack.add({'https://github.com/nvim-treesitter/nvim-treesitter'})

require('nvim-treesitter').setup({
    ensure_installed = { 'twig' },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection    = "<C-space>",
            node_incremental  = "<C-space>",
            scope_incremental = false,
            node_decremental  = "<bs>",
        },
    },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'php', 'html', 'twig', 'css', 'sql', 'javascript' },
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if ok then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end
})
