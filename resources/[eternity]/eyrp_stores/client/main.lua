ESX = {}
cachedD = {
    Showing = true
}

TriggerEvent("esx:getSharedObject", function(lib)
    ESX = lib
end)

ESX.PlayerData = ESX.GetPlayerData()


Citizen.CreateThread(function()
    for k, v in pairs(Config.Shops) do 
        cachedD.Blip = AddBlipForCoord(v)
        SetBlipAsShortRange(cachedD.Blip, true)
        SetBlipSprite(cachedD.Blip, Config.Blip.Sprite)
        SetBlipColour(cachedD.Blip, Config.Blip.Color)

        SetBlipScale(cachedD.Blip, Config.Blip.Scale)

        AddTextEntry(Config.Blip.Name, Config.Blip.Name)
        BeginTextCommandSetBlipName(Config.Blip.Name)
        AddTextComponentSubstringPlayerName("me")
        EndTextCommandSetBlipName(cachedD.Blip)


        Stores.CreateMarker(v)
    end
end)

Citizen.CreateThread(function()
    SetNuiFocus(false, false)
    while true do 
        local player, sleep = PlayerPedId(), 250

        for key, value in pairs(Config.Shops) do 
            local distance = #(GetEntityCoords(player) - value)

            if distance < 3.0 and not IsPedDeadOrDying(player, true) then
                sleep = 10
                ESX.Game.Utils.DrawText3D(value, "[~g~E~s~] - Öppna butiken")
                if distance < 1.5 and not IsPedDeadOrDying(player, true) then
                    if IsControlJustPressed(0, 38) and not IsPedDeadOrDying(player, false) then 
                        Stores.Open()
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

