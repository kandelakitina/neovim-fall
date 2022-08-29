local keymap = vim.keymap
local opts = { noremap=true }

-- Bind leader key
vim.g.mapleader = ' '

-- Do not yank with "x"
keymap.set('n', 'x', '"_x')

-- Increment/decrement with "-" and "+"
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Ctrl-C Ctrl-V to copy / past
keymap.set('v', '<C-c>', '"+y')
keymap.set('n', '<C-S-v>', '"+p')
keymap.set('c', '<C-S-v>', '<C-r>+')
keymap.set('i', '<C-S-v>', '<C-r>+')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', '<M-t>', ':tabedit<Return>')

-- Split window
keymap.set('n', '<M-s>', ':split<Return><C-w>w')
keymap.set('n', '<M-v>', ':vsplit<Return><C-w>w')

-- Jump to windows
keymap.set('', '<M-w>', '<C-w>w')
keymap.set('', '<M-h>', '<C-w>h')
keymap.set('', '<M-k>', '<C-w>k')
keymap.set('', '<M-j>', '<C-w>j')
keymap.set('', '<M-l>', '<C-w>l')
keymap.set('', '<M-q>', ':close!<Return>')

-- Resizing panes
keymap.set("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap.set("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap.set("n", "<Up>", ":resize -1<CR>", default_opts)
keymap.set("n", "<Down>", ":resize +1<CR>", default_opts)

-- Cycle buffers
keymap.set('n', '<C-l>', ':bNext<Return>')
keymap.set('n', '<C-h>', ':bprevious<Return>')

-- Cycle tabs (Requires BufferLine)
keymap.set('n', '<M-,>', '<Cmd>BufferLineCycleNext<CR>', {})
keymap.set('n', '<M-.>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- This is from nvim-lspconfig for using LSP
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Center search results
keymap.set("n", "n", "nzz", default_opts)
keymap.set("n", "N", "Nzz", default_opts)

-- Better indent
keymap.set("v", "<", "<gv", default_opts)
keymap.set("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap.set("v", "p", '"_dP', default_opts)

-- Cancel search highlighting with ESC
keymap.set("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap.set("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap.set("x", "J", ":move '>+1<CR>gv-gv", default_opts)


--[[ This from Takuya
-- LSP navigation mappings
-- ===========
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
--]]

-- LSP Mappings
keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
keymap.set('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>cf', ':lua vim.lsp.buf.formatting()<CR>')

-- CMP (autocompletion snippet) mappings
local status, cmp = pcall(require, "cmp")
if (not status) then return end

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
})

-- See Telescope Mappings in Telescope.rc.lua

local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga()

-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>ca", "<cmd>Lspsaga range_code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Definition preview (not always working)
keymap("n", "gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

local action = require("lspsaga.action")
-- scroll in hover doc or  definition preview window
vim.keymap.set("n", "<C-d>", function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll in hover doc or  definition preview window
vim.keymap.set("n", "<C-u>", function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })

local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Open file/folder in git repository
    browse = "<Leader>go",
  }
})

