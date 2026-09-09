vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

require('snacks').setup({
    picker = {
        ui_select = true,

        sources = {
            select = {
                layout = {
                    layout = {
                        relative  = 'cursor',
                        row       = 1,
                        col       = 0,
                        width     = 0.4,
                        min_width = 40,
                        max_width = 80,
                        height    = 0.4,
                        min_height = 2,
                        backdrop  = false,
                        border    = true,
                        box       = 'vertical',
                        title     = '{title}',
                        title_pos = 'center',
                        { win = 'input', height = 1, border = 'bottom' },
                        { win = 'list',  border = 'none' },
                    },
                },
            },
        },
    },
})
