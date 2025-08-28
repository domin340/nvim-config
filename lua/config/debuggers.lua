local function get_mason_package(name)
	return vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "packages", name)
end

local function c_sharp(dap)
	local netcoredbg = get_mason_package("netcoredbg")
	local exec_path = vim.fs.joinpath(netcoredbg, "netcoredbg", "netcoredbg.exe")

	dap.adapters.coreclr = {
		type = "executable",
		command = exec_path,
		args = { "--interpreter=vscode" },
	}

	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "launch - netcoredbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
			end,
		},
	}
end

local dap = require("dap")
c_sharp(dap)
