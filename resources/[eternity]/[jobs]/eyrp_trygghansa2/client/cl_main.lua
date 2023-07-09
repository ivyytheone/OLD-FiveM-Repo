ESX = {}

TriggerEvent("esx:getSharedObject", function(data)
    ESX = data
end)

PlayerData = ESX.GetPlayerData()

local function HandleMarker(office)
    if (office["name"] == "Datorn") then
        if (PlayerData["job"].name == "trygghansa") then
            Insurance.open()
        else
            ESX.ShowNotification("Du måste jobbar här för detta", "error")
        end
    elseif (office["name"] == "Åk ner") then
        SetEntityCoordsNoOffset(PlayerPedId(), Config["Locations"][3].coords) 
    elseif (office["name"] == "Gå in") then 
        SetEntityCoordsNoOffset(PlayerPedId(), Config["Locations"][2].coords) 
    end
end

Citizen.CreateThread(function()

    Blip = AddBlipForCoord(Config["Locations"][3].coords)

    SetBlipAsShortRange(Blip, true)
    SetBlipSprite(Blip, 79)
    SetBlipColour(Blip, 0)
    SetBlipScale(Blip, 0.8)


    AddTextEntry(Blip, "Trygghansa")
    BeginTextCommandSetBlipName(Blip)
    AddTextComponentSubstringPlayerName("me")
    EndTextCommandSetBlipName(Blip)

    while true do 
        local sleep = 250

        for _, office in pairs(Config.Locations) do 
            local distance = #(GetEntityCoords(PlayerPedId()) - office.coords) 

            if (distance <= 6.0) then
                sleep = 7                   

                ESX.Game.Utils.DrawText3D(office.coords, ("~r~[E]~s~ %s"):format(office.name), 0.4, 0)
                
                if (distance <= 1.0) then
                    if (IsControlJustReleased(0, 38)) then 
                        Wait(150)
                        HandleMarker(office)
                    end
                end
            end

        end
        Citizen.Wait(sleep)
    end 
end)



