ESX = exports['es_extended']:getSharedObject(); 

Character = {
    Locations = {
        vector4(913.6089477539064, 41.03261566162109, 111.7007293701172, 302.06787109375),
        vector4(912.9904174804688, 42.08913803100586, 111.70103454589844, 294.7151489257813),  
        vector4(912.17578125, 43.5611343383789, 111.70103454589844, 298.3343505859375)
    }, 

    States = {
        ['OpenCharacters'] = function()
            local characters = Character:GetCharacters(); 

            SetWeatherTypeNow(0x97AA0A79)

            -- [[ Create characters ]]
            Citizen.CreateThread(function()
                for i = 1, #Character.Locations do 
                    RequestModel(char); 

                    while not HasModelLoaded(char) do 
                        Citizen.Wait(1000); 
                    end

                    char = CreatePed(5, 'mp_m_freemode_01', Character.Locations[i].xyz, Character.Locations[i].w, true, true); 
                    FreezeEntityPosition(char, true); 
        
                    SetPlayerInvincible(char, true); 
                    SetBlockingOfNonTemporaryEvents(char, true); 

                    TaskPlayAnim(char, "switch@michael@parkbench_smoke_ranger", "parkbench_smoke_ranger_loop", 1.0, 0.5, 1.0, 1, 1.0, true, false, false)
                end
            end)

            -- [[ Create camera ]]
            Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true); 
            PointCamAtCoord(Camera, GetEntityCoords(char)); 
        end, 

        ['CloseCharacter'] = function()
            print('Stänger characters')
        end, 
    }, 

    Choosing = false; 
}

-- [[ Threads ]]
Citizen.CreateThread(function()
    while true do 
        local self = Character; 
        local interval = 1500; 

        if NetworkIsSessionStarted() then 
            interval = 5;

            self:SwitchState('OpenCharacters') 
            self.Choosing = true; 

            break 
        end

        if self.Choosing then 
            interval = 5; 
            
            DisplayHud(false)
            DisplayRadar(false)
        end

        Citizen.Wait(interval or 1500); 
    end
end)

-- [[ Functions ]]
function Character:SwitchState(state)
    self.currentState = state or 0; 

    self.States[state](); 

    return self.currentState
end

function Character:GetCharacters()
    ESX.TriggerServerCallback('eternity_character:GetCharacters', function(response) 
        if response then 
            return response
        else
            return false
        end
    end)
end

--createneger