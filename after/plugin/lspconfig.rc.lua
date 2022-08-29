-- This is from Takuya Matsuyama guide
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- This is from nvim-lspconfig github
local lsp_flags = {
	debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
-- Put config for other languages here. 
-- Get them from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- Don´t forget to install the server itself (separately)

require'lspconfig'.tsserver.setup{    
    on_attach = on_attach,
    flags = lsp_flags,
}

require'lspconfig'.html.setup{}

require'lspconfig'.tailwindcss.setup{}

require'lspconfig'.jsonls.setup{}

require'lspconfig'.sumneko_lua.setup{}