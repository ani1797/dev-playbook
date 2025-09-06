return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    -- Enable lua_ls for Lua
    lspconfig.lua_ls.setup {}

    -- Enable bash-language-server for Bash/Zsh
    lspconfig.bashls.setup {}

    -- Enable ansible-language-server for Ansible
    lspconfig.ansiblels.setup {}
  end,
}
