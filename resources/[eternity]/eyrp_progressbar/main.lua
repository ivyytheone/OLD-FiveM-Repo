RegisterNetEvent("progress:start", function(text, timeout, cb, color)
    StartProgress(text, timeout, cb, color)
end)

function StartProgress(Action, Duration, Color, Callback) 
    SendNUIMessage({
        Event = "Start",
        Data = {
            Action = Action,
            Duration = Duration,
            Color = Color
        },
    })

    SetTimeout(Duration, function()
        Callback(Action, Duration, Color)
    end)
end

RegisterCommand("nui", function()
    SetNuiFocus(false, false)
end)

RegisterCommand('startp', function(src, args)
    StartProgress("Köper horor", 5050, function(text, timeout, color)
        exports['eyrp_notify']:LoadNotification("Denna progress hade färgen " .. color .. " och texten " .. text .. "")
    end, "#ffb74d")
end)