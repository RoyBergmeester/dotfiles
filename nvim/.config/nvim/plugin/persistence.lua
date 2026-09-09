
vim.pack.add({
    'https://github.com/folke/persistence.nvim',
})

require('persistence').setup()

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            require("persistence").load()
        end
    end,
    nested = true,
})
