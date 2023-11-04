local setup, null_ls = pcall(require, "null-ls")
if not setup then
	print(" null-ls not found! ")
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	-- sources = {
	-- 	-- formatting.prettier,
	-- 	formatting.stylua,
	-- 	formatting.terraform_fmt,
	-- 	diagnostics.eslint,
	-- },
	sources = {
		formatting.stylua,
		formatting.terraform_fmt,
		formatting.prettier,
		-- diagnostics.eslint_d,
		diagnostics.eslint_d.with({
			command = "eslint_d",
			args = { "--stdin", "--fix-to-stdout", "--stdin-filename", "$FILENAME" },
			to_stdin = true,
			from_stderr = true,
			format = "line",
			condition = function(utils)
				-- Check if the eslintrc file exists in the project
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
			end,
		}),
		formatting.eslint_d,
		-- formatting.eslint_d.with({
		-- 	command = "eslint_d",
		-- 	args = { "--stdin", "--fix-to-stdout", "--stdin-filename", "$FILENAME" },
		-- 	to_stdin = true,
		-- 	from_stderr = true,
		-- 	format = "line",
		-- 	on_output = function(params)
		-- 		-- Ignore error messages related to missing ESLint configuration
		-- 		if params.output and params.output:find("no usable configuration", 1, true) then
		-- 			return nil
		-- 		end
		-- 		return params.output
		-- 	end,
		-- }),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
