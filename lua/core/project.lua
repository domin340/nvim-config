local M = {}

function M.rojo_project()
	return vim.fs.root(0, function(name)
		return name:match '.+%.project%.json$'
	end)
end

---@param name string
function M.mason_package(name)
	return vim.fs.joinpath(vim.fn.stdpath 'data', 'mason', 'packages', name)
end

function M.neovim_project()
	local conf_dir = vim.fs.normalize(vim.fn.stdpath 'config')
	local cwd = vim.fs.normalize(vim.fn.getcwd())
	return vim.startswith(cwd, conf_dir)
end

---in order to make love2d project distinct from others it checks for 'love2dproject.txt' file.
---if one has this file that means the project is considered love2d project.
---it's important to add that this method here is only to avoid loading unnecessary libraries.
function M.love2d_project()
	local file_path = vim.fs.normalize(vim.fn.getcwd() .. '/love2dproject.txt')
	local stat = vim.loop.fs_stat(file_path)
	return stat ~= nil and stat.type == 'file'
end

return M
