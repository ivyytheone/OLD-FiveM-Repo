Utils = {}; 

Utils.GenerateRandomPlate = function()
    local res = ""
    for i = 1, 3 do
        res = res .. string.char(math.random(97, 122))
    end
 
    plate = ('%s%s%s'):format(string.upper(res),math.random(10,99),string.upper(string.char(math.random(97,122))))


    ESX.TriggerServerCallback('eyrp_cardealer:DoesPlateExist', function(Exist)
        if (Exist) then 
            ESX.ShowNotification('Något gick fel, försök igen', 'error')
        else
            return; 
        end; 
    end)
    return plate 
end

Utils.Draw3DText = function(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    
    SetTextScale(0.38, 0.38)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 200)
    SetTextEntry("STRING")
    SetTextCentre(1)

    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = string.len(text) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end 

Utils.GenerateUUID = function()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'

    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format('%x', v)
    end)
end

