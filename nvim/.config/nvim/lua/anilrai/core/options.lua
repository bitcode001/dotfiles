local opt = vim.opt -- for reference and conciseness

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- linewrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = false

--appearance
opt.termguicolors = true
-- opt.background = "dark"
opt.signcolumn = "yes"
vim.cmd("highlight SignColumn ctermbg=NONE guibg=NONE")

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")
opt.clipboard:append("unnamedplus") -- force nvim to use system clipboard

-- split windows
opt.splitright = true
opt.splitbelow = true

-- opt.iskeyword:append("-")
