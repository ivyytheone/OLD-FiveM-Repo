DRUGSALES = {
    LOCATIONS = {
        vector3(810.2564697265625, -750.2412719726562, 26.78624153137207)
    }
};  

Citizen.CreateThread(function() 
    while true do  

        local playerPed, sleepThread = PlayerPedId(), 850; 

        for i = 1, #DRUGSALES.LOCATIONS do   

            local Dst = #(GetEntityCoords(playerPed) - DRUGSALES.LOCATIONS[i]); 

            if Dst <= 5.0 then  
                sleepThread = 5; 

                UTILS.DRAWTEXT3D({
                    Coords = DRUGSALES.LOCATIONS[i], 
                    Text = '[~g~E~s~] Förhandla'
                }) 

                if Dst <= 1.0 then  
                    if IsControlJustReleased(0, 38) then  
                        globalActions('openDrugsales')
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)