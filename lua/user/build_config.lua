local status_ok, build_config = pcall(require, "build_config")
if not status_ok then
	return
end

build_config.setup({})
