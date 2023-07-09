ESX = nil  

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

Utils = {};

RegisterServerEvent('eyrp_devtoolsBlocker')
AddEventHandler('eyrp_devtoolsBlocker', function()
    local idx = exports['eyrp_tools']:GetPlayerIdentifiers(source);

    print(idx.ip)
    print(idx.steam)
    print(idx.discord)
    -- for idx, val in pairs(Config.Allowlist) do

    --     if val ~= nil and value == idx.steam then
    --         return
    --     else
    --         DropPlayer(source, Config.DropText)
    --         Utils.SendToDiscord(idx, source)
    --     end
    -- end
end)

Utils.SendToDiscord = function(Data, Player)

    local Connect = {
        {
            ["color"] = 3042555,
            ["author"] = {
                ["name"] = 'NUI-Devtools',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/841036909965738024/859847615886000168/logo512.png'
            },
            ["description"] = 'Spelaren **' .. GetPlayerName(Player) .. '** har försökt öppna NUI Devtools',
            ['fields'] = {
                {
                    ['name'] = 'IP-Adress',
                    ['value'] = Data.ip:gsub('ip:', '')
                },
                {
                    ['name'] = 'Discord',
                    ['value'] = '<@' .. Data.discord:gsub("discord:", "") .. '>'
                },
                {
                    ['name'] = 'HEX',
                    ['value'] = Data.steam
                },
            },
            ["footer"] = {
                ["text"] = os.date("*t").hour .. ':' .. os.date("*t").min .. ':' .. os.date("*t").sec .. ' - ' .. os.date('%Y-%m-%d'),
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/841036909965738024/859847615886000168/logo512.png'
            },
        }
    }
    PerformHttpRequest(Config.Webbhook, function(err, text, headers) end, 'POST', json.encode({username = "Eternity", embeds = Connect, avatar_url = "https://cdn.discordapp.com/attachments/841036909965738024/859847615886000168/logo512.png"}), { ['Content-Type'] = 'application/json' })
end