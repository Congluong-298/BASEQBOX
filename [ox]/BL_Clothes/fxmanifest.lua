fx_version "cerulean"
game {"gta5"}

author "LuaNest Studio"
description "BL_Clothes"
version "1.0.0"
-- repository ""
lua54 'yes'

escrow_ignore {'config/*', "web/**/*", "web/src/**/*"}

shared_scripts {'config/config.lua', "@ox_lib/init.lua"}

ui_page 'web/build/index.html'

client_scripts {"client/*.lua"}

server_scripts {"@oxmysql/lib/MySQL.lua", "server/*.lua"}

files {'web/build/index.html', 'web/build/**/*', 'web/public/images/*.png'}

dependencies {"ox_lib", "screenshot-basic"}
