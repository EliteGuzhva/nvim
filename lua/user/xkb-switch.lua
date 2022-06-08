vim.g.XkbSwitchEnabled = true

local mac_lib = "/usr/local/lib/libxkbswitch.dylib"
local linux_lib = "/usr/local/lib/libg3kbswitch.so"

if vim.loop.fs_stat(mac_lib) then
    vim.g.XkbSwitchLib = mac_lib
else
    vim.g.XkbSwitchLib = linux_lib
end
