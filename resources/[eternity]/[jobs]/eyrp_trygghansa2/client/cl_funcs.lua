Insurance = {}

Insurance.open = function()
    SetNuiFocus(true, true)

    ESX.TriggerServerCallback('GetPlayers', function(player) 
        SendNUIMessage({
            event = 'open',
            data = { 
                insurance = Config.Forsakringar,  
                player = player
            }
        })            
    end)
end

