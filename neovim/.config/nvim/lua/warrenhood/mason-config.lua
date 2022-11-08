-- Setup mason and language servers
require("mason").setup()


require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer", "pyright" }
})


local lspconfig = require('lspconfig')
require("mason-lspconfig").setup_handlers({
	-- default handler
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
	end,
	-- Overrides
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup {
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT',
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { 'vim' },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}
	end,
})

