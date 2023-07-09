resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
    'client/cl_main.lua',
    'client/cl_funcs.lua',
    'client/cl_items.lua',
    'client/cl_tabs.lua',
    'client/cl_events.lua',
    'client/cl_utils.lua',
    'client/cl_ground.lua',
    'client/cl_exports.lua',
    'client/cl_storages.lua',
    'config.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/sv_main.lua',
    'server/sv_funcs.lua',
    'server/sv_tabs.lua',
    'server/sv_items.lua',
    'server/sv_exports.lua',
    'config.lua'
}

ui_page 'nui/ui.html'

files {
    'nui/**/*',
    'nui/assets/**/*',
    'nui/ui.html'
} 