fx_version 'cerulean'
game 'gta5'

author 'Dovydas'
description 'Framework for server and DB'
version '1.0.0'



client_script 'client.lua'


server_scripts {
    'server.lua',
    '@mysql-async/lib/MySQL.lua'
}


