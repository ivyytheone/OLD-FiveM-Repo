Action = {}; 

Action.OpenCreationMenu = function() 
    PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)

    local player = PlayerPedId()
	local elements = {}

    ClearPedTasks(player) 

    for cateIndex, cateData in pairs(Config.Categories) do
		table.insert(elements, {
			["label"] = cateData["label"],
			["value"] = cateIndex,
			["cam"] = cateData["cam"],
			["anim"] = cateData["anim"],
			["animOutro"] = cateData["animOutro"],
			["action"] = cateData["action"] or cateData["options"]
		})
	end

    ESX.UI.Menu.CloseAll(); 
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'create_character', {
        title = "Skapa karaktär", 
        align = "left", 
        elements = elements
    }, function(charData, charMenu) 
        local Data = charData.current

        if type(Data["action"]) == "table" then
            local elements = {}

            for tableIndex, tableData in pairs(Data["action"]) do
                TriggerEvent("skinchanger:getData", function(component, maxValue)

                    for compIndex, compData in pairs(component) do
                        if compData["name"] == tableData["type"] then
                            
                            for maxIndex, maxData in pairs(maxValue) do
                                if maxIndex == tableData["type"] then
                                    table.insert(elements, {
										["label"] = tableData["label"],
										["value"] = compData["value"],
										["type"] = "slider",
										["min"] = 0,
										["max"] = maxData,
										["data"] = tableData
									})
                                end
                            end
                        end
                    end
                end)
            end

            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "second_creation_menu", {
				title = Data["label"],
				align = "left",
				elements = elements
			}, function(data2, menu2)

			end, function(data2, menu2)
				menu2.close()
                PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
				
			end, function(data2, menu2)
                PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
				TriggerEvent("skinchanger:change", data2["current"]["data"]["type"], data2["current"]["value"])
				if data2["current"]["data"]["type"] == "sex" then
				end
			end, function(data2, menu2)
			end)
        end
    end, function(charData, charMenu)  
        PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), "you_done", {
            title = "Vill du spara?", 
            align = "left", 
            elements = {
                {
                    ["label"] = "Spara", ["value"] = "save",
                }, 
                {
                    ["label"] = "Avbryt", ["value"] = "not_done"
                },
            }
        }, function(data3, menu3)
            local selected = data3.current.value 

            if selected == "save" then  
                ESX.UI.Menu.CloseAll();

                DestroyAllCams(false)

                Charcreation.DisableControls = false

                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)

                Utils.DestroyCam() 

                DoScreenFadeOut(400) 
                Wait(1000) 
                
                exports['eyrp_intro']:StartIntro()
                DoScreenFadeIn(400)
            else
                menu3.close()
            end
        end, function(data3, menu3)
            PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
        end) 
    end, function(charData, charMenu) 
        PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
    end)
end