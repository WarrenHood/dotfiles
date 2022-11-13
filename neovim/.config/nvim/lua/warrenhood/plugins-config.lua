-- nvim-tree setup with defaults
require("nvim-tree").setup()

-- tree-sitter config
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"

  ensure_installed = { "c", "lua", "rust", "bash", "python", "javascript" },


  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,


  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}


-- luasnip config
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
