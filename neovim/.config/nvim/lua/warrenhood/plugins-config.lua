-- nvim-tree setup with defaults
require("nvim-tree").setup()

-- tree-sitter config
require 'nvim-treesitter.configs'.setup {
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

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })


-- Which-key config
require('which-key').setup()
require('which-key').add(
  {
    { "<leader>d", group = "Debug" },
    { "<leader>db", group = "Breakpoints" },
    { "<leader>dbc", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Breakpoint Condition" },
    { "<leader>dbm", "<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>", desc = "Log Point Message" },
    { "<leader>dbt", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Create" },
    { "<leader>dc", "<cmd>lua require('dap').scopes()<CR>", desc = "Scopes" },
    { "<leader>dh", group = "Hover" },
    { "<leader>dhh", "<cmd>lua require('dap.ui.variables').hover()<CR>", desc = "Hover" },
    { "<leader>dhv", "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", desc = "Visual Hover" },
    { "<leader>di", "<cmd>lua require('dap').toggle()<CR>", desc = "Toggle" },
    { "<leader>dr", group = "Repl" },
    { "<leader>drl", "<cmd>lua require('dap').repl.run_last()<CR>", desc = "Run Last" },
    { "<leader>dro", "<cmd>lua require('dap').repl.open()<CR>", desc = "Open" },
    { "<leader>ds", group = "Step" },
    { "<leader>dsc", "<cmd>lua require('dap').continue()<CR>", desc = "Continue" },
    { "<leader>dsi", "<cmd>lua require('dap').step_into()<CR>", desc = "Step Into" },
    { "<leader>dso", "<cmd>lua require('dap').step_out()<CR>", desc = "Step Out" },
    { "<leader>dsv", "<cmd>lua require('dap').step_over()<CR>", desc = "Step Over" },
    { "<leader>du", group = "UI" },
    { "<leader>duf", "local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", desc = "Float" },
    { "<leader>duh", "<cmd>lua require('dap.ui.widgets').hover()<CR>", desc = "Hover" },
  }
)


-- indent-blankline setup
require('ibl').setup()

-- Marks setup
require('marks').setup({
    -- whether to map keybinds or not. default true
    default_mappings = true,
    -- which builtin marks to show. default {}
    -- builtin_marks = { ".", "<", ">", "^" },
    -- whether movements cycle back to the beginning/end of buffer. default true
    cyclic = true,
    -- whether the shada file is updated after modifying uppercase marks. default false
    force_write_shada = false,
    -- how often (in ms) to redraw signs/recompute mark positions.
    -- higher values will have better performance but may cause visual lag,
    -- while lower values may cause performance penalties. default 150.
    refresh_interval = 250,
    -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
    -- marks, and bookmarks.
    -- can be either a table with all/none of the keys, or a single number, in which case
    -- the priority applies to all marks.
    -- default 10.
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    -- disables mark tracking for specific filetypes. default {}
    excluded_filetypes = {},
    -- disables mark tracking for specific buftypes. default {}
    excluded_buftypes = {},
    -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
    -- sign/virttext. Bookmarks can be used to group together positions and quickly move
    -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
    -- default virt_text is "".
    -- bookmark_0 = {
    --     sign = "⚑",
    --     virt_text = "bookmark_0",
    --     -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    --     -- defaults to false.
    --     annotate = false,
    -- },
    mappings = {}
})
