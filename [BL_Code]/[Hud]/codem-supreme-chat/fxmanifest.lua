fx_version 'adamant'
game 'gta5'

author 'Negativ'
name 'codem-supreme-chat'
version '1.2'
description 'A highly advanced and customizable chat resource for FiveM.'

shared_scripts {
    'shared/config.lua',
    'shared/locales.lua',
    'GetFramework.lua'
}

client_scripts {
    'client/frameworks/esx.lua',
    'client/frameworks/qb.lua',
    'client/frameworks/standalone.lua',
    'client/functions.lua',
    'client/callbacks.lua',
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    -- '@mysql-async/lib/MySQL.lua',
    'shared/discord_config.lua',
    'server/versionchecker.lua',
    'server/functions.lua',
    'server/commands.lua',
    'server/main.lua'
}

ui_page 'html/index.html'
files {
    'html/index.html',
    'html/source/index.js',
    'html/styles/index.css',
    'html/assets/**/*'
}

escrow_ignore {
    'shared/config.lua',
    'shared/discord_config.lua',
    'shared/locales.lua',
    'client/frameworks/esx.lua',
    'client/frameworks/qb.lua',
    'client/frameworks/standalone.lua',
    'server/commands.lua',
}

exports {
    'GetSettings',
    'UpdateSettings',
    'GetRestrictedChannels'
}

lua54 'yes'