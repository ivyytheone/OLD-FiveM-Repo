HandleAction = function(action, data)
    TriggerServerEvent("eyrp_burglary:handleAction", action, data)
end

StartLockpick = function(house)
    local player = PlayerPedId() 
    if (exports['eyrp_inventory']:HasItem(Config.Lockpick)) then  
        FreezeEntityPosition(player, true)
        SetEntityCoords(player, Config.Houses[house].doorPos - vector3(0, 0, 0.98))
        SetEntityHeading(player, Config.Houses[house].heading)
        loadAnimDict(Config.Animations["Lockpicking"].lib)
        TaskPlayAnim(player, Config.Animations["Lockpicking"].lib, Config.Animations["Lockpicking"].anim, 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
        self.lockpicking, self.timeStarted = true, GetGameTimer()
        while self.lockpicking do Wait(0)
            local timer = (GetGameTimer() - self.timeStarted) / Config.LockpickTime * 100
            help(Config.Strings["lockpicking"]:format(math.floor(timer) .. "%"))
            if timer >= 100 then
                ClearPedTasks(player)
                FreezeEntityPosition(player, false)
                HandleAction("lock", { houseId = house, lock = false })
                if Config.AlertPoliceImmediately then
                    HandleAction("alarm", { houseId = house })
                end
                self.lockpicking = false
                break
            elseif IsControlJustReleased(0, 73) then
                ClearPedTasks(player)
                self.lockpicking = false
                FreezeEntityPosition(player, false)
                Notification(Config.Strings["canceled_lockpicking"])
                break
            end
        end
    else
        ESX.ShowNotification('Du har inget dyrkset.')
    end
end

DrawText3D = function(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)
 
    AddTextComponentString(text)
    DrawText(_x, _y)
end

loadAnimDict = function(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

help = function(msg)
	BeginTextCommandDisplayHelp('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandDisplayHelp(0, false, false, -1)
end

Notification = function(msg)
    if Config.pNotify then
        exports.pNotify:SendNotification({
            text = msg, 
            type = "info", 
            timeout = 2500, 
            layout = "bottomCenter", 
            queue = "eyrp"
        })
    else
        ESX.ShowNotification(msg)
    end
end
