local status, null_ls = pcall(require, "null-ls")
if not status then
  print("null-ls no está instalado")
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Función mejorada para formateo al guardar
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- Solo usar null-ls para formateo
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
    async = false, -- Importante: hacerlo sincrónico para que termine antes de guardar
  })
end

-- Configuración de eslint_d como antes
local eslint_d_source = {
  name = "eslint_d",
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  generator = null_ls.generator({
    command = "/home/kali/.nvm/versions/node/v23.9.0/bin/eslint_d",
    args = { "--stdin", "--stdin-filename", "$FILENAME", "--format", "json" },
    to_stdin = true,
    from_stderr = true,
    format = "json",
    check_exit_code = function(code)
      return code <= 1
    end,
    on_output = function(params)
      local parser = require("null-ls.helpers").make_ts_parser()
      return parser(params)
    end,
  }),
}

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "html",
        "css",
        "json",
        "yaml",
        "markdown"
      },
      extra_args = { "--prose-wrap", "always" } -- Ejemplo de argumentos adicionales
    }),
    eslint_d_source,
    null_ls.builtins.diagnostics.fish
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- Configurar autoformateo al guardar
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})
