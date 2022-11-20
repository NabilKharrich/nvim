vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.t_Co = 256

local options = {
	clipboard = "unnamedplus",
	termguicolors = true,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	mouse = "a",
	ignorecase = true,
	smartcase = true,
	smartindent = true,
	fileencoding = "utf-8",
	splitbelow = true,
	splitright = true,
	number = true,
	relativenumber = true,
	backspace = "indent,eol,start",
	list = true,
	cursorline = true,
	colorcolumn = "0",
	timeoutlen = 0,
	signcolumn = "yes",
	scrolloff = 10,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
