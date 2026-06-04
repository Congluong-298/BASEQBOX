fx_version 'cerulean'
game 'gta5'

description 'Events Protected - LeoVince'
version '1.0'

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

lua54 'yes'

shared_scripts {
    'dist/hook_system.js'
}
