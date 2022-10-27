local cmp = require("cmp")

-- Setup icons
local lspkind = require("lspkind")

-- Select first item by default
vim.opt.completeopt = "menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["luasnip"].lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<S-Tab>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "copilot" },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			menu = {
				nvim_lsp = "[LSP]",
				buffer = "[BUF]",
				luasnip = "[Lua]",
				nvim_lua = "[Lua]",
				path = "[PATH]",
				vsnip = "[VSNIP]",
				copilot = "[COPILOT]",
			},
		}),
	},
	completion = { completeopt = "menu,menuone,noinsert" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup lspconfig
-- Python
require("lspconfig").pyright.setup({ capabilities = capabilities })

-- Lua
require("lspconfig").sumneko_lua.setup({ capabilities = capabilities })

-- Bash
require("lspconfig").bashls.setup({ capabilities = capabilities })

-- Rust
require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })

--
