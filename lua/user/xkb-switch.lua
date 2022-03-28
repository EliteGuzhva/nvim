vim.g.XkbSwitchEnabled = true

if vim.fn.has("mac") then
  vim.g.XkbSwitchLib = "/usr/local/lib/libxkbswitch.dylib"
else
  vim.g.XkbSwitchLib = "/usr/local/lib/libg3kbswitch.so"
end
