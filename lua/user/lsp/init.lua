-- Setup handlers (diagnostics, LspAttach autocmd) first
require("user.lsp.handlers").setup()

local capabilities = require("user.lsp.handlers").capabilities

local function root_dir()
	return vim.uv.cwd()
end

-- Server configurations: name -> config
local servers = {
	bashls = {
		cmd = { "bash-language-server", "start" },
		filetypes = { "sh", "bash" },
	},
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--header-insertion=iwyu",
			"--completion-style=detailed",
			"--function-arg-placeholders",
			"--fallback-style=llvm",
		},
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		init_options = {
			usePlaceholders = true,
			completeUnimported = true,
			clangdFileStatus = true,
		},
	},
	cmake = {
		cmd = { "cmake-language-server" },
		filetypes = { "cmake" },
	},
	dartls = {
		cmd = { "dart", "language-server", "--protocol=lsp" },
		filetypes = { "dart" },
	},
	dockerls = {
		cmd = { "docker-langserver", "--stdio" },
		filetypes = { "dockerfile" },
	},
	docker_compose_language_service = {
		cmd = { "docker-compose-langserver", "--stdio" },
		filetypes = { "yaml.docker-compose" },
	},
	jsonls = {
		cmd = { "vscode-json-language-server", "--stdio" },
		filetypes = { "json", "jsonc" },
	},
	lua_ls = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	pyright = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "basic",
				},
			},
		},
	},
	rust_analyzer = {
		cmd = { "rust-analyzer" },
		filetypes = { "rust" },
	},
	yamlls = {
		cmd = { "yaml-language-server", "--stdio" },
		filetypes = { "yaml", "yaml.docker-compose" },
	},
}

-- Create FileType autocmds that start each server via vim.lsp.start()
for name, config in pairs(servers) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = config.filetypes,
		callback = function(args)
			vim.lsp.start({
				name = name,
				cmd = config.cmd,
				root_dir = root_dir(),
				capabilities = capabilities,
				settings = config.settings,
				init_options = config.init_options,
			}, { bufnr = args.buf })
		end,
	})
end

require("user.lsp.none-ls")
