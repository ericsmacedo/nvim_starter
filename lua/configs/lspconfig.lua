require("nvchad.configs.lspconfig").defaults()

require("nvchad.configs.lspconfig").defaults()

local servers = { "pylsp", "jedi_language_server", "verible"}

-- read :h vim.lsp.config for changing options of lsp servers 
--
--
vim.lsp.config('pylsp', {
  cmd = {vim.call("expand", "~/.config/nvim/env/bin/pylsp")},
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E226'},
          maxLineLength = 88
        }
      }
    }
  }
})

vim.lsp.config('jedi_language_server', {
  cmd = {vim.call("expand", "~/.config/nvim/env/bin/jedi-language-server")},
})


vim.lsp.enable(servers)
