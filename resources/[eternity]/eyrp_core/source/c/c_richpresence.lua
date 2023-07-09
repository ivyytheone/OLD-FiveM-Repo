CreateThread(function()
    Wait(100)
    while true do
        local sleepThread = 5000;

        if ESX.IsPlayerLoaded() then
            
            ESX.TriggerServerCallback('eyrp_core:richPresence', function(data)
                SetRichPresence('Rollspelar som ' .. data.firstname .. ' ' .. data.lastname)
                SetDiscordRichPresenceAssetSmallText(Funcs.CountPlayers() .. '/' .. data.maxplayers)  
            end)

        else      
            SetRichPresence('Laddar in...')
            SetDiscordRichPresenceAssetSmallText('Laddar in ...')  
        end

        SetDiscordAppId(Config.RichPresence.AppId)
        SetDiscordRichPresenceAssetText('Eternity')
        SetDiscordRichPresenceAsset(Config.RichPresence.Assets.Big)
        SetDiscordRichPresenceAssetSmall(Config.RichPresence.Assets.Small)

        if Config.RichPresence.Button1.Enable then
            SetDiscordRichPresenceAction(0, Config.RichPresence.Button1.Text, Config.RichPresence.Button1.URL)
        end

        if Config.RichPresence.Button2.Enable then
            SetDiscordRichPresenceAction(1, Config.RichPresence.Button2.Text, Config.RichPresence.Button2.URL)
        end

        Wait(sleepThread)
    end
end)