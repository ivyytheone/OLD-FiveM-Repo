cachedData = {
    SentMessages = {}
}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 
end) 


RegisterNetEvent('eyrp_me:eventHandler')
AddEventHandler('eyrp_me:eventHandler', function(Event, Data)
    local source, target = PlayerId(), GetPlayerFromServerId(Data.ID)

    if Event == "SendMessage" then
        if #Data.Message == 0 then return "Inget värde" end
        local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(target)))

        if distance < Config.DrawDistance then 

            TriggerEvent("chat:addMessage", {
                template = Templates.Message,
                args = { Data.Name, Data.Message }
            })

            table.insert(cachedData.SentMessages, {
                name = Data.Name,
                message = Data.Message
            })

            Show3DMe(GetPlayerFromServerId(Data.ID), Data.Message)

            if Data.Message == cachedData.SentMessages[1].message then 
                print("Du kan bara skicka ett meddelande åt gången")
            end
        else
            ClearDrawOrigin()
        end
    end
end) 
