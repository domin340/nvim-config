return {
   ---@param name string
	get_mason_package = function(name)
		return vim.fs.joinpath(vim.fn.stdpath 'data', 'mason', 'packages', name)
	end,

	is_neovim_project = function()
		local conf_dir = vim.fs.normalize(vim.fn.stdpath 'config')
		local cwd = vim.fs.normalize(vim.fn.getcwd())
		return vim.startswith(cwd, conf_dir)
	end,

	---in order to make love2d project distinct from others it checks for 'love2dproject.txt' file.
	---if one has this file that means the project is considered love2d project.
	---it's important to add that this method here is only to avoid loading unnecessary libraries.
	is_love2d_project = function()
		local file_path = vim.fs.normalize(vim.fn.getcwd() .. '/love2dproject.txt')
		local stat = vim.loop.fs_stat(file_path)
		return stat ~= nil and stat.type == 'file'
	end,
}
