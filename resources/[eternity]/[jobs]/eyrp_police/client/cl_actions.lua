Action = {}; 

Action.GetAction = function(action);      
    if action == "Dressing" then   
        Action.Dressing = 1
    end 
 
    if action == "BossAction" then  
        TriggerEvent('esx_society:openBossMenu', 'police', function(data2, menu2)
            menu2.close() 
        end) 
    end 

    if action == 'Locker' then
        exports['eyrp_joblockers']:OpenPersonalLocker()
    end

    if action == "WeaponDB" then
        exports['eyrp_weapons']:OpenComputer()
    end

    if action == "RakelChange" then
        exports['eyrp_rakelbyte']:OpenComputer()
    end

    if action == 'Reception' then
        Funcs.Reception()
    end
    
    if action == 'Policebadge' then
        ESX.TriggerServerCallback('eyrp_police:Badge', function(response) 
            if response then 
                exports['eyrp_inventory']:addInventoryItem({
                    item = 'policecard', 
                    data = {
                        firstname = response.firstname, 
                        lastname = response.lastname, 
                    }
                })
            end
        end)
    end

    if action == "BossComputer" then
        Action.OpenComputer()
    end

    if action == "BoatGarage" then
        if not ESX.Game.IsSpawnPointClear(Config.Joblocations.BoatGarage.SpawnPos - vector3(0.0, 0.0, 0.985), 3.0) then 
            ESX.ShowNotification("Det är ett fordon som blockerar båtplatsen", "error") return
        end
        ESX.Game.SpawnVehicle(Config.Joblocations.BoatGarage.Vehicle, Config.Joblocations.BoatGarage.SpawnPos, Config.Joblocations.VehicleGarage.Heading)
    end 

    if action == "Computer" then   
        Elements = { 
            {
                label = "Skriv en efterlysning", 
                event = "efterlysning"
            }, 
            {
                label = "Skriv ett public medelande", 
                event = "public"
            }, 
        },  

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), "police_menu",
			{
				title = "Välj alternativ",
				align = "center",
				elements = Elements
		}, function(data, menu)
			local action = data.current.event 

            menu.close()
	
            if action == "efterlysning" then   
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'police_efter_text',
                {
                    title = "Ange text",
                }, function(data3, menu3) 

                    menu3.close() 

                    TriggerEvent('eyrp_police:sendEfterlysning', data3.value) 
                end,
                function(data3, menu3)
                    menu3.close()
                end) 
            end
            
            if action == "public" then   
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'police_efter_text',
                {
                    title = "Ange text",
                }, function(data3, menu3) 

                    menu3.close() 

                    TriggerEvent('eyrp_police:sendPublic', data3.value) 
                end,
                function(data3, menu3)
                    menu3.close()
                end)
            end 
		end, function(data, menu)
			menu.close() 
		end)
    end

    if action == "Keys" then 
        if ESX.GetPlayerData().job.grade >= 9 then
            local info = {}

            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'policekey',
            {
                title = "Namn på nyckel",
            }, function(data, menu) 

                info.keyname = data.value

                if not tonumber(info.level) then
                    exports['eyrp_notify']:LoadNotification('Behörighetsnivån måste vara ett nummer', 'error')
                elseif tonumber(info.level) > 3 then
                    exports['eyrp_notify']:LoadNotification('Behörighetsnivån måste vara ett nummer från 1-3', 'error')
                elseif tonumber(info.keyname) then
                    exports['eyrp_notify']:LoadNotification('Namnet kan ej vara siffror', 'error')
                else
                    TriggerServerEvent('eyrp_police:GiveKey', info.level, info.keyname)
                end

                menu.close() 
            end,

            function(data, menu)
                menu.close()
            end)

            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'policeLevel',
            {
                title = "Behörighetsnivå, 1 = Högsta, 3 = Lägst",
            }, function(data1, menu1) 
                    info.level = data1.value

                menu1.close() 
            end,

            function(data1, menu1)
                menu1.close()
            end)
        else
            exports['eyrp_notify']:LoadNotification('Du har inte tillgång till detta', 'error')
        end
    end

    if action == "VehiclePark" and IsPedInAnyVehicle(GetPlayerPed(-1)) then  
        TriggerEvent('esx:deleteVehicle')
    end 

    if action == "HelicopterGarage" then  
        if not ESX.Game.IsSpawnPointClear(Config.Joblocations.HelicopterGarage.SpawnPos - vector3(0.0, 0.0, 0.985), 3.0) then 
            exports['eyrp_notify']:LoadNotification("Det är en helikopter som blockerar plattan.") return
        end

        ESX.Game.SpawnVehicle("buzzard", Config.Joblocations.HelicopterGarage.SpawnPos, Config.Joblocations.HelicopterGarage.Heading) 
    end 

    if action == "HelicopterPark" then  
        TriggerEvent('esx:deleteVehicle')
    end 
end 
 

