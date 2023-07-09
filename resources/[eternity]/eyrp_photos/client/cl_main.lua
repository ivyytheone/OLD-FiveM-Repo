Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(100);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

Citizen.CreateThread(function()
    while true do

        local Player, sleepThread = PlayerPedId(), 250

        for index, value in pairs(Config.Posistions) do
            local Distance = #(GetEntityCoords(Player) - value)

            if Distance <= 2.0 and IsPedOnFoot(Player) then
                sleepThread = 7;

                ESX.Game.Utils.DrawText3D(value, '[~g~E~s~] - Skrivare')

                if IsControlJustReleased(0, 38) then
                    Funcs.OpenMenu()
                end
            end
        end
        Citizen.Wait(sleepThread)
    end
end)

RegisterNetEvent('eyrp_photos:Init')
AddEventHandler('eyrp_photos:Init', function(data)
    local Image = data.Item.data.image

    if not Image then 
        ESX.ShowNotification('Du kan inte visa upp en tom bild', 'error')
    else
        SendNUIMessage({
            display = true,
            data = {
                Image = Image
            }
        })
    end
end)