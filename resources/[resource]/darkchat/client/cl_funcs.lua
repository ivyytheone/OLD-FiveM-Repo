Funcs = {
   
    OpenChat = function()
        ESX.TriggerServerCallback('darkchat:FetchMessages', function(messages)
            SetNuiFocus(true, true)
            SendNUIMessage({
                event = 'OpenDark',
                data = messages
            }); 
        end); 
    end; 

    AddMessage = function(data)
        TriggerServerEvent('darkchat:EventHandler', 'AddMessage', data)

        
    end; 

}; 