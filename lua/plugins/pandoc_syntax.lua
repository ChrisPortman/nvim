local autocmd = vim.api.nvim_create_autocmd
local markdownGroup = vim.api.nvim_create_augroup("MarkdownGrp", { clear = true })
autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
	pattern = { "*.md" },
	callback = function()
		vim.cmd("setfiletype markdown.pandoc")
		vim.cmd("let g:pandoc#syntax#conceal#use = 0")
		vim.cmd("setlocal conceallevel=0")
		vim.cmd("setlocal spell spelllang=en_au")
	end,
	group = markdownGroup,
})

return {
	"vim-pandoc/vim-pandoc-syntax",
	ft = { "markdown.pandoc" },
}
