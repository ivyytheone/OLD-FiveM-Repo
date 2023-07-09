ESX = nil

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

RegisterServerEvent("eyrp_confirmation:globalEvent")
AddEventHandler("eyrp_confirmation:globalEvent", function(options)
    if Config.Debug then
        ESX.Trace((options["event"] or "none") .. " triggered to all clients.")
    end

    TriggerClientEvent("eyrp_confirmation:eventHandler", -1, options["event"] or "none", options["data"] or nil)
end)

RegisterServerEvent("eyrp_confirmation:eventHandler")
AddEventHandler("eyrp_confirmation:eventHandler", function(data)
    if data["response"] == "open_box" then
        TriggerClientEvent("eyrp_confirmation:eventHandler", data["data"]["closestPlayer"], data)
    elseif data["response"] == "done_box" then
        TriggerClientEvent("eyrp_confirmation:eventHandler", data["data"]["currentPlayer"], data)
    end
end)