-- Example for Lua language server
vim.lsp.config("lua_ls", {
  -- your settings here
})
vim.lsp.config("docker_language_server", {
  -- your settings here
})
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("docker_language_server")
