local closestPlayer = nil 
local search = false 
local searching = false;
local searchingInventories = {};

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 

    while true do  

        Citizen.Wait(0); 

        if ESX ~= nil then

			if IsControlJustPressed(0, 170) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'personMenu') then
				Menu.OpenPersonMenu()
			end 

            if IsControlJustPressed(0, 244) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'vehicleMenu') then
				Menu.VehicleMenu()
			end
		end 

        while DoesEntityExist(closestPlayer) do
			Citizen.Wait(0)

			local dst = #(GetEntityCoords(closestPlayer) - GetEntityCoords(PlayerPedId()))

			if dst <= 1.0 and ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'individ') then
                ESX.DrawScriptMarker({
                    pos = GetEntityCoords(closestPlayer) - vector3(0.0, 0.0, -0.955),  
                    type = 2,
                    sizeX = 0.2,
                    sizeY = 0.2,
                    sizeZ = 0.2,
                    r = 0,
                    g = 255,
                    b = 0,
                    rotate = true,
                    bob = true
                }); 
			else
				ESX.UI.Menu.CloseAll()
				closestPlayer = nil
				break
			end
		end
    end
end)  

RegisterNetEvent("eyrp_menu:EventHandler") 
AddEventHandler("eyrp_menu:EventHandler", function(Event, Data)
    if Event == "targetAnim" then  
        local Target = GetPlayerPed(GetPlayerFromServerId(Data))

        Utils.PlayAnimation(Target, 'mp_common', "givetake1_a", {
            flag = 1
        })

        Wait(2500)
        ClearPedTasks(Target)
    end
end)

RegisterNetEvent('CloseInventory')
AddEventHandler('CloseInventory', function()
    if CurrentStorage then
        exports["eyrp_inventory"]:CloseUniqueTab(CurrentStorage);

        CurrentStorage = nil
    end
end)


RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(data)
	ESX.PlayerData = data
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	ESX.PlayerData["job"] = job
end)

Menu = {}; 

