local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local IsDeadd       = false
local FirstSpawn   = true
ESX                = nil

Citizen.CreateThread(function()
  while ESX == nil do
      Citizen.Wait(1);

      ESX = exports["es_extended"]:getSharedObject()  
  end 

  if ESX.IsPlayerLoaded() then
      ESX.PlayerData = ESX.GetPlayerData()
  end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)

AddEventHandler("onClientMapStart", function()
	exports.spawnmanager:spawnPlayer()
	Citizen.Wait(5000)
	exports.spawnmanager:setAutoSpawn(false)
end)

AddEventHandler('playerSpawned', function()
	IsDeadd = false

	if FirstSpawn then
		exports.spawnmanager:setAutoSpawn(false) -- disable respawn
    FirstSpawn = false
    IsDeadd = false
	end
end)

AddEventHandler('playerSpawned', function(spawn)
	IsDeadd = false
end)

AddEventHandler('esx:onPlayerDeath', function()
	onPlayerDeath()
end)

RegisterNetEvent('eyrp_death:revive')
AddEventHandler('eyrp_death:revive', function(teleport)
  IsDeadd = false
  CreateThread(function()
    local player = PlayerPedId()
    local coords, heading = GetEntityCoords(player), GetEntityHeading(player)
      SetEntityCoordsNoOffset(player, coords, false, false, false, true)
      NetworkResurrectLocalPlayer(coords, heading, true, false)
      SetPlayerInvincible(player, false)
      ClearPedBloodDamage(player)
  end)
end)

RegisterNetEvent('eyrp_death:requestDeath')
AddEventHandler('eyrp_death:requestDeath', function()
	SetEntityHealth(GetPlayerPed(-1), 0)
end)

local alreadyDead = false
function signal()
    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)
     local call = math.random(0, 1)
     if call == 1 then

    TriggerServerEvent('esx_phone:send', "ambulance", 'Jag hittade en medvetslös person! Kom fort!', true, {
        x = coords.x,
        y = coords.y,
        z = coords.z
    })
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        local playerPed = GetPlayerPed(-1)
        if IsEntityDead(playerPed) and not alreadyDead then
            signal()
            alreadyDead = true
        end

        if not IsEntityDead(playerPed) then
            alreadyDead = false
        end
    end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	IsDeadd = true
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        if IsEntityDead(player) then
          if IsControlJustReleased(0, Keys['F9']) or IsDisabledControlJustReleased(0, Keys['F9']) then
              ClearPedTasksImmediately(player)
          end
        end
    end
end)


onPlayerDeath = function()
  -- StartScreenEffect('DeathFailMPDark', 0, false)
  IsDeadd = true
  local timeStarted = GetGameTimer()
  while IsDeadd do Wait(0)
    for i = 0, 31 do
      DisableAllControlActions(i)
    end
    local percent = (GetGameTimer() - timeStarted) / 1500000 * 100
    drawtxt(0.5, 0.8, "Respawn tillgänglig om ~r~" .. math.floor(percent) .. "%")
    if math.floor(percent) == 100 then
      revive = true
      while revive do Wait(0)
        -- drawtxt(0.5, 0.8, "Du är ~r~medvetlös~w~. Vänta tills du vaknar till...")
        drawtxt(0.5, 0.83, "Tryck ~r~E ~w~för återupplivas")
        if IsDisabledControlJustPressed(0, 38) then
          local player = PlayerPedId()
          DoScreenFadeOut(5000)
          Wait(15000)
          SetFollowPedCamViewMode(4)
          SetEntityCoordsNoOffset(player, Config["Zones"]["Respawn"].coords, false, false, false, true)
          NetworkResurrectLocalPlayer(Config["Zones"]["Respawn"].coords, 0.0, true, false)
          SetEntityHeading(player, Config["Zones"]["Respawn"].heading)
          SetPlayerInvincible(player, false)
          ClearPedBloodDamage(player)
          -- StopScreenEffect('DeathFailMPDark')
          ESX.Streaming.RequestAnimDict('anim@gangops@morgue@table@', function()
            TaskPlayAnim(player, 'anim@gangops@morgue@table@', 'ko_front', 8.0, -8.0, -1,  1, 0, false, false, false)
          end)
          StartScreenEffect('DrugsDrivingOut', 0, false)
          Wait(2000) DoScreenFadeIn(3000) Wait(1600) DoScreenFadeOut(2000) Wait(1600) DoScreenFadeIn(3000) Wait(1600) DoScreenFadeOut(2000) Wait(1600)DoScreenFadeIn(3000) Wait(1600) DoScreenFadeOut(2000) Wait(1600) DoScreenFadeIn(3000) Wait(1600) DoScreenFadeOut(2000) Wait(1600)
          DoScreenFadeIn(3000) Wait(1600) DoScreenFadeOut(2000) Wait(1600) DoScreenFadeIn(3000) Wait(600) DoScreenFadeOut(1000) Wait(600) DoScreenFadeIn(2000) Wait(600) DoScreenFadeOut(1000) Wait(600) DoScreenFadeIn(2000) Wait(600) DoScreenFadeOut(1000) Wait(600) DoScreenFadeIn(2000) Wait(600) DoScreenFadeOut(1000) Wait(600) DoScreenFadeIn(2000) Wait(600) DoScreenFadeOut(1000) Wait(600) DoScreenFadeIn(2000) Wait(600) DoScreenFadeOut(1000) Wait(600) DoScreenFadeIn(2000) Wait(600) DoScreenFadeOut(1000) Wait(600) DoScreenFadeIn(2000) Wait(5000)
          if not DoesCamExist(cam) then
            cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
            SetCamActive(cam,  true)
            RenderScriptCams(1, 1, 750, 1, 1)
            SetCamCoord(cam, 324.48, -578.24, 44.32)
            PointCamAtCoord(cam, Config["Zones"]["Respawn"].coords - vector3(0, 0, 0.7))
          end
          Wait(15000)
          SetFollowPedCamViewMode(1)
          SetEntityCoords(player, 328.05, -576.54, 43.32 - 0.98)
          ClearPedTasks(player)
          SetCamActive(cam, false)
          RenderScriptCams(0, 1, 750, 1, 0)
          StopAllScreenEffects()
          IsDeadd = false
          revive = false
          break
        end
      end
      break
    end
  end
end

drawtxt = function(x, y, text)
  SetTextFont(4)
  SetTextProportional(0)
  SetTextScale(0.0, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextOutline()
  SetTextEntry("STRING")

  AddTextComponentString(text)
  SetTextCentre(true)
  DrawText(x, y)
end

cam = nil
