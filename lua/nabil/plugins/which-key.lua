local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	s = {
		name = "Split",
		v = { "<cmd>vsplit<cr>", "Split vertically" },
		h = { "<cmd>split<cr>", "Split horizontally" },
	},
	l = {
		name = "LSP",
		i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
		gd = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
		c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	},
	d = {
		name = "Diagnostics",
		d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Line Diagnostics" },
		n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to next diagnostic" },
		p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go to prev diagnostic" },
		l = { "<cmd>Telescope diagnostics<cr>", "List diagnostic" },
	},
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find files" },
		h = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
		g = { "<cmd>Telescope git_files<cr>", "Git files" },
		s = { "<cmd>Telescope live_grep<cr>", "Find string" },
	},
}

local opts = { prefix = "<leader>" }

which_key.setup({
	window = {
		border = "rounded",
	},
	layout = {
		height = { min = 2, max = 25 },
		spacing = 5,
		align = "center",
	},
})
which_key.register(mappings, opts)
