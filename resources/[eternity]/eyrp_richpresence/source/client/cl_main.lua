Rich = {
    AppId = "836835042402631730", 
    Asset = 'eternity',
    BigText = 'Eternity Roleplay' 
}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    ESX.TriggerServerCallback('eyrp_rich:GetIdentity', function(Data, MaxPlayers)
        while true do
            sleepThread = 250;

            if Data and MaxPlayers then
                sleepThread = 7; 

                SetRichPresence(Utils:CountPlayers() .. '/45 - ' .. Data.firstname .. ' ' .. Data.lastname)
                SetDiscordAppId(Rich.Asset)
                SetDiscordRichPresenceAsset(Rich.Asset)
                SetDiscordRichPresenceAssetText(Rich.BigText)
            end

            Citizen.Wait(sleepThread)
        end
    end)
end)
