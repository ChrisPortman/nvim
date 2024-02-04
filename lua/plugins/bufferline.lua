return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				close_command = function(buf)
					local ok, result = pcall(vim.cmd, "bdelete " .. buf)
					if ok then
						return
					end
					print(result)
				end,
			},
		})
	end,
}
