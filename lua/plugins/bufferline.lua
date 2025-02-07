return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				close_command = function(buf)
					if vim.api.nvim_buf_get_option(buf, "modified") then
						print("buffer is modified - need user check to delete without saving")
						vim.ui.input({
							prompt = "Buffer has unsaved changes, close without saving? [y/N]: ",
						}, function(i)
							if i:lower() == "y" then
								vim.api.nvim_buf_delete(buf, { force = true })
							end
						end)
					else
						vim.api.nvim_buf_delete(buf, {})
					end
				end,
			},
		})
	end,
}
