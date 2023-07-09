Funcs = {};

Funcs.SpawnVehicle = function(Model, Coords, Callback)

    ESX.Game.SpawnVehicle(Model, Coords, 318.79266357421875, function(Vehicle)
        SetEntityAsMissionEntity(Vehicle, true, false)
        SetVehicleHasBeenOwnedByPlayer(Vehicle, true)
        SetVehRadioStation(Vehicle, 'OFF')
        SetVehicleRadioEnabled(Vehicle, false)
        SetModelAsNoLongerNeeded(Model)
    end)
end

Funcs.DrawText2D = function(x, y, scale, text)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(255,255,255,255)
    SetTextDropShadow(0,0,0,0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(x, y)

    local factor = string.len(text) / 100
    DrawRect(x, y + 0.035, 0.20, 0.09, 20, 90, 114, 100)
    DrawRect(x, y, width, height, r, g, b, a)
end