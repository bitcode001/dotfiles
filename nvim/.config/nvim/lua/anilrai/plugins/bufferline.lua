local bufferline_setup, bufferline = pcall(require, "bufferline")
if not bufferline_setup then
	print(" bufferline not found! ")
	return
end

vim.cmd([[
	set termguicolors
  nnoremap <silent> sb :BufferLinePick<CR>
  nnoremap <silent> bcp :BufferLinePickClose<CR>
	nnoremap <silent>	bcl :BufferLineCloseLeft<CR>
	nnoremap <silent>	bcr :BufferLineCloseRight<CR>
	
  nnoremap <silent>b] :BufferLineCycleNext<CR>
  nnoremap <silent>b[ :BufferLineCyclePrev<CR>

  " " These commands will move the current buffer to the first or the last position in the bufferline
  " nnoremap <silent><mymap> :lua require'bufferline'.move_to(1)<CR>
  " nnoremap <silent><mymap> :lua require'bufferline'.move_to(-1)<CR>

  nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
  nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
  nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
  nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>
	
	" nnoremap mymap :lua require"bufferline".go_to(num)<CR>
]])

local function get_active_buffer_highlight()
	return {
		fg = "#BE3B55", -- Replace with the desired foreground color
		-- bg = "<background-color>", -- Replace with the desired background color
		-- gui = "#BE3B55", -- Replace with any desired GUI attributes (e.g., "bold", "italic")
		bold = false,
		italic = true,
	}
end

bufferline.setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				highlight = "Directory",
				separator = false,
			},
		},
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			-- style = "icon" | "underline" | "none",
			style = "icon",
		},
		-- color_icons = true,
		-- separator_style = "slant" | "slope" | "thick" | "thin" | { "any", "any" },
		-- separator_style = "padded_slope",
		-- hover = {
		-- 	enabled = true,
		-- 	delay = 200,
		-- 	reveal = { "close" },
		-- },
		highlights = {
			-- fill = {
			-- 	bg = {
			-- 		attribute = "fg",
			-- 		highlight = "Pmenu",
			-- 		-- ctermbg = 7,
			-- 		-- ctermfg = 0,
			-- 	},
			-- },
			buffer_selected = {
				fg = "#BE3B55", -- Replace with the desired foreground color
				-- bg = "<background-color>", -- Replace with the desired background color
				-- gui = "#BE3B55", -- Replace with any desired GUI attributes (e.g., "bold", "italic")
				bold = false,
				italic = true,
			},
		},
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or ""
			return " " .. icon .. count
		end,
	},
})

-- highlights = {
--     fill = {
--         ctermbg = 7
--         ctermfg = 0
--     }
-- }

-- require('bufferline').setup({
--     highlights = {
--         fill = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         background = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         tab = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         tab_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         tab_separator = {
--           fg = '<colour-value-here>',
--           bg = '<colour-value-here>',
--         },
--         tab_separator_selected = {
--           fg = '<colour-value-here>',
--           bg = '<colour-value-here>',
--           sp = '<colour-value-here>',
--           underline = '<colour-value-here>',
--         },
--         tab_close = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         close_button = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         close_button_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         close_button_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         buffer_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         buffer_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         numbers = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         numbers_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         numbers_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         diagnostic = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         hint = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         hint_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         hint_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>'
--             bold = true,
--             italic = true,
--         },
--         hint_diagnostic = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         hint_diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         hint_diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>'
--             bold = true,
--             italic = true,
--         },
--         info = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         info_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         info_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>'
--             bold = true,
--             italic = true,
--         },
--         info_diagnostic = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         info_diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         info_diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>'
--             bold = true,
--             italic = true,
--         },
--         warning = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         warning_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         warning_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>'
--             bold = true,
--             italic = true,
--         },
--         warning_diagnostic = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         warning_diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         warning_diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         error = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>'
--         },
--         error_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         error_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>'
--             bold = true,
--             italic = true,
--         },
--         error_diagnostic = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>'
--         },
--         error_diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         error_diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>'
--             bold = true,
--             italic = true,
--         },
--         modified = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         modified_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         modified_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         duplicate_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--             italic = true,
--         },
--         duplicate_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--             italic = true
--         },
--         duplicate = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--             italic = true
--         },
--         separator_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         separator_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         separator = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         indicator_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         indicator_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>'
--         },
--         pick_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         pick_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         pick = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         offset_separator = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--     };
-- })
