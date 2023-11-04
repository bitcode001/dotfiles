local hop_setup, hop = pcall(require, "hop")
if not hop_setup then
	print(" hop not found! ")
	return
end

-- hi HopNextKey guifg=
local keymap = vim.keymap -- for conciseness

-- place this in one of your configuration file(s)
local directions = require("hop.hint").HintDirection
keymap.set("n", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })

keymap.set("n", "f2", function()
	hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })

keymap.set("n", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })

keymap.set("n", "F2", function()
	hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })

keymap.set("n", "t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })

keymap.set("n", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

-- Other available options
--Hop command	Lua API function
-- HopAnywhere	require'hop'.hint_anywhere()
-- HopChar1	require'hop'.hint_char1()
-- HopChar2	require'hop'.hint_char2()
-- HopLine	require'hop'.hint_lines()
-- HopLineStart	require'hop'.hint_lines_skip_whitespace()
-- HopVertical	require'hop'.hint_vertical()
-- HopPattern	require'hop'.hint_patterns()
-- HopWord	require'hop'.hint_words()

hop.setup({
	keys = "asdfghjlktyuireowvbnmc",
	quit_key = "<SPC>",
	jump_on_sole_occurrence = false,
	case_insensitive = false,
	-- create_hl_autocmd = false,
	-- uppercase_labels = true,
	-- current_line_only = true,
	-- multi_windows = true,
	-- hint_position = require'hop.hint'.HintPosition.END,
	-- hint_position = require'hop.hint'.HintPosition.MIDDLE,
	-- hint_offset = 1 / -1 -- position for a cursor to be in
})
