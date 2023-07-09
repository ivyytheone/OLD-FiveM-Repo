Action = {}; 

function Action:Withdraw()   
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'withdraw', {
        title = 'Hur mycket vill du ta ut?' 
    }, function(data, menu) 
        local amount = data.value 
        
        if amount == nil then  
            ESX.ShowNotification('Du måste ange ett belopp')
        else
            TriggerServerEvent('eyrp_banks:withdrawMoney', amount)
        end
    end, function(data, menu) 
        menu.close()
    end)
end

function Action:Deposit()  
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'deposit', {
        title = 'Hur mycket vill du sätta in?' 
    }, function(data, menu) 
        local amount = data.value 
        
        if amount == nil then  
            ESX.ShowNotification('Du måste ange ett belopp')
        else
            TriggerServerEvent('eyrp_banks:SubmitMoney', amount)
        end
    end, function(data, menu) 
        menu.close()
    end)
end