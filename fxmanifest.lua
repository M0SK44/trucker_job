fx_version 'cerulean'
game 'gta5'
 
author 'M0SK4'
description 'M0SK4'
 
client_scripts { 
    'client/*.lua'
   
}
 
shared_scripts { 
    'config.lua' 
}
 
server_scripts { 
    '@mysql-async/lib/MySQL.lua',
   
    'server/*.lua' 
}

