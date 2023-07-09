Action = {};  

Action.OpenShop = function();    
    Utils.PlayAnimation(PlayerPedId(), "mini@prostitutes@sexlow_veh", "low_car_bj_to_prop_female", {
        ["flag"] = 1
    })

    local elements = {
        {
            label = 'Ja <span style="color:lightgreen">' .. Config.Price .. ' SEK</span>', 
            event = "yes"
        }, 
        {
            label = "Nej", 
            event = "no"
        }
    }

    TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)  
        menu.close() 

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), "name_outfit",
        {
            title = "Är du säker?",
            align = "center",
            elements = elements
        }, function(data, menu)
            local action = data.current.event

            if action == "yes" then 
                TriggerServerEvent('eyrp_clotingstore:payOutfit') 
                menu.close() 

                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name',
                    {
                        title = "Namn ge outfit",
                    }, function(data3, menu3) 

                        menu3.close()

                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('eyrp_clotingstore:saveOutfit', data3.value, skin)
                        end)

                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)

                        ESX.ShowNotification(("Du gav din outfit namnet ~y~%s~s~, välkommen åter!"):format(data3.value))
                    end,
                    function(data3, menu3)
                        menu3.close()
                    end)
                end 

            if action == "no" then  
                menu.close()
            end
        end, function(data, menu)
            menu.close() 
        end)
    end, function(data, menu)
    end, {
        'tshirt_1',
		'tshirt_2',
		'torso_1',
		'torso_2',
		'decals_1',
		'decals_2',
		'arms',
		'pants_1',
		'pants_2',
		'shoes_1',
		'shoes_2',
    })
end