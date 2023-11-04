local indent_setup, indent_blankline = pcall(require, "ibl")
if not indent_setup then
	print(" indent setup not found! ")
	return
end

indent_blankline.setup()

-- indent_blankline.setup({
-- 	indent_blankline_use_treesitter = true,
-- 	context_patterns = {
-- 		"class",
-- 		"return",
-- 		"function",
-- 		"method",
-- 		"^if",
-- 		"^while",
-- 		"jsx_element",
-- 		"^for",
-- 		"^object",
-- 		"^table",
-- 		"block",
-- 		"arguments",
-- 		"if_statement",
-- 		"else_clause",
-- 		"jsx_element",
-- 		"jsx_self_closing_element",
-- 		"try_statement",
-- 		"catch_clause",
-- 		"import_statement",
-- 		"operation_type",
-- 	},
-- 	show_current_context = true,
-- 	--show_current_context_start = true,
-- 	--space_char_blankline = " ",
-- })
