-- ~/.config/nvim/lua/coc_configs.lua

local coc_astro_setup, coc_astro = pcall(require, "coc")

if not coc_astro_setup then
	print(" coc astro not found! ")
	return
end

vim.cmd([[ autocmd BufRead,BufNewFile *.astro setfiletype astro ]])

coc_astro.coc_astro.setup({
	-- Enable the coc-astro extension
	enable = true,

	-- Use detected tsLibs in your astro project, otherwise use built-in
	useWorkspaceTsdk = false,

	-- Enable auto creation of quotes for HTML attribute assignment
	autoCreateQuotes = true,

	-- Enable auto-closing of HTML tags
	autoClosingTags = true,

	-- Path to language server (you likely won't need this unless you have a specific reason)
	language_server = {
		ls_path = nil,
		runtime = nil,
	},

	-- Set trace server off for now, modify if you want more verbose logs
	trace = {
		server = "off",
	},
})
