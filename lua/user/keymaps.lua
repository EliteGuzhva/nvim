local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Map leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic
keymap("n", "r", ":redo<CR>", opts)
keymap("n", "<leader>so", ":so %<CR>", opts)

keymap("n", "-", "<C-W>-", opts)
keymap("n", "+", "<C-W>+", opts)
keymap("n", "<", "<C-W><", opts)
keymap("n", ">", "<C-W>>", opts)

keymap("i", "<C-v>", "<C-r>+", opts)

keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>x", ":xa<CR>", opts)
keymap("n", "<leader>h", ":wincmd h<CR>", opts)
keymap("n", "<leader>j", ":wincmd j<CR>", opts)
keymap("n", "<leader>k", ":wincmd k<CR>", opts)
keymap("n", "<leader>l", ":wincmd l<CR>", opts)
keymap("n", "<leader>=", ":wincmd =<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("t", "<Esc>", "<C-\\><C-N>", opts)

-- Theme
keymap("n", "<leader>ws", ':exec &background=="light" ? "set background=dark" : "set background=light"<CR>', opts)

-- Project tree
keymap("n", "<leader>pt", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>pf", ":NvimTreeFindFile<CR>", opts)

-- Tabs
keymap("n", "<leader>bc", ":Bdelete!<CR>", opts)
keymap("n", "<leader>bp", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>bn", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>bs", ":BufferLinePick<CR>", opts)
keymap("n", "<leader>bh", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<leader>bl", ":BufferLineMoveNext<CR>", opts)
keymap("n", "W", ":Bdelete!<CR>", opts)
keymap("n", "J", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "K", ":BufferLineCycleNext<CR>", opts)
keymap("n", "H", ":BufferLineMovePrev<CR>", opts)
keymap("n", "L", ":BufferLineMoveNext<CR>", opts)

-- Telescope
keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap(
	"n",
	"<C-p>",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope colorscheme<cr>", opts)
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap(
	"n",
	"<leader>fc",
	"<cmd>lua require'telescope.builtin'.commands(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)

-- VCS
keymap("n", "<leader>vk", "<cmd>Gitsigns prev_hunk<cr>", opts)
keymap("n", "<leader>vj", "<cmd>Gitsigns next_hunk<cr>", opts)
keymap("n", "<leader>vp", "<cmd>Gitsigns preview_hunk<cr>", opts)
keymap("n", "<leader>vu", "<cmd>Gitsigns reset_hunk<cr>", opts)
keymap("n", "<leader>vd", "<cmd>VCDiff<cr>", opts)
keymap("n", "<leader>vb", "<cmd>VCBlame<cr>", opts)
keymap("n", "<leader>vl", "<cmd>VCLog<cr>", opts)
keymap("n", "<leader>vr", "<cmd>VCRevert<cr>", opts)
keymap("n", "<leader>vs", "<cmd>VCStatus<cr>", opts)
keymap("n", "<leader>vvk", "<cmd>SvnGutterPrefHunk<cr>", opts)
keymap("n", "<leader>vvk", "<cmd>SvnGutterNextHunk<cr>", opts)

-- Terminal
keymap("n", "<leader>t1", "<cmd>1ToggleTerm direction=horizontal<cr>", opts)
keymap("n", "<leader>t2", "<cmd>2ToggleTerm direction=horizontal<cr>", opts)
keymap("n", "<leader>t3", "<cmd>3ToggleTerm direction=horizontal<cr>", opts)
keymap("n", "<leader>tt", "<cmd>ToggleTermToggleAll<cr>", opts)
keymap("n", "<leader>t;", "<cmd>lua _FLOAT_TOGGLE()<cr>", opts)
keymap("n", "<leader>ts", "<cmd>lua _SPLIT_TOGGLE()<cr>", opts)
keymap("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
keymap("n", "<leader>td", "<cmd>lua _LAZYDOCKER_TOGGLE()<cr>", opts)
keymap("n", "<leader>th", "<cmd>lua _HTOP_TOGGLE()<cr>", opts)
keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts)
keymap("n", "<leader>tc", "<cmd>lua _CCMAKE_TOGGLE()<cr>", opts)
keymap("n", "<leader>ta", "<cmd>lua _CLAUDE_TOGGLE()<cr>", opts)

-- Zen mode
keymap("n", "<leader>zf", "<cmd>Goyo<CR>", opts)
keymap("n", "<leader>zl", "<cmd>Limelight!!<CR>", opts)

-- Easy align
vim.cmd [[
    au FileType markdown vmap <leader>gc :EasyAlign*<Bar><Enter>
]]

-- Maximizer
keymap("n", "<leader>m", "<cmd>MaximizerToggle!<CR>", opts)

-- Startify
keymap("n", "<leader>ss", "<cmd>SSave<CR>", opts)
keymap("n", "<leader>sl", "<cmd>SLoad<CR>", opts)
keymap("n", "<leader>sd", "<cmd>SDelete<CR>", opts)
keymap("n", "<leader>sc", "<cmd>SClose<CR>", opts)

-- Debugging
keymap("n", "<F5>", "<cmd>lua _START_DEBUGGING()<CR>", opts)
keymap("n", "<F8>", "<cmd>lua _STOP_DEBUGGING()<CR>", opts)
keymap("n", "<F9>", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>", opts)
keymap("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>", opts)
keymap("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>", opts)

keymap("n", "<leader>dd", "<cmd>lua _START_DEBUGGING()<CR>", opts)
keymap("n", "<leader>de", "<cmd>lua _STOP_DEBUGGING()<CR>", opts)
keymap("n", "<leader>ds", "<cmd>lua require('dap').terminate()<CR>", opts)
keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", opts)
keymap("n", "<leader>dr", "<cmd>lua require('dap').run_last()<CR>", opts)
keymap("n", "<leader>df", "<cmd>lua require('dap').run_to_cursor()<CR>", opts)
keymap("n", "<leader>dn", "<cmd>lua require('dap').step_over()<CR>", opts)
keymap("n", "<leader>dj", "<cmd>lua require('dap').step_into()<CR>", opts)
keymap("n", "<leader>dk", "<cmd>lua require('dap').step_out()<CR>", opts)
keymap("n", "<leader>dx", "<cmd>lua require('dap').clear_breakpoints()<CR>", opts)
keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>do", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})

keymap("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", {})
keymap("n", "<leader>di", "<cmd>lua require('dapui').eval()<CR>", {})

-- LSP
keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>gn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.code_action({ apply = true })<CR>", opts)
keymap("n", "<leader>gc", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
keymap("v", "<leader>gc", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<leader>go", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap(
    "n",
    "<leader>gk",
    '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
    opts
)
keymap(
    "n",
    "<leader>gj",
    '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
    opts
)
keymap("n", "<leader>gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
keymap("n", "<leader>gs", "<cmd>ClangdSwitchSourceHeader<CR>", opts)

-- build_config
keymap("n", "<leader>cx", "<cmd>BCCMakeClean<CR>", opts)
keymap("n", "<leader>cc", "<cmd>BCCMakeConfigure<CR>", opts)
keymap("n", "<leader>cb", "<cmd>BCCMakeBuild<CR>", opts)
keymap("n", "<leader>ci", "<cmd>BCCMakeInstall<CR>", opts)

keymap("n", "<leader>cp", "<cmd>BCConanInstall<CR>", opts)

keymap("n", "<leader>cr", "<cmd>BCLaunch<CR>", opts)
keymap("n", "<leader>c;", "<cmd>BCCMakeBuildLaunch<CR>", opts)
