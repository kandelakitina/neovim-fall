vim.cmd('autocmd!')

local api = vim.api
local g = vim.g
local opt = vim.opt

vim.wo.number = true
opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = 'bash'
opt.backupskip = '/tmp/*,/private/tmp/*'
opt.inccommand = 'split'
opt.ignorecase = true
opt.smartcase = true -- Smart case
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ai = true				-- Auto indent
opt.si = true				-- Smart indent
opt.wrap = false			-- No wrap lines
opt.backspace = 'start,eol,indent'
opt.path:append { '**' }	-- Search down in folder
opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode 
api.nvim_create_autocmd("InsertLeave", {
pattern = '*',
command = "set nopaste",
})

api.nvim_command([[
	autocmd InsertEnter * hi Normal guibg=#190f19
	autocmd InsertLeave * hi Normal guibg=#0B0E14
]])

-- Colorscheme bindings
vim.cmd [[colorscheme ayu-dark]]

opt.swapfile = false -- Disable swap files
opt.termguicolors = true -- Enable colors in terminal
opt.number = true --Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse = "a" --Enable mouse mode
opt.undofile = true --Save undo history
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Time in milliseconds to wait for a mapped sequence to complete.
opt.timeoutlen = 300

opt.cmdheight = 0

opt.wildignorecase = true
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"
opt.wildignore:append "**/build/*"

-- Better Netrw
g.netrw_banner = 0 -- Hide banner
g.netrw_browse_split = 4 -- Open in previous window
g.netrw_altv = 1 -- Open with right splitting
g.netrw_liststyle = 3 -- Tree-style view
g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore

-- Colorscheme bindings
vim.cmd [[colorscheme ayu-dark]]