Action.OpenOwnedClothes = function();    
	ESX.TriggerServerCallback("eyrp_clotingstore:getPlayerDressing", function(dressings)
		local menuElements = {}

		for dressingIndex, dressingLabel in ipairs(dressings) do
		    table.insert(menuElements, {
                ["label"] = dressingLabel, 
                ["outfit"] = dressingIndex
            })
		end

		ESX.UI.Menu.Open("default", GetCurrentResourceName(), "motel_main_dressing_menu", {
			["title"] = "Garderob",
			["align"] = Config.Align,
			["elements"] = menuElements
        }, function(menuData, menuHandle)
            local currentOutfit = menuData["current"]["outfit"]

			TriggerEvent("skinchanger:getSkin", function(skin)
                ESX.TriggerServerCallback("eyrp_clotingstore:getPlayerOutfit", function(clothes)
                    TriggerEvent("skinchanger:loadClothes", skin, clothes)
                    TriggerEvent("esx_skin:setLastSkin", skin)

                    TriggerEvent("skinchanger:getSkin", function(skin)
                        TriggerServerEvent("esx_skin:save", skin)
                    end)
                end, currentOutfit)
			end)
        end, function(menuData, menuHandle)
			menuHandle.close()
        end)
	end)
end 

Action.OpenDressingRoom = function();     
    local mElements = {}

    for cIndex, cValue in pairs(Config.Clothes) do
        if cValue["slider"] then
            TriggerEvent('skinchanger:getSkin', function(skin)
                if Config.Clothes[cIndex][ESX.PlayerData["job"]["grade_name"]] == nil then ESX.PlayerData["job"]["grade_name"] = "recruit" end
                if skin["sex"] == 0 then
                    table.insert(mElements, {
                        label = cIndex,
                        value = 1, type = "slider",
                        min = 1, max = #Config.Clothes[cIndex][ESX.PlayerData["job"]["grade_name"]]["male"]
                    })
                else
                    table.insert(mElements, {
                        label = cIndex,
                        value = 1, type = "slider",
                        min = 1, max = #Config.Clothes[cIndex][ESX.PlayerData["job"]["grade_name"]]["female"]
                    })
                end
            end)
        else
            table.insert(mElements, {
                label = cIndex,
                clothes = Config.Clothes[cIndex][ESX.PlayerData["job"]["grade_name"]]
            })
        end
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "cloak", {
        ["title"] = "Omklädningsrum",
        ["align"] = Config.Align,
        ["elements"] = mElements
    }, function(data, menu)
        local action, clothes = data["current"]["action"], data["current"]["clothes"]
        if action == "myclothes" then
            ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(closet)
                local mElements = {}
                for closetIndex, closetValue in pairs(closet) do
                    table.insert(mElements, {
                        ["label"] = closetValue,
                        ["action"] = closetIndex
                    })
                end

                ESX.UI.Menu.CloseAll()
                ESX.UI.Menu.Open("default", GetCurrentResourceName(), "myclothes", {
                    ["title"] = "Din garderob",
                    ["align"] = Config.Align,
                    ["elements"] = mElements
                }, function(data2, menu2)
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)
                            TriggerEvent('skinchanger:loadClothes', skin, clothes)
                            TriggerEvent('esx_skin:setLastSkin', skin)
                            TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            end)
                        end, data2["current"]["action"])
                    end)
                end, function(data2, menu2)
                    menu2.close()
                end)
            end)
        elseif data["current"]["type"] == "slider" then
            TriggerEvent('skinchanger:getSkin', function(skin)
                if skin["sex"] == 0 then
                    TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes[data["current"]["label"]][ESX.PlayerData["job"]["grade_name"]]["male"][data["current"]["value"]])
                else
                    TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes[data["current"]["label"]][ESX.PlayerData["job"]["grade_name"]]["female"][data["current"]["value"]])
                end

                TriggerEvent('esx_skin:setLastSkin', skin)
                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
            end)
        else
            if clothes == nil then clothes = Config.Clothes[data["current"]["label"]]["recruit"] end
            TriggerEvent('skinchanger:getSkin', function(skin)
                if skin["sex"] == 0 then
                    TriggerEvent('skinchanger:loadClothes', skin, clothes["male"])
                else
                    TriggerEvent('skinchanger:loadClothes', skin, clothes["female"])
                end
                TriggerServerEvent('esx_skin:save', skin)
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
end


-- Action Loop
Citizen.CreateThread(function() 
    Citizen.Wait(100); 

    while true do  

        local pedPlayer, sleepThread = PlayerPedId(), 750;  
  
        if Action.Dressing == 1 then   
            sleepThread = 5;

            exports['eyrp_core']:DrawText3D(GetOffsetFromEntityInWorldCoords(pedPlayer, 0.0, 0.0, 1.0), "[~o~G~s~] - Dina kläder")
            exports['eyrp_core']:DrawText3D(GetOffsetFromEntityInWorldCoords(pedPlayer, 0.0, 0.0, 0.9), "[~o~Q~s~] - Omklädningsrum")

            if IsControlJustReleased(0, 47) then  
                Action.OpenOwnedClothes() 
                Action.Dressing = 0
            end 

            if IsControlJustReleased(0, 44) then  
                Action.OpenDressingRoom()  
                Action.Dressing = 0
            end
        end

        Citizen.Wait(sleepThread); 
    end
end) 