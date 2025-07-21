local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["q"] = { ":q<CR>", "Quit" },
  ["x"] = { ":xa<CR>", "Save and quit all" },
  ["h"] = { ":wincmd h<CR>", "Move to left window" },
  ["j"] = { ":wincmd j<CR>", "Move to bottom window" },
  ["k"] = { ":wincmd k<CR>", "Move to top window" },
  ["l"] = { ":wincmd l<CR>", "Move to right window" },
  ["="] = { ":wincmd =<CR>", "Equalize windows" },
  ["so"] = { ":so %<CR>", "Source current file" },
  ["m"] = { "<cmd>MaximizerToggle!<CR>", "Maximize window" },

  ["w"] = {
    name = "Theme",
    ["s"] = { ':exec &background=="light" ? "set background=dark" : "set background=light"<CR>', "Switch background" },
  },

  ["p"] = {
    name = "Project",
    ["t"] = { ":NvimTreeToggle<CR>", "Toggle tree" },
    ["f"] = { ":NvimTreeFindFile<CR>", "Find file" },
  },

  ["b"] = {
    name = "Buffer",
    ["c"] = { ":Bdelete!<CR>", "Close buffer" },
    ["p"] = { ":BufferLineCyclePrev<CR>", "Previous buffer" },
    ["n"] = { ":BufferLineCycleNext<CR>", "Next buffer" },
    ["s"] = { ":BufferLinePick<CR>", "Select buffer" },
    ["h"] = { ":BufferLineMovePrev<CR>", "Move buffer left" },
    ["l"] = { ":BufferLineMoveNext<CR>", "Move buffer right" },
  },

  ["f"] = {
    name = "Find",
    ["f"] = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "Find files" },
    ["s"] = { "<cmd>Telescope live_grep<cr>", "Search text" },
    ["l"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in current buffer" },
    ["t"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    ["d"] = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    ["p"] = { "<cmd>Telescope projects<cr>", "Projects" },
    ["h"] = { "<cmd>Telescope help_tags<cr>", "Help" },
    ["o"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
    ["c"] = { "<cmd>lua require'telescope.builtin'.commands(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "Commands" },
  },

  ["v"] = {
    name = "Version Control",
    ["k"] = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
    ["j"] = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
    ["p"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
    ["u"] = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
    ["d"] = { "<cmd>VCDiff<cr>", "Diff" },
    ["b"] = { "<cmd>VCBlame<cr>", "Blame" },
    ["l"] = { "<cmd>VCLog<cr>", "Log" },
    ["r"] = { "<cmd>VCRevert<cr>", "Revert" },
    ["s"] = { "<cmd>VCStatus<cr>", "Status" },
    ["v"] = {
      name = "SVN",
      ["k"] = { "<cmd>SvnGutterPrefHunk<cr>", "Previous hunk" },
    },
  },

  ["t"] = {
    name = "Terminal",
    ["1"] = { "<cmd>1ToggleTerm direction=horizontal<cr>", "Terminal 1" },
    ["2"] = { "<cmd>2ToggleTerm direction=horizontal<cr>", "Terminal 2" },
    ["3"] = { "<cmd>3ToggleTerm direction=horizontal<cr>", "Terminal 3" },
    ["t"] = { "<cmd>ToggleTermToggleAll<cr>", "Toggle all terminals" },
    [";"] = { "<cmd>lua _FLOAT_TOGGLE()<cr>", "Float terminal" },
    ["s"] = { "<cmd>lua _SPLIT_TOGGLE()<cr>", "Split terminal" },
    ["g"] = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
    ["d"] = { "<cmd>lua _LAZYDOCKER_TOGGLE()<cr>", "Lazydocker" },
    ["h"] = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    ["p"] = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    ["c"] = { "<cmd>lua _CCMAKE_TOGGLE()<cr>", "CCMake" },
    ["a"] = { "<cmd>lua _CLAUDE_TOGGLE()<cr>", "Claude" },
  },

  ["z"] = {
    name = "Zen mode",
    ["f"] = { "<cmd>Goyo<CR>", "Goyo" },
    ["l"] = { "<cmd>Limelight!!<CR>", "Limelight" },
  },

  ["s"] = {
    name = "Session",
    ["s"] = { "<cmd>SSave<CR>", "Save session" },
    ["l"] = { "<cmd>SLoad<CR>", "Load session" },
    ["d"] = { "<cmd>SDelete<CR>", "Delete session" },
    ["c"] = { "<cmd>SClose<CR>", "Close session" },
  },

  ["d"] = {
    name = "Debug",
    ["d"] = { "<cmd>lua _START_DEBUGGING()<CR>", "Start debugging" },
    ["e"] = { "<cmd>lua _STOP_DEBUGGING()<CR>", "Stop debugging" },
    ["s"] = { "<cmd>lua require('dap').terminate()<CR>", "Terminate" },
    ["c"] = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
    ["r"] = { "<cmd>lua require('dap').run_last()<CR>", "Run last" },
    ["f"] = { "<cmd>lua require('dap').run_to_cursor()<CR>", "Run to cursor" },
    ["n"] = { "<cmd>lua require('dap').step_over()<CR>", "Step over" },
    ["j"] = { "<cmd>lua require('dap').step_into()<CR>", "Step into" },
    ["k"] = { "<cmd>lua require('dap').step_out()<CR>", "Step out" },
    ["x"] = { "<cmd>lua require('dap').clear_breakpoints()<CR>", "Clear breakpoints" },
    ["b"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
    ["o"] = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Conditional breakpoint" },
    ["u"] = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle UI" },
    ["i"] = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate" },
  },

  ["g"] = {
    name = "LSP",
    ["D"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
    ["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
    ["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
    ["r"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    ["h"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["H"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
    ["n"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    ["f"] = { "<cmd>lua vim.lsp.buf.code_action({ apply = true })<CR>", "Code action" },
    ["c"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
    ["o"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float" },
    ["k"] = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Previous diagnostic" },
    ["j"] = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "Next diagnostic" },
    ["l"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Set loclist" },
    ["s"] = { "<cmd>ClangdSwitchSourceHeader<CR>", "Switch source/header" },
  },

  ["c"] = {
    name = "Build",
    ["x"] = { "<cmd>BCCMakeClean<CR>", "CMake clean" },
    ["c"] = { "<cmd>BCCMakeConfigure<CR>", "CMake configure" },
    ["b"] = { "<cmd>BCCMakeBuild<CR>", "CMake build" },
    ["i"] = { "<cmd>BCCMakeInstall<CR>", "CMake install" },
    ["p"] = { "<cmd>BCConanInstall<CR>", "Conan install" },
    ["r"] = { "<cmd>BCLaunch<CR>", "Run" },
    [";"] = { "<cmd>BCCMakeBuildLaunch<CR>", "Build and run" },
  },
}

-- Non-leader mappings
local non_leader_mappings = {
  ["r"] = { ":redo<CR>", "Redo" },
  ["-"] = { "<C-W>-", "Decrease height" },
  ["+"] = { "<C-W>+", "Increase height" },
  ["<"] = { "<C-W><", "Decrease width" },
  [">"] = { "<C-W>>", "Increase width" },
  ["W"] = { ":Bdelete!<CR>", "Close buffer" },
  ["J"] = { ":BufferLineCyclePrev<CR>", "Previous buffer" },
  ["K"] = { ":BufferLineCycleNext<CR>", "Next buffer" },
  ["H"] = { ":BufferLineMovePrev<CR>", "Move buffer left" },
  ["L"] = { ":BufferLineMoveNext<CR>", "Move buffer right" },
}

-- Function key mappings
local function_key_mappings = {
  ["<F5>"] = { "<cmd>lua _START_DEBUGGING()<CR>", "Start debugging" },
  ["<F8>"] = { "<cmd>lua _STOP_DEBUGGING()<CR>", "Stop debugging" },
  ["<F9>"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
  ["<F10>"] = { "<cmd>lua require('dap').step_over()<CR>", "Step over" },
  ["<F11>"] = { "<cmd>lua require('dap').step_into()<CR>", "Step into" },
  ["<F12>"] = { "<cmd>lua require('dap').step_out()<CR>", "Step out" },
}

-- Ctrl mappings
local ctrl_mappings = {
  ["<C-p>"] = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "Find files" },
}

-- Visual mode mappings
local visual_mappings = {
  ["<leader>"] = {
    ["g"] = {
      name = "LSP",
      ["c"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
    },
  },
  ["<"] = { "<gv", "Indent left" },
  [">"] = { ">gv", "Indent right" },
}

-- Insert mode mappings
local insert_mappings = {
  ["<C-v>"] = { "<C-r>+", "Paste from clipboard" },
}

-- Terminal mode mappings
local terminal_mappings = {
  ["<Esc>"] = { "<C-\\><C-N>", "Exit terminal mode" },
}

-- Setup
which_key.setup({
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
  operators = { gc = "Comments" },
  key_labels = {},
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

-- Register all mappings
which_key.register(mappings, opts)
which_key.register(non_leader_mappings, { mode = "n" })
which_key.register(function_key_mappings, { mode = "n" })
which_key.register(ctrl_mappings, { mode = "n" })
which_key.register(visual_mappings, { mode = "v" })
which_key.register(insert_mappings, { mode = "i" })
which_key.register(terminal_mappings, { mode = "t" })