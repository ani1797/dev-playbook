return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    -- Example: Enable lua_ls for Lua
    lspconfig.lua_ls.setup {}
  end,
}
