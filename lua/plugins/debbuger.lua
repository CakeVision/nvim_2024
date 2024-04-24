return {
	"mfussenegger/nvim-dap",
  -- stylua: ignore
  keys = {
    { "<leader>bM", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Dap Breakpoint Condition", },
    { "<leader>bm", function() require("dap").toggle_breakpoint() end,                                    desc = "Dap Toggle Breakpoint", },
    { "<leader>bc", function() require("dap").continue() end,                                             desc = "Dap Continue", },
    { "<leader>bC", function() require("dap").run_to_cursor() end,                                        desc = "Dap Run to Cursor", },
    { "<leader>bg", function() require("dap").goto_() end,                                                desc = "Dap Go to line (no execute)", },
    { "<leader>bi", function() require("dap").step_into() end,                                            desc = "Dap Step Into", },
    { "<leader>bj", function() require("dap").down() end,                                                 desc = "Dap Down", },
    { "<leader>bk", function() require("dap").up() end,                                                   desc = "Dap Up", },
    { "<leader>bl", function() require("dap").run_last() end,                                             desc = "Dap Run Last", },
    { "<leader>bo", function() require("dap").step_out() end,                                             desc = "Dap Step Out", },
    { "<leader>bO", function() require("dap").step_over() end,                                            desc = "Dap Step Over", },
    { "<leader>bp", function() require("dap").pause() end,                                                desc = "Dap Pause", },
    { "<leader>br", function() require("dap").repl.toggle() end,                                          desc = "Dap Toggle REPL", },
    { "<leader>bs", function() require("dap").session() end,                                              desc = "Dap Session", },
    { "<leader>bt", function() require("dap").terminate() end,                                            desc = "Dap Terminate", },
    { "<leader>bw", function() require("dap.ui.widgets").hover() end,                                     desc = "Dap Widgets", },
  },
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
      -- stylua: ignore
      keys = {
        { "<leader>be", function() require("dapui").eval() end,     desc = "Eval",         mode = { "n", "v" } },
        { "<leader>bu", function() require("dapui").toggle({}) end, desc = "Dap Toggle UI" },
      },
			config = function()
				local dap = require("dap")
				dap.adapters.codelldb = {
					type = "server",
					port = "${port}",
					executable = {
						command = "/home/cake/codelldbdir/extension/adapter/codelldb",
						args = { "--port", "${port}" },
						-- On windows you may have to uncomment this:
						-- detached = false,
					},
					name = "lldb",
				}
				dap.adapters.java = function(callback)
					callback({
						type = "server",
						host = "127.0.0.1",
						port = 8080,
					})
				end
				dap.configurations.java = {
					{
						-- You need to extend the classPath to list your dependencies.
						-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
						classPaths = {},

						-- If using multi-module projects, remove otherwise.
						projectName = "yourProjectName",

						javaExec = "/bin/java",
						mainClass = "your.package.name.MainClassName",

						-- If using the JDK9+ module system, this needs to be extended
						-- `nvim-jdtls` would automatically populate this property
						modulePaths = {},
						name = "Launch YourClassName",
						request = "launch",
						type = "java",
					},
				}
				dap.configurations.cpp = {
					{
						name = "Launch",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
						args = {},
					},
				}
				dap.configurations.c = dap.configurations.cpp

				local dapui = require("dapui")
				dapui.setup()
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close()
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close()
				end
			end,
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = {
				"williamboman/mason.nvim",
				"mfussenegger/nvim-dap",
			},
			config = function()
				require("mason-nvim-dap").setup({

					automatic_setup = true,

					handlers = {
						function(config)
							require("mason-nvim-dap").default_setup(config)
						end,
					},
				})
				--Change icons
				local sign = vim.fn.sign_define
				sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
				sign(
					"DapBreakpointCondition",
					{ text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
				)
				sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
				sign("DapStopped", { text = "󰁕 ", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "" })
			end,
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {
				handlers = {},
			},
		},
	},
	config = function() end,
}
