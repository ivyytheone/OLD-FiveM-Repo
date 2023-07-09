RegisterNetEvent('eyrp_nightclub:eventHandler')
AddEventHandler('eyrp_nightclub:eventHandler', function(Event)  
    if Event == "EnterInterior" then  
        ESX.Game.Teleport(PlayerPedId(), Config["Locations"]["ClubInterior"]["Coords"], function() 
            RequestScriptAudioBank("DLC_BATTLE/BTL_CLUB_OPEN_TRANSITION_CROWD", false, -1)
            SetAmbientZoneState("IZ_ba_dlc_int_01_ba_Int_01_main_area", 0, 0)

            Citizen.Wait(1000)
        
            PlaySoundFrontend(-1, "club_crowd_transition", "dlc_btl_club_open_transition_crowd_sounds", true)
        end)
    end

    if Event == "ClubInterior" then  
        ESX.Game.Teleport(PlayerPedId(), Config["Locations"]["EnterInterior"]["Coords"], function() 
            PlaySoundFrontend(-1, "club_crowd_transition", "dlc_btl_club_open_transition_crowd_sounds", true)
        end)
    end 

    if Event == "BossAction" and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "nightclub" then   
        TriggerEvent('esx_society:openBossMenu', 'nightclub', function(data2, menu2)
            menu2.close() 
        end) 
    end

    if Event == "Computer" and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "nightclub" then   
        ESX.PlayAnimation(PlayerPedId(), "mp_prison_break", "hack_loop", {
            ["flag"] = 1
        })
        
        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'police_efter_text',
        {
            title = "Ange text",
        }, function(data3, menu3) 

            menu3.close() 

            TriggerServerEvent('eyrp_nightclub:sendMessage', data3.value) 
        end,
        function(data3, menu3)
            menu3.close()
        end)
    end
end) 

RegisterNetEvent('eyrp_nightclub:sendMessage') 
AddEventHandler('eyrp_nightclub:sendMessage', function(text)   
	TriggerEvent('chat:addMessage', { 
        template = '<div style="padding: 0.4vw; margin: 0.7vw; width: 30%; background-color: rgba(24, 28, 38, 0.8); border-radius: 3px;"><i class="fas fa-user-circle"></i><span style="font-weight: 700">@Nattklubben</span><br> {0}</div>',
        args = { text }
    })
end) 