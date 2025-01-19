local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
  auto_install = false,
  ensure_installed = {},
  highlight = { enable = true },
  ignore_install = {},
  indent = { enable = true },
  modules = {},
  rainbow = { enable = true },
  sync_install = false,
}

