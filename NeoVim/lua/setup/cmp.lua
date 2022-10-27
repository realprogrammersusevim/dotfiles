local cmp = require("cmp")

-- Setup icons
local lspkind = require("lspkind")

-- Select first item by default
vim.opt.completeopt = "menuone,noselect"

cmp.setup({
	-- Disable cmp in code comments
	-- enabled = function()
	-- disable completion if the cursor is `Comment` syntax group.
	-- return not cmp.config.context.in_syntax_group("Comment")
	-- end,
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
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
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "nvim_lua" },
		{ name = "git" },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			menu = {
				nvim_lsp = "Lsp",
				buffer = "Buf",
				luasnip = "Snip",
				nvim_lua = "Lua",
				path = "Path",
				copilot = "Copilot",
				calc = "Calc",
				emoji = "Emoji",
				git = "Git",
			},
		}),
	},
	completion = { completeopt = "menu,menuone,noinsert" },
	experimental = { ghost_text = true }, -- Shows the suggestion in italics. Esp. helpful for seeing the entire Copilot suggestion
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	filetype = { "markdown", "text", "org" },
	{
		sources = { name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "copilot" },
	},
	{ "gitcommit" },
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
