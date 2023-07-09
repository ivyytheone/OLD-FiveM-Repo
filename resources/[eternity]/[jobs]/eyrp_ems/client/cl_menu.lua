Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(0) 
 
        if IsControlJustReleased(0, 167) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "ambulance" then  
            OpenEmsMenu()
        end
    end
end)

Menu = {}

function OpenEmsMenu()  
    local mElements = {
        {
            label = 'Använd bandage på individ', 
            event = 'use_medkit'
        }, 
        {
            label = 'Återuppliva individ', 
            event = 'revive_person'
        }, 
    }

    if ESX.PlayerData.job.grade_name == "boss" then 
        table.insert(mElements, {
            label = "Chef meny",
            event = "bossMenu"
        })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ems', {
        title = 'Region', 
        align = 'top-right', 
        elements = mElements
    }, function(data, menu) 
        local action = data.current.event  

        if action == "bossMenu" then 
            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "bossMenu", {
                title = "Chef meny", 
                align = Config.Align, 
                elements = {
                    { label = "Skicka faktura till företag", event = "send_invoice_to_company" }, 
                    { label = "Kolla företagets fakturor", event = "check_company_billings" },
                }
            }, function(Data, Menu)
                local Value = Data.current.event

                if Value == "send_invoice_to_company" then  
                    exports.billing:createbilling()
                else
                    exports.billing:showJobInvoices("ambulance")
                end
            end, function(Data, Menu)
                Menu.close()
            end)
        end

        if action == 'use_medkit' then   
            local player, distance = ESX.Game.GetClosestPlayer(); 

            if distance ~= -1 and distance <= 2.0 then
                Menu.target = player
                Menu.closestPlayer = GetPlayerPed(player)
            else
                ESX.ShowNotification("Det är ingen i närheten.", 'error') return
            end 

            if exports['eyrp_inventory']:HasItem('bandage') then
                
                exports['eyrp_tools']:PlayAnimation({
                    Ped = PlayerPedId(),
                    Dict =  'misstrevor1',
                    Lib =  'gang_chatting_idle02_c',
                    Flag = 1
                })

                exports['eyrp_progressbar']:StartProgress('Applicerar Bandage...', math.random(20000, 30000), '#01A62E', function()

                    TriggerServerEvent('eyrp_ems:healPlayer', GetPlayerFromServerId(player)) 
                    ClearPedTasks(PlayerPedId())
                end)
            else
                ESX.ShowNotification('Du har inget bandage på dig')
            end

        end
 
        if action == "revive_person" then   
            local player, distance = ESX.Game.GetClosestPlayer(); 

            if distance ~= -1 and distance <= 2.0 then
                Menu["target"] = player
                Menu["closestPlayer"] = GetPlayerPed(player)
            else
                ESX.ShowNotification("Det är ingen i närheten.") return
            end

            exports['eyrp_tools']:PlayAnimation({
                Ped = PlayerPedId();
                Dict = "mini@cpr@char_a@cpr_str", 
                Lib = "cpr_pumpchest",
                Flag = 1,
            })

            exports['eyrp_progressbar']:StartProgress('Utför HLR...', math.random(20000, 30000), '#01A62E', function()

                TriggerServerEvent("eyrp_death:revive", GetPlayerServerId(player)) 
                ClearPedTasks(PlayerPedId())
            end)
        end 
    end, function(data, menu) 
        menu.close()
    end)
end