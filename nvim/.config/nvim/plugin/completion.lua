vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/rafamadriz/friendly-snippets',
})

require('luasnip.loaders.from_vscode').lazy_load()

require('blink.cmp').setup({
    keymap = {
        preset = 'enter',
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>']     = { 'hide', 'fallback' },
        ['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },
        ['<Tab>']     = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>']   = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
    signature = { enabled = true },
    snippets = { preset = 'luasnip' },
    sources = {
        default = { 'lsp', 'snippets', 'buffer', 'path' },
    },
    cmdline = {
        enabled = true,
        keymap = { preset = 'cmdline' },
        completion = { menu = { auto_show = true } },
    },
})
