Citizen.CreateThread(function() 
    Citizen.Wait(100); 
    
    while true do  
        local playerPed, sleepThread = PlayerPedId(), 850;  
        local pedCoords = GetEntityCoords(playerPed)

        for atmIndex = 1, #Config.Atms do  
            local atmHash = Config.Atms[atmIndex] 

            local closestAtm = GetClosestObjectOfType(pedCoords, 3.0, atmHash, false) 
            local Dst = #(GetEntityCoords(playerPed) - GetEntityCoords(closestAtm))

            if Dst <= 2.5 then  
                sleepThread = 5;   

                local displayPos = GetOffsetFromEntityInWorldCoords(closestAtm, 0.0, 0.0, 1.0)

                ESX.Game.Utils.DrawText3D(displayPos, '[~g~Z~s~] Ta ut pengar [~g~C~s~] Sätt in pengar')

                if IsControlJustReleased(0, 20) then  
                    Utils.PlayAnimation(PlayerPedId(), 'amb@prop_human_atm@male@idle_a', 'idle_a', {
                        flag = 1
                    })  

                    Action:Withdraw()
                else
                    if IsControlJustReleased(0, 26) then   
                        Utils.PlayAnimation(PlayerPedId(), 'amb@prop_human_atm@male@idle_a', 'idle_a', {
                            flag = 1
                        }) 

                        Action:Deposit()
                    end
                end
            end
        end

        Citizen.Wait(sleepThread) 
    end
end)

