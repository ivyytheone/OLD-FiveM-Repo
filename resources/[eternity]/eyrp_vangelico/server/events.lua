RegisterNetEvent("q-vangelico:globalEvent")
AddEventHandler("q-vangelico:globalEvent", function(options)
    TriggerClientEvent("q-vangelico:eventHandler", -1, options.event or "none", options.data or nil)

    if options.event == "SMASH_TRAY" then
        local trayIndex = options.data.Tray

        Heap.SmashedTrays[tostring(trayIndex)] = true
    end
end)

RegisterNetEvent("q-vangelico:giveReward")
AddEventHandler("q-vangelico:giveReward", function()
    local character = ESX.GetPlayerFromId(source)

    if not character then return end

    for _ = 1, 2 do
        local randomItem = Config.Rewards[math.random(#Config.Rewards)]

        character.addInventoryItem({
            item = randomItem,
        })

        Citizen.Wait(500)
    end
end)