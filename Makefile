.SILENT:

run_example:
	lua example/app.lua

test:
	busted

install_dependencies:
	luarocks install mimetypes
	luarocks install luasocket
	luarocks install busted
	luarocks install luacov
	luarocks install luafilesystem
