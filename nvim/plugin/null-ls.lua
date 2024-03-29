local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup_lspformat = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.black.with({
      extra_args = { "--line-length", "79" },
    }),
    -- null_ls.builtins.diagnostics.cspell.with({
    --   extra_args = { "--config", vim.fn.expand("~/.dotfiles/nvim/cspell.json") },
    -- }),
    null_ls.builtins.code_actions.cspell,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup_lspformat, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_lspformat,
        buffer = bufnr,
        callback = function()
          -- lsp_formatting(bufnr)
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup_lspformat, buffer = 0 })
  end,
  { nargs = 0 }
)
