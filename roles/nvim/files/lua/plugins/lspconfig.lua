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

    -- Python
    lspconfig.pyright.setup{}

    -- TypeScript/JavaScript
    lspconfig.ts_ls.setup{}

    -- Jinja (using 'jinja-lsp' if available, else fallback to html)
    lspconfig.html.setup{
      filetypes = { "html", "jinja", "jinja2" }
    }

    -- YAML
    lspconfig.yamlls.setup{}

    -- json
    lspconfig.jsonls.setup{}

    -- terraform
    lspconfig.terraformls.setup{}

    -- rust
    lspconfig.rust_analyzer.setup{}
  end,
}
