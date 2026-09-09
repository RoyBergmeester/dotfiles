vim.pack.add({
	{ 
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	}
})

require("rose-pine").setup({
	variant = 'moon',
	styles = { italic = false, bold = false }
})

vim.cmd("colorscheme rose-pine")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
