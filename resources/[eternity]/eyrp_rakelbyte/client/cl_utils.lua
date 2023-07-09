Utils = {};

Utils.ChangeRakel = function(Data)
    ESX.TriggerServerCallback('eyrp_rakel:Change', function(Response)
        if Response then
            exports['eyrp_notify']:LoadNotification('Du bytte ' .. Response.firstname .. ' ' .. Response.lastname .. 's rakelnummer till ' .. Data.rakel, 'success')
        else
            exports['eyrp_notify']:LoadNotification("Hittade ingen person med det personnummret")
        end
    end, Data.dob, Data.rakel)

end

Utils.Escape = function()
    SetNuiFocus(false, false)
	SendNUIMessage({
		display = false
	})
end

Utils.Open = function()
    SetNuiFocus(true, true)
	SendNUIMessage({
		display = true
	})
end

exports('OpenComputer', Utils.Open)