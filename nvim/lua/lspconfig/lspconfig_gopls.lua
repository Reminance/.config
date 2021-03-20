local M = {}
function M.setup()
    local lspconfig = require'lspconfig'
    lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
    -- Utility servers
    local map = function(type, key, value)
        vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
    end
    -- GOTO mappings
    map('n','gD','<Cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n','gd','<Cmd>lua vim.lsp.buf.definition()<CR>')
    map('n','K','<Cmd>lua vim.lsp.buf.hover()<CR>')
    map('n','gr','<Cmd>lua vim.lsp.buf.references()<CR>')
    map('n','gs','<Cmd>lua vim.lsp.buf.signature_help()<CR>')
    map('n','gi','<Cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n','gt','<Cmd>lua vim.lsp.buf.type_definition()<CR>')
    map('n','gw','<Cmd>lua vim.lsp.buf.document_symbol()<CR>')
    map('n','gW','<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    -- ACTION mappings
    map('n','<Leader>ah',  '<Cmd>lua vim.lsp.buf.hover()<CR>')
    map('n','<A-CR>', '<Cmd>lua require"jdtls".code_action()<CR>')
    map('n','<Leader>ar',  '<Cmd>lua vim.lsp.buf.rename()<CR>')
    -- Few language severs support these three
    map('n','<Leader>a=',  '<Cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n','<Leader>ai',  '<Cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    map('n','<Leader>ao',  '<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
    -- Diagnostics mapping
    map('n','<Leader>ee', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    map('n','<Leader>en', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n','<Leader>ep', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
end

return M
