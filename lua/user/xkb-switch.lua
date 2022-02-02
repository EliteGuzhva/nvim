vim.g.XkbSwitchEnabled = true

if vim.fn.has("linux") then
  vim.g.XkbSwitchLib = "/usr/local/lib/libg3kbswitch.so"
end
