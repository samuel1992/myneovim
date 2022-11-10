local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "samuel.lsp.mason"
require("samuel.lsp.handlers").setup()
require "samuel.lsp.null-ls"
