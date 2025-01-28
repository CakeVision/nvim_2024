-- plugins/autopairs.lua
local P = {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,                  -- enable treesitter
			ts_config = {
				lua = { "string" },             -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in js template_string
			},
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			enable_check_bracket_line = true, -- don't add pairs if it already has a close pair in the same line
			ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
			fast_wrap = {
				map = "<M-e>", -- Alt+e to fast wrap
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0,
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "PmenuSel",
				highlight_grey = "LineNr",
			},
		},
		config = function(_, opts)
			local npairs = require("nvim-autopairs")
			npairs.setup(opts)

			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if cmp_status_ok then
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	}
}

return P
