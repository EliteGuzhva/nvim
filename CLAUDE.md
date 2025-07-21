# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration written entirely in Lua. It uses Packer.nvim for plugin management and is organized as a modular IDE-like setup with strong support for C++, Python, Rust, and other languages.

## Commands

### Plugin Management
- **Update plugins**: Open Neovim and run `:PackerSync`
- **Install new plugin**: Add to `lua/user/plugins.lua`, then `:PackerSync`
- **Clean unused plugins**: `:PackerClean`

### Build System (C++/CMake)
Key mappings for CMake/Conan projects:
- `<leader>cx` - CMake clean
- `<leader>cc` - CMake configure  
- `<leader>cb` - CMake build
- `<leader>ci` - CMake install
- `<leader>cp` - Conan install
- `<leader>cr` - Run built executable
- `<leader>tc` - Spawn ccmake in terminal

### LSP and Formatting
- **Install language servers**: `:Mason` (auto-installs configured servers)
- **Format current file**: Auto-formats on save, or `<leader>lf`
- **Show diagnostics**: `<leader>ld`
- **Code actions**: `<leader>la`

## Architecture

### Entry Point
`init.lua` loads all modules in specific order:
1. `options` - Global Neovim settings
2. `keymaps` - Key bindings
3. `plugins` - Plugin declarations and Packer setup
4. `colorscheme` - Theme configuration
5. `completion` - nvim-cmp setup
6. `mason` - LSP/tool installer
7. `lsp/` - Language server configurations
8. `telescope` - Fuzzy finder
9. `nvim-tree` - File explorer
10. Additional plugin configurations

### Key Patterns
- **Leader key**: Space
- **Module loading**: All modules use `pcall` for safe loading
- **Keymaps organized by prefix**:
  - `<leader>f*` - Telescope (find)
  - `<leader>g*` - LSP/Go-to
  - `<leader>v*` - Version control
  - `<leader>t*` - Terminal
  - `<leader>d*` - Debug (DAP)
  - `<leader>c*` - Build/compile
  - `<leader>b*` - Buffer operations

### Notable Integrations
- **Terminals**: lazygit (`<leader>tg`), lazydocker (`<leader>td`), htop (`<leader>th`), python (`<leader>tp`), claude (`<leader>ta`)
- **Debugging**: Full DAP support with adapters for C++, Python, Rust
- **AI**: ChatGPT integration (removed in recent commit)
- **Project-specific config**: Sources `.nvimrc` from project root if present

### File Structure
```
lua/user/
├── lsp/
│   ├── init.lua      # LSP setup
│   ├── handlers.lua  # LSP UI customization
│   └── null-ls.lua   # Additional formatters/linters
└── *.lua            # Feature modules
```

## Development Tips

- Modified files show in git status: `keymaps.lua` and `toggleterm.lua`
- Build directory (`build/`) is untracked
- Main branch for PRs: `master`
- Language servers and tools are auto-installed via Mason on first run
- Packer auto-syncs when `plugins.lua` is saved