Menu.OpenPersonMenu = function();   
    local menuElements = {
        { 
            label = "Individåtgärder", 
            event = "individ"
        },
        {
            label = "Accessoarer", 
            event = "accessories"
        }, 
        {
            label = "Animationer", 
            event = "anim"
        }, 
        {
            label = "Fakturor", 
            event = "billings"
        }, 
        {
            label = "Färdigheter", 
            event = "skills"
        },
        {
            label = 'Motellnycklar', 
            event = 'motelkeys'
        }
    }
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), "personMenu",
    {
        title = ESX.PlayerData["job"].label .. ' - ' .. ESX.PlayerData["job"].grade_label,
        align = "top-right",
        elements = menuElements
    }, function(data, menu)
        local action = data.current.event  

        if action == "anim" then  
            TriggerEvent('loffe_animations:openMenu')
        end  

        if action == "skills" then 
            TriggerEvent("eyrp_skillsystem:openMenu")
        end

		if action == "accessories" then  
			exports.esx_accessories:OpenAccessoryMenu()
		end

        if action == "billings" then  
            exports["billing"]:showInvoices()
        end

        if action == 'motelkeys' then  
            exports['eyrp_motels']:ShowKeyMenu()
        end

        if action == "individ" then 
            local player, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= 1.0 then
				closestPlayer = GetPlayerPed(player)
			else
				ESX.ShowNotification("Ingen är i närheten", "error") return
			end    

            local individElements = {
                {
                    label = "Lyft/släpp person", 
                    event = "lyft"
                },  
                {
                    label = "Sök igenom", 
                    event = "search"
                },    
                {
                    label = "Ge kontanter", 
                    event = "giveCash"
                },
                {
                    label = "Applicera buntband", 
                    event = "cuffPlayer"
                }, 
                {
                    label = "Knipsa av buntband", 
                    event = "uncuffPlayer"
                }
            }
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), "individ",
            {
                title = "Individåtgärder",
                align = "top-right",
                elements = individElements
            }, function(data, menu)
                local action = data.current.event  

                if action == "cuffPlayer" then    
                    local player, distance = ESX.Game.GetClosestPlayer() 

                    if distance ~= -1 and distance <= 1.0 then
                        closestPlayer = GetPlayerPed(player)
                    else
                        ESX.ShowNotification("Ingen är i närheten", "error") return
                    end     

                    if HasEntityClearLosToEntityInFront(PlayerPedId(), closestPlayer) and not HasEntityClearLosToEntityInFront(closestPlayer, PlayerPedId()) then
                        if exports.eyrp_inventory:HasItem("handcuffs") then  
                            TriggerEvent('esx_handcuffs:cuffcheck', source)
                        else
                            ESX.ShowNotification("Du behöver ett handfängsel.", "error")
                        end
                    else
                        ESX.ShowNotification('Du måste stå bakom personen i fråga.', 'error')
                    end
                end   

                if action == "uncuffPlayer" then    
                    local player, distance = ESX.Game.GetClosestPlayer()

                    if distance ~= -1 and distance <= 1.0 then
                        closestPlayer = GetPlayerPed(player)
                    else
                        ESX.ShowNotification("Ingen är i närheten", "error") return
                    end    

                    if HasEntityClearLosToEntityInFront(PlayerPedId(), closestPlayer) and not HasEntityClearLosToEntityInFront(closestPlayer, PlayerPedId()) then
                        if exports.eyrp_inventory:HasItem("sidavbitare") then   
                            TriggerEvent('esx_handcuffs:unlockingcuffs')
                        else
                            ESX.ShowNotification("Du behöver en sidavbitare.", "error")
                        end
                    else
                        ESX.ShowNotification('Du måste stå bakom personen i fråga.', 'error')
                    end
                end 

                if action == "lyft" then  
                    local player, distance = ESX.Game.GetClosestPlayer()

                    if distance ~= -1 and distance <= 1.0 then
                        closestPlayer = GetPlayerPed(player)
                    else
                        ESX.ShowNotification("Ingen är i närheten", "error") return
                    end    

                    TriggerServerEvent("eyrp_menu:Lyft", GetPlayerServerId(player))
                end

                if action == "giveCash" then  
                    local player, distance = ESX.Game.GetClosestPlayer()  

					if distance ~= -1 and distance <= 1.0 then 
						local ped = PlayerPedId() 

                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'giveMoney', {
                            title = 'Hur mycket pengar vill du ge?'
                        }, function(data, menu) 
                            local amount = data.value

                            menu.close()

                            if not amount then 
                                ESX.ShowNotification("Du måste ange en summa.", "error") 
                                return
                            end

                            exports.eyrp_confirmation:ShowConfirmationBox({
                                title = "En person vill ge dig pengar!",
                                content = "Vill du ta imot " .. amount .. "kr?",
                                currentPlayer = GetPlayerServerId(PlayerId()),
                                closestPlayer = GetPlayerServerId(player)
                            }, function(Response) 
                                if Response then   
                                    exports['eyrp_core']:LoadModel("prop_cash_pile_02")

                                    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
                                    MoneyProp = CreateObject("prop_cash_pile_02", GetEntityCoords(ped), 1, 1, 1)
                    
                                    Utils.PlayAnimation(ped, 'mp_common', "givetake1_a", {
                                        flag = 1
                                    })      

                                    TaskPlayAnim(closestPlayer, 'mp_common', 'givetake2_a', 2.0, -1.0, -1, 0, 0, 0, 0, 0)
                    
                                    AttachEntityToEntity(MoneyProp, ped, GetPedBoneIndex(ped, 28422), -0.01, 0.00, 0.037, 20.0, -420.0, 180.0, true, true, false, true, 1, true)
                    
                                    Wait(1500); 
                    
                                    TriggerServerEvent("eyrp_menu:giveMoney", GetPlayerServerId(player), amount)   
                    
                                    ClearPedTasks(ped) 
                                    DeleteEntity(MoneyProp)
                                else
                                    ESX.ShowNotification("Personen nekade.", "error")
                                end
                            end)
                        end, function(data, menu) 
                            menu.close()
                        end) 
					else
						ESX.ShowNotification("Ingen är i närheten..", "error")
					end
                end

                if action == "search" then    
					local player, distance = ESX.Game.GetClosestPlayer() 

					if distance ~= -1 and distance <= 1.0 then
						if IsEntityPlayingAnim(GetPlayerPed(player), "random@mugging3", 'handsup_standing_base', 3) or IsEntityPlayingAnim(GetPlayerPed(player), "mp_arresting", "idle", 3) or IsPedFatallyInjured(GetPlayerPed(player)) then 
							Utils.PlayAnimation(PlayerPedId(), 'amb@prop_human_bum_bin@base', "base", {
								flag = 1
							})

							TriggerServerEvent('searchPlayer', GetPlayerServerId(player))
						else
							ESX.ShowNotification('Personen håller inte upp händerna.')  
						end
					else
						ESX.ShowNotification("Ingen är i närheten", "error")      
					end
                end
            end, function(data, menu)
                menu.close() 
            end)
        end
    end, function(data, menu)
        menu.close() 
    end)
