

-- 

fx_version 'cerulean'
game 'gta5'

name 'JLRP-RadioList'
author 'Mahan#8183'
description 'JolbakLifeRP Radio List : List of players in each radio for pma-voice'

shared_scripts {
	'Config.lua',
}

ui_page "ui/index.html"

files {
	"ui/index.html",
	"ui/script.js",
	"ui/style.css",
	"ui/microphone.png",
}

server_script {
	"Server/*.lua"
}

client_script {
	"Client/*.lua"
}
