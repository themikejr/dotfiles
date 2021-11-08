local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    require('completion').on_attach(client)
    --require'completion'.on_attach(client, bufnr)
  --local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- Mappings.
  --local opts = { noremap=true, silent=true }
  --buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --...
end

local saga = require('lspsaga')

--saga.init_lsp_saga {
  --error_sign = '',
  --warn_sign = '',
  --hint_sign = '',
  --infor_sign = '',
  --border_style = "round",
--}

saga.init_lsp_saga()

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = "maintained"
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

require('spellsitter').setup()
