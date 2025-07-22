local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- Setup which-key with updated configuration
which_key.setup({
  preset = "modern",
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  win = {
    border = "rounded",
    padding = { 2, 2, 2, 2 },
    wo = {
      winblend = 0,
    }
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  keys = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  filter = function(mapping)
    return mapping.desc and mapping.desc ~= ""
  end,
  defer = function(ctx)
    return ctx.mode == "V" or ctx.mode == "<C-V>"
  end,
  replace = {
    ["<Space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  triggers = {
    { "<auto>", mode = "nxsot" },
  },
  show_help = true,
  show_keys = true,
})

-- Leader key mappings with new spec format
which_key.add({
  { "<leader>q", ":q<CR>", desc = "Quit", nowait = true, remap = false },
  { "<leader>x", ":xa<CR>", desc = "Save and quit all", nowait = true, remap = false },
  { "<leader>h", ":wincmd h<CR>", desc = "Move to left window", nowait = true, remap = false },
  { "<leader>j", ":wincmd j<CR>", desc = "Move to bottom window", nowait = true, remap = false },
  { "<leader>k", ":wincmd k<CR>", desc = "Move to top window", nowait = true, remap = false },
  { "<leader>l", ":wincmd l<CR>", desc = "Move to right window", nowait = true, remap = false },
  { "<leader>=", ":wincmd =<CR>", desc = "Equalize windows", nowait = true, remap = false },
  { "<leader>so", ":so %<CR>", desc = "Source current file", nowait = true, remap = false },
  { "<leader>m", "<cmd>MaximizerToggle!<CR>", desc = "Maximize window", nowait = true, remap = false },

  -- Theme
  { "<leader>w", group = "Theme", nowait = true, remap = false },
  { "<leader>ws", ':exec &background=="light" ? "set background=dark" : "set background=light"<CR>', desc = "Switch background", nowait = true, remap = false },

  -- Project
  { "<leader>p", group = "Project", nowait = true, remap = false },
  { "<leader>pt", ":NvimTreeToggle<CR>", desc = "Toggle tree", nowait = true, remap = false },
  { "<leader>pf", ":NvimTreeFindFile<CR>", desc = "Find file", nowait = true, remap = false },

  -- Buffer
  { "<leader>b", group = "Buffer", nowait = true, remap = false },
  { "<leader>bc", ":Bdelete!<CR>", desc = "Close buffer", nowait = true, remap = false },
  { "<leader>bp", ":BufferLineCyclePrev<CR>", desc = "Previous buffer", nowait = true, remap = false },
  { "<leader>bn", ":BufferLineCycleNext<CR>", desc = "Next buffer", nowait = true, remap = false },
  { "<leader>bs", ":BufferLinePick<CR>", desc = "Select buffer", nowait = true, remap = false },
  { "<leader>bh", ":BufferLineMovePrev<CR>", desc = "Move buffer left", nowait = true, remap = false },
  { "<leader>bl", ":BufferLineMoveNext<CR>", desc = "Move buffer right", nowait = true, remap = false },

  -- Find
  { "<leader>f", group = "Find", nowait = true, remap = false },
  { "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", desc = "Find files", nowait = true, remap = false },
  { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Search text", nowait = true, remap = false },
  { "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in current buffer", nowait = true, remap = false },
  { "<leader>ft", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
  { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics", nowait = true, remap = false },
  { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects", nowait = true, remap = false },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help", nowait = true, remap = false },
  { "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols", nowait = true, remap = false },
  { "<leader>fc", "<cmd>lua require'telescope.builtin'.commands(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", desc = "Commands", nowait = true, remap = false },

  -- Version Control
  { "<leader>v", group = "Version Control", nowait = true, remap = false },
  { "<leader>vk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk", nowait = true, remap = false },
  { "<leader>vj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk", nowait = true, remap = false },
  { "<leader>vp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk", nowait = true, remap = false },
  { "<leader>vu", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk", nowait = true, remap = false },
  { "<leader>vd", "<cmd>VCDiff<cr>", desc = "Diff", nowait = true, remap = false },
  { "<leader>vb", "<cmd>VCBlame<cr>", desc = "Blame", nowait = true, remap = false },
  { "<leader>vl", "<cmd>VCLog<cr>", desc = "Log", nowait = true, remap = false },
  { "<leader>vr", "<cmd>VCRevert<cr>", desc = "Revert", nowait = true, remap = false },
  { "<leader>vs", "<cmd>VCStatus<cr>", desc = "Status", nowait = true, remap = false },
  { "<leader>vv", group = "SVN", nowait = true, remap = false },
  { "<leader>vvk", "<cmd>SvnGutterPrefHunk<cr>", desc = "Previous hunk", nowait = true, remap = false },

  -- Terminal
  { "<leader>t", group = "Terminal", nowait = true, remap = false },
  { "<leader>t1", "<cmd>1ToggleTerm direction=horizontal<cr>", desc = "Terminal 1", nowait = true, remap = false },
  { "<leader>t2", "<cmd>2ToggleTerm direction=horizontal<cr>", desc = "Terminal 2", nowait = true, remap = false },
  { "<leader>t3", "<cmd>3ToggleTerm direction=horizontal<cr>", desc = "Terminal 3", nowait = true, remap = false },
  { "<leader>tt", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle all terminals", nowait = true, remap = false },
  { "<leader>t;", "<cmd>lua _FLOAT_TOGGLE()<cr>", desc = "Float terminal", nowait = true, remap = false },
  { "<leader>ts", "<cmd>lua _SPLIT_TOGGLE()<cr>", desc = "Split terminal", nowait = true, remap = false },
  { "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "Lazygit", nowait = true, remap = false },
  { "<leader>td", "<cmd>lua _LAZYDOCKER_TOGGLE()<cr>", desc = "Lazydocker", nowait = true, remap = false },
  { "<leader>th", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop", nowait = true, remap = false },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python", nowait = true, remap = false },
  { "<leader>tc", "<cmd>lua _CCMAKE_TOGGLE()<cr>", desc = "CCMake", nowait = true, remap = false },
  { "<leader>ta", "<cmd>lua _CLAUDE_TOGGLE()<cr>", desc = "Claude", nowait = true, remap = false },

  -- Zen mode
  { "<leader>z", group = "Zen mode", nowait = true, remap = false },
  { "<leader>zf", "<cmd>Goyo<CR>", desc = "Goyo", nowait = true, remap = false },
  { "<leader>zl", "<cmd>Limelight!!<CR>", desc = "Limelight", nowait = true, remap = false },

  -- Session
  { "<leader>s", group = "Session", nowait = true, remap = false },
  { "<leader>ss", "<cmd>SSave<CR>", desc = "Save session", nowait = true, remap = false },
  { "<leader>sl", "<cmd>SLoad<CR>", desc = "Load session", nowait = true, remap = false },
  { "<leader>sd", "<cmd>SDelete<CR>", desc = "Delete session", nowait = true, remap = false },
  { "<leader>sc", "<cmd>SClose<CR>", desc = "Close session", nowait = true, remap = false },

  -- Debug
  { "<leader>d", group = "Debug", nowait = true, remap = false },
  { "<leader>dd", "<cmd>lua _START_DEBUGGING()<CR>", desc = "Start debugging", nowait = true, remap = false },
  { "<leader>de", "<cmd>lua _STOP_DEBUGGING()<CR>", desc = "Stop debugging", nowait = true, remap = false },
  { "<leader>ds", "<cmd>lua require('dap').terminate()<CR>", desc = "Terminate", nowait = true, remap = false },
  { "<leader>dc", "<cmd>lua require('dap').continue()<CR>", desc = "Continue", nowait = true, remap = false },
  { "<leader>dr", "<cmd>lua require('dap').run_last()<CR>", desc = "Run last", nowait = true, remap = false },
  { "<leader>df", "<cmd>lua require('dap').run_to_cursor()<CR>", desc = "Run to cursor", nowait = true, remap = false },
  { "<leader>dn", "<cmd>lua require('dap').step_over()<CR>", desc = "Step over", nowait = true, remap = false },
  { "<leader>dj", "<cmd>lua require('dap').step_into()<CR>", desc = "Step into", nowait = true, remap = false },
  { "<leader>dk", "<cmd>lua require('dap').step_out()<CR>", desc = "Step out", nowait = true, remap = false },
  { "<leader>dx", "<cmd>lua require('dap').clear_breakpoints()<CR>", desc = "Clear breakpoints", nowait = true, remap = false },
  { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle breakpoint", nowait = true, remap = false },
  { "<leader>do", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Conditional breakpoint", nowait = true, remap = false },
  { "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle UI", nowait = true, remap = false },
  { "<leader>di", "<cmd>lua require('dapui').eval()<CR>", desc = "Evaluate", nowait = true, remap = false },

  -- LSP
  { "<leader>g", group = "LSP", nowait = true, remap = false },
  { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration", nowait = true, remap = false },
  { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition", nowait = true, remap = false },
  { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation", nowait = true, remap = false },
  { "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "References", nowait = true, remap = false },
  { "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover", nowait = true, remap = false },
  { "<leader>gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help", nowait = true, remap = false },
  { "<leader>gn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename", nowait = true, remap = false },
  { "<leader>gf", "<cmd>lua vim.lsp.buf.code_action({ apply = true })<CR>", desc = "Code action", nowait = true, remap = false },
  { "<leader>gc", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format", nowait = true, remap = false },
  { "<leader>go", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open float", nowait = true, remap = false },
  { "<leader>gk", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', desc = "Previous diagnostic", nowait = true, remap = false },
  { "<leader>gj", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', desc = "Next diagnostic", nowait = true, remap = false },
  { "<leader>gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Set loclist", nowait = true, remap = false },
  { "<leader>gs", "<cmd>ClangdSwitchSourceHeader<CR>", desc = "Switch source/header", nowait = true, remap = false },

  -- Build
  { "<leader>c", group = "Build", nowait = true, remap = false },
  { "<leader>cx", "<cmd>BCCMakeClean<CR>", desc = "CMake clean", nowait = true, remap = false },
  { "<leader>cc", "<cmd>BCCMakeConfigure<CR>", desc = "CMake configure", nowait = true, remap = false },
  { "<leader>cb", "<cmd>BCCMakeBuild<CR>", desc = "CMake build", nowait = true, remap = false },
  { "<leader>ci", "<cmd>BCCMakeInstall<CR>", desc = "CMake install", nowait = true, remap = false },
  { "<leader>cp", "<cmd>BCConanInstall<CR>", desc = "Conan install", nowait = true, remap = false },
  { "<leader>cr", "<cmd>BCLaunch<CR>", desc = "Run", nowait = true, remap = false },
  { "<leader>c;", "<cmd>BCCMakeBuildLaunch<CR>", desc = "Build and run", nowait = true, remap = false },
})

-- Non-leader mappings with new spec format
which_key.add({
  { "r", ":redo<CR>", desc = "Redo" },
  { "-", "<C-W>-", desc = "Decrease height" },
  { "+", "<C-W>+", desc = "Increase height" },
  { "<", "<C-W><", desc = "Decrease width" },
  { ">", "<C-W>>", desc = "Increase width" },
  { "W", ":Bdelete!<CR>", desc = "Close buffer" },
  { "J", ":BufferLineCyclePrev<CR>", desc = "Previous buffer" },
  { "K", ":BufferLineCycleNext<CR>", desc = "Next buffer" },
  { "H", ":BufferLineMovePrev<CR>", desc = "Move buffer left" },
  { "L", ":BufferLineMoveNext<CR>", desc = "Move buffer right" },
})

-- Function key mappings with new spec format
which_key.add({
  { "<F5>", "<cmd>lua _START_DEBUGGING()<CR>", desc = "Start debugging" },
  { "<F8>", "<cmd>lua _STOP_DEBUGGING()<CR>", desc = "Stop debugging" },
  { "<F9>", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
  { "<F10>", "<cmd>lua require('dap').step_over()<CR>", desc = "Step over" },
  { "<F11>", "<cmd>lua require('dap').step_into()<CR>", desc = "Step into" },
  { "<F12>", "<cmd>lua require('dap').step_out()<CR>", desc = "Step out" },
})

-- Ctrl mappings with new spec format
which_key.add({
  { "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", desc = "Find files" },
})

-- Visual mode mappings with new spec format
which_key.add({
  {
    mode = { "v" },
    { "<leader>g", group = "LSP" },
    { "<leader>gc", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format" },
    { "<", "<gv", desc = "Indent left" },
    { ">", ">gv", desc = "Indent right" },
  },
})

-- Insert mode mappings with new spec format
which_key.add({
  { "<C-v>", "<C-r>+", desc = "Paste from clipboard", mode = "i" },
})

-- Terminal mode mappings with new spec format
which_key.add({
  { "<Esc>", "<C-\\><C-N>", desc = "Exit terminal mode", mode = "t" },
})
