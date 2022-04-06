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
keymap("n", "<leader>tt", "<cmd>ToggleTerm<cr>", opts)
keymap("n", "<leader>t;", "<cmd>ToggleTerm<cr>", opts)
keymap("n", "<leader>ts", "<cmd>lua _SPLIT_TOGGLE()<cr>", opts)
keymap("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
keymap("n", "<leader>td", "<cmd>lua _LAZYDOCKER_TOGGLE()<cr>", opts)
keymap("n", "<leader>th", "<cmd>lua _HTOP_TOGGLE()<cr>", opts)
keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts)

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
function _START_DEBUGGING()
    vim.cmd("NvimTreeClose")
    vim.cmd("call vimspector#Launch()")
end

keymap("n", "<leader>dd", "<cmd>lua _START_DEBUGGING()<CR>", opts)
keymap("n", "<leader>de", "<cmd>call vimspector#Reset()<CR>", opts)
keymap("n", "<leader>ds", "<cmd>call vimspector#Stop()<CR>", opts)
keymap("n", "<leader>dr", "<cmd>call vimspector#Restart()<CR>", opts)
keymap("n", "<leader>dc", "<cmd>call vimspector#Continue()<CR>", opts)
keymap("n", "<leader>df", "<cmd>call vimspector#RunToCursor()<CR>", opts)
keymap("n", "<leader>db", "<cmd>call vimspector#ToggleBreakpoint()<CR>", opts)
keymap("n", "<leader>do", "<cmd>call vimspector#ToggleBreakpoint(", {})
keymap("n", "<leader>dw", "<cmd>call vimspector#AddWatch(", {})
keymap("n", "<leader>dn", "<cmd>call vimspector#StepOver()<CR>", opts)
keymap("n", "<leader>dj", "<cmd>call vimspector#StepInto()<CR>", opts)
keymap("n", "<leader>dk", "<cmd>call vimspector#StepOut()<CR>", opts)
keymap("n", "<leader>dh", "<cmd>call vimspector#UpFrame()<CR>", opts)
keymap("n", "<leader>dl", "<cmd>call vimspector#DownFrame()<CR>", opts)
keymap("n", "<leader>dx", "<cmd>call vimspector#ClearBreakpoints()<CR>", opts)
keymap("n", "<leader>di", "<Plug>VimspectorBalloonEval", {})

-- build_config
keymap("n", "<leader>cx", "<cmd>BCCMakeClean<CR>", opts)
keymap("n", "<leader>cc", "<cmd>BCCMakeConfigure<CR>", opts)
keymap("n", "<leader>cb", "<cmd>BCCMakeBuild<CR>", opts)
keymap("n", "<leader>ci", "<cmd>BCCMakeInstall<CR>", opts)

keymap("n", "<leader>cp", "<cmd>BCConanInstall<CR>", opts)

keymap("n", "<leader>cr", "<cmd>BCLaunch<CR>", opts)
keymap("n", "<leader>c;", "<cmd>BCCMakeBuildLaunch<CR>", opts)
