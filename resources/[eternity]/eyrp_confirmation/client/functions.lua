GlobalFunction = function(event, data)
    local options = {
        event = event,
        data = data
    }

    print("Triggering global function: " .. options["event"])

    TriggerServerEvent("eyrp_confirmation:globalEvent", options)
end

ShowConfirmationBox = function(data, callback)
    data["uniqueId"] = Config.GenerateUniqueId()

    cachedCallbacks[data["uniqueId"]] = callback

    TriggerServerEvent("eyrp_confirmation:eventHandler", {
        ["response"] = "open_box",
        ["data"] = data
    })
end