Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    for i = 1, #Config.Banks do 
        local blip = AddBlipForCoord(Config.Banks[i])

        SetBlipSprite(blip, 500)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 0)
        SetBlipAsShortRange(blip, true)
    
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("Bank")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(100); 

    while true do 
        local Player, sleepThread = PlayerPedId(), 850; 

        for i = 1, #Config.Banks do 
            local Dst = #(GetEntityCoords(Player) - Config.Banks[i]); 

            if Dst <= 5.0 then 
                sleepThread = 5; 

                ESX.Game.Utils.DrawText3D(Config.Banks[i], '[~g~Z~s~] Ta ut pengar [~g~C~s~] Sätt in pengar')

                if Dst <= 1.0 then 
                    if IsControlJustReleased(0, 20) then  
                        Action:Withdraw()
                    else
                        if IsControlJustReleased(0, 26) then   
                            Action:Deposit()
                        end
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)

RegisterCommand("closenui", function()
    SetNuiFocus(false, false)
end)