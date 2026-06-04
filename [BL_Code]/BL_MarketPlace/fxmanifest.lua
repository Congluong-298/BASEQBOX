fx_version "cerulean"
description "BiLong Marketplace - QBCore Market System"
author "BiLong Scripts"
version '1.0.0'
lua54 'yes'
games {
    "gta5"
}

ui_page 'web/build/index.html'

shared_scripts {
    'dist/app.js',
    '@ox_lib/init.lua',
    '@qbx_core/modules/playerdata.lua',
    'shared/config.lua'
}

client_scripts {
    'client/utils.lua',
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

files {
	'web/build/index.html',
	'web/build/**/*',
}

dependencies {
    'ox_lib',
    'oxmysql',
    'qb-core'
}