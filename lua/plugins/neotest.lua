return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-python",
	},
	opts = {
		adapters = {
			["neotest-go"] = {
				args = { "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out" },
			},
			["neotest-python"] = {},
		},
	},
	config = function()
		-- Comment configuration object _can_ take a partial and is merged in
		---@diagnostic disable-next-line: missing-fields
		require("neotest").setup({
			adapters = {
				require("neotest-go")({
					args = { "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out" },
				}),
				require("neotest-python"),
			},
			output = {
				enabled = true,
				open_on_run = true,
			},
		})
	end,
}
