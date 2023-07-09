RegisterCallbacks = function(ESX)
    ESX.RegisterServerCallback("q-vangelico:fetchTrays", function(source, callback)
        local character = ESX.GetPlayerFromId(source)

        if not character then return end

        callback(Heap.SmashedTrays)
    end)

    ESX.RegisterServerCallback("q-vangelico:fetchPolicemen", function(source, callback)
        local character = ESX.GetPlayerFromId(source)

        if not character then return end

        local policemen = 0

        for src, _ in pairs(ESX.GetPlayers()) do
            local char = ESX.GetPlayerFromId(src)

            if char then
                if char.job.name == "police" then
                    policemen = policemen + 1
                end
            end
        end

        callback(policemen >= Config.PoliceRequired)
    end)
end