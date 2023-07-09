Action = {};  

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
            if clothes == nil then clothes = Config.Clothes[data["current"]["label"]] end
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

            Utils.Draw3DText({
                Coords = GetOffsetFromEntityInWorldCoords(pedPlayer, 0.0, 0.0, 1.0), 
                Text = "[~g~G~s~] - Dina kläder"
            }) 

            Utils.Draw3DText({
                Coords = GetOffsetFromEntityInWorldCoords(pedPlayer, 0.0, 0.0, 0.9), 
                Text = "[~g~Q~s~] - Omklädningsru"
            })

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