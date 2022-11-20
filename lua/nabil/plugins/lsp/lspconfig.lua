local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local lspsignature_status, lsp_signature = pcall(require, "lsp_signature")
if not lspsignature_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
    return
end

local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' ',
  }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
  end

lsp_signature.setup({
    bind = true,
    toggle_key = '<C-s>',
    select_signature_key = '<C-n>',
    handler_opts = {
        border = "rounded"
    }
})

vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = true,
  virtual_text = {
    source = "always",  -- Or "if_many"
  },
  float = {
    border = 'rounded',
    focusable = false,
    header = { 'Dia:', 'Normal' },
    scope = 'line',
    source = "always",  -- Or "if_many"
  },
})

local keymap = vim.keymap

local on_attach = function (client, bufnr)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = { "html", "cssls", "emmet_ls" }

for _, lsp in pairs(servers) do
   lspconfig[lsp].setup({
       capabilities = capabilities,
       on_attach = on_attach
   }) 
end

typescript.setup({
    server = {
        capabilities = capabilities,
        on_attach = on_attach
    }
})

lspconfig["sumneko_lua"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

