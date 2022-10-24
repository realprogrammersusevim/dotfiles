local wk = require("which-key")

wk.register({
	e = {
		name = "Toggle File Tree",
		{ "<cmd>NvimTreeToggle<cr>", 'File Tree' },
	},

	w = {
		name = "Save",
		{ "<cmd>w!<cr>", 'Save' },
	},

	q = {
		name = "Quit",
		{ "<cmd>q<cr>", 'Quit' },
	},

	['/'] = {
	  name = 'Comment',
	  {'gcc', 'Comment'},
	},

	h = {
		name = "No Highlight",
		{ "<cmd>nohl<cr>", 'No Highlight' },
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate", "Update" },
	},

  s = {
    name = 'Search',
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  t = {
    name = 'Trouble',
    { "<cmd>TroubleToggle<cr>", "Toggle" },
  },
}, { prefix = "<leader>" })
