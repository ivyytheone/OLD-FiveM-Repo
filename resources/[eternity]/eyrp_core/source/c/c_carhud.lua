local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false

IsCar = function(veh)
    local vc = GetVehicleClass(veh)
    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end 

Fwv = function (entity)
    local hr = GetEntityHeading(entity) + 90.0
    if hr < 0.0 then hr = 360.0 + hr end
    hr = hr * 0.0174533
    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

 
Citizen.CreateThread(function()
  while true do
  Citizen.Wait(0)
  
    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsIn(ped)
    
    if car ~= 0 and (wasInCar or IsCar(car)) then
      wasInCar = true

    if beltOn then DisableControlAction(0, 75) end
      
      speedBuffer[2] = speedBuffer[1]
      speedBuffer[1] = GetEntitySpeed(car)
      
      if speedBuffer[2] ~= nil and not beltOn and GetEntitySpeedVector(car, true).y > 1.0  and speedBuffer[1] > 19.95 and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
         
        local co = GetEntityCoords(ped)
        local fw = Fwv(ped)
        SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
        SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
        Citizen.Wait(1)
        SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
      end
        
      velBuffer[2] = velBuffer[1]
      velBuffer[1] = GetEntityVelocity(car)
      if beltOn and IsControlJustReleased(0, 23) and GetLastInputMethod(0) then
        ESX.ShowNotification('Ta av dig bältet först?' , 'error')
    end
      
    elseif wasInCar then
      wasInCar = false
      beltOn = false
      speedBuffer[1], speedBuffer[2] = 0.0, 0.0

    end 
  end
end)

function Belt()
    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsIn(ped)
    
    if car ~= 0 and IsCar(car) then
        beltOn = not beltOn
        if beltOn then 

        TriggerServerEvent('InteractSound_SV:PlayOnSource', 'putonseatbelt', 0.5)
        exports['eyrp_progressbar']:StartProgress('Sätter på bältet...', 1000, '#006bc9', function()
        end)

        else 
		      TriggerServerEvent('InteractSound_SV:PlayOnSource', 'takeoffbelt', 0.5)
          exports['eyrp_progressbar']:StartProgress('Tar av bältet...', 1000, '#ff4c30', function()
          end)
        end
        exports['eyrp_carhud']:BeltState()
    end
end

exports['eyrp_tools']:RegisterChangableKey('belt', 'Snabbknapp för bältet', 'B', function()
  Belt()
end)

RegisterNetEvent('eyrp_core:seatbelt', function()
    Belt()
end)

function round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

