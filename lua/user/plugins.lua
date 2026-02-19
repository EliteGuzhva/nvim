-- Plugins configuration for lazy.nvim
return {
  -- Required by other lua plugins
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-neotest/nvim-nio" },

  -- Themes
  { "arcticicestudio/nord-vim", lazy = true },
  { "dracula/vim", name = "dracula", lazy = true },
  { "morhetz/gruvbox", lazy = true },
  { "EliteGuzhva/gruvbox-material", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Project
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
  },

  -- Tabs
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
  },
  { "moll/vim-bbye", cmd = { "Bdelete", "Bwipeout" } },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "hrsh7th/cmp-cmdline", lazy = true },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-nvim-lua", lazy = true },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    lazy = true,
  },
  { "rafamadriz/friendly-snippets", lazy = true },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
  },
  { "rcarriga/nvim-dap-ui", lazy = true },
  { "theHamsta/nvim-dap-virtual-text", lazy = true },

  -- Mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
  },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  { "jay-babu/mason-nvim-dap.nvim", lazy = true },
  { "jay-babu/mason-null-ls.nvim", lazy = true },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-media-files.nvim",
    },
  },
  { "nvim-telescope/telescope-media-files.nvim", lazy = true },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },

  -- VCS
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  { "juneedahamed/vc.vim", cmd = { "VCStatus", "VCDiff", "VCLog" } },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    keys = { { "<leader>tf", desc = "Float terminal" } },
    cmd = { "ToggleTerm", "TermExec" },
  },

  -- Language specific
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
  {
    "dart-lang/dart-vim-plugin",
    ft = "dart",
  },
  { "EliteGuzhva/build_config.nvim", lazy = true },

  -- UI Enhancements
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  { "MunifTanjim/nui.nvim", lazy = true },

  -- AI Coding Assistant
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "claude",
      auto_suggestions_provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-5-20250929",
          auth_type = "max", -- Use Claude subscription (Pro/Max) instead of API key
          extra_request_body = {
            temperature = 0,
            max_tokens = 4096,
          },
        },
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      mappings = {
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
      hints = { enabled = true },
      windows = {
        position = "right",
        wrap = true,
        width = 30,
        sidebar_header = {
          align = "center",
          rounded = true,
        },
      },
      highlights = {
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      diff = {
        autojump = true,
        list_opener = "copen",
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  -- Misc
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  { "rcarriga/nvim-notify", lazy = true },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  -- Key bindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },

  -- Legacy vim plugins
  { "junegunn/goyo.vim", cmd = "Goyo" },
  { "junegunn/limelight.vim", cmd = "Limelight" },
  { "junegunn/vim-easy-align", cmd = { "EasyAlign", "LiveEasyAlign" } },
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "unblevable/quick-scope", keys = { "f", "F", "t", "T" } },
  { "christoomey/vim-system-copy", event = { "BufReadPost", "BufNewFile" } },
  { "szw/vim-maximizer", keys = { { "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Maximize" } } },
  { "lyokha/vim-xkbswitch", event = "InsertEnter" },
  { "JamshedVesuna/vim-markdown-preview", ft = "markdown" },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "tibabit/vim-templates", cmd = "TemplateInit" },
}
