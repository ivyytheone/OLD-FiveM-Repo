RegisterServerEvent('eyrp_blacklist:SendToDiscord')
AddEventHandler('eyrp_blacklist:SendToDiscord', function(Player, Data)

    local Connect = {
        {
            ["color"] = 3042555,
            ["author"] = {
                ["name"] = 'EYRP - ANTICHEAT',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/841036909965738024/859847615886000168/logo512.png'
            },
            ["description"] = 'Spelaren **' .. GetPlayerName(source) .. '** ' .. Data.Text,
            ['fields'] = {
                {
                    ['name'] = 'Position',
                    ['value'] = tostring(Data.Coords)
                },
                {
                    ['name'] = 'Modell',
                    ['value'] = tostring(Data.Model)
                },
                {
                    ['name'] = 'ID',
                    ['value'] = source
                },
            },
            ["footer"] = {
                ["text"] = os.date("*t").hour .. ':' .. os.date("*t").min .. ':' .. os.date("*t").sec .. ' - ' .. os.date('%Y-%m-%d'),
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/841036909965738024/859847615886000168/logo512.png'
            },
        }
    }
    PerformHttpRequest('https://discord.com/api/webhooks/860580275658162206/ta_tAa4BsSaHbnSL-xCaVVKODRqLLU7XIwDTyE184BJotGIHenJ8arzvhfIZcmJbYKf4', function(err, text, headers) end, 'POST', json.encode({username = "Eternity", embeds = Connect, avatar_url = "https://cdn.discordapp.com/attachments/841036909965738024/859847615886000168/logo512.png"}), { ['Content-Type'] = 'application/json' })

end)