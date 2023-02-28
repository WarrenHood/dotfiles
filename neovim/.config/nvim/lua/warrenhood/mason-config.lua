-- Setup mason and language servers
require("mason").setup()


require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "pyright" }
})


local lspconfig = require('lspconfig')
require("mason-lspconfig").setup_handlers({
	-- default handler
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {
            on_attach = function()
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Go to definition"})
                vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", { buffer = 0, desc = "Go to references"})
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0, desc = "Go to type definition"})
                vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = 0, desc = "Go to implementation"})
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0, desc = "Refactor/Rename" })
                vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0, desc = "Go to next diagnostic"})
                vim.keymap.set("n", "<leader>db", vim.diagnostic.goto_prev, { buffer = 0, desc = "Go to previous diagnostic"})
            end
        }
	end,
	-- Overrides
	-- ["sumneko_lua"] = function()
	-- 	lspconfig.sumneko_lua.setup {
	-- 		settings = {
	-- 			Lua = {
	-- 				runtime = {
	-- 					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
	-- 					version = 'LuaJIT',
	-- 				},
	-- 				diagnostics = {
	-- 					-- Get the language server to recognize the `vim` global
	-- 					globals = { 'vim' },
	-- 				},
	-- 				workspace = {
	-- 					-- Make the server aware of Neovim runtime files
	-- 					library = vim.api.nvim_get_runtime_file("", true),
	-- 				},
	-- 				-- Do not send telemetry data containing a randomized but unique identifier
	-- 				telemetry = {
	-- 					enable = false,
	-- 				},
	-- 			},
	-- 		},
	-- 	}
	-- end,
})

