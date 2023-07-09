EventHandler = function(Data)
    if Data.Event == 'OPEN' then
        SendNUIMessage({
            Message = Data.Event,
            Data = json.encode(Config.Markets)
        })
    end
end
