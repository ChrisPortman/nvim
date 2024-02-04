--------------------------------------------------------------------------------
-- Markdown Previewer
--------------------------------------------------------------------------------

return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown", "markdown.pandoc" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	cmd = {
		"MarkdownPreviewToggle",
		"MarkdownPreview",
		"MarkdownPreviewStop",
	},
	config = function()
		vim.g.mkdp_filetypes = { "markdown", "markdown.pandoc" }
	end,
}
