Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    local blip = AddBlipForCoord(vector3(-800.6969604492188, -222.6223297119141, 37.07965850830078))

    SetBlipSprite(blip, 326)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, 4)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName("Bilbolaget")
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(data)
	ESX.PlayerData = data
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	ESX.PlayerData["job"] = job
end) 


Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do 
        local SleepThread, Ped, PedCoords = 1000, PlayerPedId(), GetEntityCoords(PlayerPedId()); 

        for Index, Value in pairs(Config.Locations.CarDealer) do 
            local Dst =  #(GetEntityCoords(Ped) - Value.Coords)

            if Dst < 4.0 and ESX.PlayerData.job.name == "cardealer" then 
                Utils.Draw3DText(Value.Coords, '[~g~E~w~] - ' .. Value.Text);

                if Dst < 0.3 and IsControlJustReleased(0, 38) then 
                    Funcs.OpenIndex(Index)
                end
                SleepThread = 5;
            end
        end               
          
        Wait(SleepThread)
    end
end)


RegisterNetEvent('eyrp_cardealer:AddKeyToGlovebox')
AddEventHandler('eyrp_cardealer:AddKeyToGlovebox', function(Data)
    TriggerServerEvent('eyrp_inventory:eventHandler', 'CreateTab', {
        inventory = "other",
        items = { {
          data = {
            plate = Data.Plate,
            model = Data.Model
          },
          name = "carkey",
          slot = "0",
          uuid = Utils.GenerateUUID()
        }, {
            data = {
              plate = Data.Plate,
              model = Data.Model
            },
            name = "carkey",
            slot = "1",
            uuid = Utils.GenerateUUID()
        } },
        data = { },
        title = "Handsfack",
        name = ("glovebox-%s"):format(Data.Plate),
        slots = 5
      })
end)