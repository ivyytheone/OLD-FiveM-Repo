Utils = {}; 

Utils.Draw3DText = function(Data)
    local onScreen, _x, _y = World3dToScreen2d(Data.Coords.x, Data.Coords.y, Data.Coords.z) 

    SetTextScale(0.38, 0.38)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 200)
    SetTextEntry("STRING")
    SetTextCentre(1)

    AddTextComponentString(Data.Text)
    DrawText(_x, _y)

    local factor = string.len(Data.Text) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

Utils.globalAction = function(Data)  
    TriggerEvent('eyrp_bennys:globalAction', Data.Action, Data.Data)
end