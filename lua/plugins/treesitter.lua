local P = {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {

			auto_install = true,
			ensure_installed = {
				"c",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
				"python",
				"java",
				"bash",
				"lua",
				"luadoc",
				"markdown",
				"zig",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = {
				enable = true,
				disable = { "ruby" }
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
return P
