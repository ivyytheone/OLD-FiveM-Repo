Action = {}; 

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(0) 
 
        if IsControlJustReleased(0, 167) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "nightclub" then  
            OpenMenu()
        end
    end
end)

function OpenMenu()  
    local mElements = {
        {
            label = 'Skicka faktura', 
            event = 'send_invoice'
        }, 
    }

    if ESX.PlayerData.job.grade_name == "boss" then 
        table.insert(mElements, {
            label = "Chef meny",
            event = "bossMenu"
        })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'nightclube', {
        title = 'Nattklubben', 
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
                    exports.billing:showJobInvoices("nightclub")
                end
            end, function(Data, Menu)
                Menu.close()
            end)
        end

        if action == "send_invoice" then   
            exports.billing:createbilling()
        end 
    end, function(data, menu) 
        menu.close()
    end)
end