end   

RegisterCommand("lowkey", function()
    print(PlayerPedId())
end)

Menu.VehicleMenu = function();   
    local menuElements = {  
        { 
            label = "Dörrar", 
            event = "doors"
        },
        {
            label = "Fönsterrutor", 
            event = "windows"
        }, 
        {
            label = "Neon", 
            event = "neon"
        }, 
        {
            label = "Ta på/ av bältet", 
            event = "seatbelt"
        }, 
        {
            label = "Handsfack", 
            event = "handsfuck",
        },
        {
            label = "Dra ut spelare ur fordon", 
            event = "dragPlayer"
        },
    }
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), "vehicleMenu",
    {
        title = 'Fordonsmeny',
        align = "right",
        elements = menuElements
    }, function(data, menu)
        local action = data.current.event 

        local ped, vehicle = PlayerPedId(), GetVehiclePedIsIn(ped, false) 

        if action == "seatbelt" then  
            TriggerEvent("eyrp_core:seatbelt")
        end

        if (action == "handsfuck") then  
            if IsPedInAnyVehicle(ped, true) then 
                menu.close()
                exports.eyrp_core:OpenGlovebox()
            else
                ESX.ShowNotification("Du måste vara i ett fordon.", "error")
            end
        end

        if action == "doors" then 
            local doorElements = {
                {
                    label = 'Höger fram',
                    event = 'frontRight'
                },
                {
                    label = 'Höger bak',
                    event = 'backRight'
                },
                {
                    label = 'Vänster fram',
                    event = 'frontLeft'
                },
                {
                    label = 'Vänster bak',
                    event = 'backLeft'
                },
                {
                    label = 'Motorhuv',
                    event = 'hood'
                },
                {
                    label = 'Baklucka',
                    event = 'back'
                },
            }
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), "Doors",
            {
                title = 'Dörrar',
                align = 'right',
                elements = doorElements
            }, function(data2, menu2)
               local action, vehicle = data2.current.event, GetVehiclePedIsIn(PlayerPedId(), false)

            if action == 'hood' and IsPedInAnyVehicle(ped, false) then
                if GetVehicleDoorAngleRatio(vehicle, 4) > 0.0 then
                    SetVehicleDoorShut(vehicle, 4, false)
                else
                    SetVehicleDoorOpen(vehicle, 4, false)
                end
            end

            if action == 'back' and IsPedInAnyVehicle(ped, false) then
                if GetVehicleDoorAngleRatio(vehicle, 5) > 0.0 then
                    SetVehicleDoorShut(vehicle, 5, false)
                else
                    SetVehicleDoorOpen(vehicle, 5, false)
                end
            end

            if action == 'frontRight' and IsPedInAnyVehicle(ped, false) then
                if GetVehicleDoorAngleRatio(vehicle, 1) > 0.0 then
                    SetVehicleDoorShut(vehicle, 1, false)
                else
                    SetVehicleDoorOpen(vehicle, 1, false)
                end
            end

            if action == 'backRight' and IsPedInAnyVehicle(ped, false) then
                if GetVehicleDoorAngleRatio(vehicle, 3) > 0.0 then
                    SetVehicleDoorShut(vehicle, 3, false)
                else
                    SetVehicleDoorOpen(vehicle, 3, false)
                end
            end

            if action == 'backLeft' and IsPedInAnyVehicle(ped, false) then
                if GetVehicleDoorAngleRatio(vehicle, 2) > 0.0 then
                    SetVehicleDoorShut(vehicle, 2, false)
                else
                    SetVehicleDoorOpen(vehicle, 2, false)
                end
            end

            if action == 'frontLeft' and IsPedInAnyVehicle(ped, false) then
                if GetVehicleDoorAngleRatio(vehicle, 0) > 0.0 then
                    SetVehicleDoorShut(vehicle, 0, false)
                else
                    SetVehicleDoorOpen(vehicle, 0, false)
                end
            end           
        end, function(data2, menu2)
            menu2.close()
            end)
        end 

        if action == "windows" then   
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), "windows", {
                title = "Fönster", 
                align = "top-right", 
                elements = {
                    {
                        label = "Rulla ner", 
                        event = "down"
                    },
                    {
                        label = "Rulla upp", 
                        event = "up"
                    }
                }
            }, function(data3, menu3)  
                local action = data3.current.event 

                local ped, vehicle = PlayerPedId(), GetVehiclePedIsIn(ped, false)

                if action == "down" then   
                    RollDownWindow(vehicle, VEH_EXT_WINDSCREEN)
                end

                if action == "up" then  
                    RollUpWindow(vehicle, VEH_EXT_WINDSCREEN)
                end
            end, function(data3, menu3) 
                menu3.close()
            end)
        end 

        if action == "neon" then  
            local elements = {
                {
                    label = "Stäng av.", 
                    event = "turnoff"
                }, 
                {
                    label = "Sätt på.", 
                    event = "turnon",
                },
            }
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), "neon", {
                title = "Neon", 
                align = "top-right", 
                elements = elements
            }, function(neonData, neonMenu) 
                local action, vehicle = data.current.event, GetVehiclePedIsIn(PlayerPedId(), false)

                if action == "turnoff" then  
                    DisableVehicleNeonLights(vehicle, false) 
                else
                    EnableVehicleNeonLights(vehicle, true)
                end 
            end, function(neonData, neonMenu) 
                neonMenu.close()
            end)
        end 
 
        if action == "dragPlayer" then  
            Citizen.CreateThread(function() 
                SetPedRelationshipGroupHash(PlayerPedId(), "AMBIENT_GANG_HILLBILLY")
            
                ESX.ShowNotification('Du kan nu dra ut spelare ur ett fordon, du har 5 sekunder på dig.')
                Citizen.Wait(5000)
                RemovePedFromGroup(PlayerPedId())
                SetPedRelationshipGroupHash(PlayerPedId(), "PLAYER")
            end)
        end
    end, function(data, menu)
        menu.close() 
    end)
end

RegisterNetEvent("eyrp_menu:seatShuffle")
AddEventHandler("eyrp_menu:seatShuffle", function() 
    if IsPedInAnyVehicle(PlayerPedId(), false) then  
        disableShuffle(false)
        Wait(5000)
        disableShuffle(true)
    else
        CancelEvent()
    end
end)


-- Trunk 

-- Citizen.CreateThread(function()
--     Citizen.Wait(100); 

--     while true do 
--         local Player, sleepThread = PlayerPedId(), 850, 

--         local Dst = #(GetEntityCoords(Player) - GetEntityBoneIndexByName(Vehicle, 'engine'))

--         Citizen.Wait(sleepThread);
--     end
-- end)


RegisterCommand("shuff", function(source, args, raw) 
    TriggerEvent("SeatShuffle")
end, false)

Draw3DText = function(Data)
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