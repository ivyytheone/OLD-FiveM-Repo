Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(0) 
 
        if IsControlJustReleased(0, 167) and ESX.PlayerData.job.name == "cardealer" then  
            OpenF6Menu()
        end
    end
end)


OpenF6Menu = function()
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "bossMenu", {
        title = "Faktura", 
        align = "right", 
        elements = {
            { label = "Skicka faktura", event = "send_invoice_to_company" }, 
            { label = "Kolla företagets fakturor", event = "check_company_billings" },
        }
    }, function(Data, Menu)
        local Value = Data.current.event

        if Value == "send_invoice_to_company" then  
            exports.billing:createbilling()
        else
            exports.billing:showJobInvoices("cardealer")
        end
    end, function(Data, Menu)
        Menu.close()
    end)
end