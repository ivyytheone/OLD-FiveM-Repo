ESX = {}; 

Atm = {
    Hash = {
        -1126237515,
        506770882,
        -870868698,
        150237004,
        -239124254,
        -1364697528,  
    }, 
}; 

TriggerEvent('esx:getSharedObject', function(object)
    ESX = object
end)

Citizen.CreateThread(function()
    Atm:Init()
end)

function Atm:Init()
    while true do  
        local playerPed, sleepThread = PlayerPedId(), 850;  
        local pedCoords = GetEntityCoords(playerPed)

        for i = 1, #self.Hash do  
            local atmHash = self.Hash[i] 

            local closestAtm = GetClosestObjectOfType(pedCoords, 3.0, atmHash, false) 
            local Dst = #(GetEntityCoords(playerPed) - GetEntityCoords(closestAtm))

            if Dst <= 2.5 then  
                sleepThread = 5;   

                local displayPos = GetOffsetFromEntityInWorldCoords(closestAtm, 0.0, 0.0, 1.0)

                ESX.Game.Utils.DrawText3D(displayPos, '[~g~Z~s~] Ta ut pengar [~g~C~s~] Sätt in pengar')

                if IsControlJustReleased(0, 20) then  
                    Utils.PlayAnimation(PlayerPedId(), 'amb@prop_human_atm@male@idle_a', 'idle_a', {
                        flag = 1
                    })  

                    self:Withdraw()
                else
                    if IsControlJustReleased(0, 26) then   
                        Utils.PlayAnimation(PlayerPedId(), 'amb@prop_human_atm@male@idle_a', 'idle_a', {
                            flag = 1
                        }) 

                        self:Deposit()
                    end
                end
            end
        end

        Citizen.Wait(sleepThread) 
    end
end

function Atm:Withdraw()
    Utils.OpenDialogMenu({
        title = 'Hur mycket vill du ta ut?'
    }, function(amount)
        if amount then 
            ESX.TriggerServerCallback('lowkey_atm:WithdrawCash', function(response) 
                if response then 
                    ESX.ShowNotification('Du tog ut ~g~' .. amount .. 'kr~s~')
                else
                    ESX.ShowNotification('Du har inte ' .. amount .. ' kr på din bank')
                end
            end, amount)
        else
            self.UsingAtm = false
        end
    end)
end

function Atm:Deposit()
    Utils.OpenDialogMenu({
        title = 'Hur mycket vill du sätta in?'
    }, function(amount)
        if amount then 
            ESX.TriggerServerCallback('lowkey_atm:DepositCash', function(response) 
                if response then 
                    ESX.ShowNotification('Du satte in ~g~' .. amount .. 'kr~s~')
                else
                    ESX.ShowNotification('Något gick fel')
                end
            end, amount)
        else
            self.UsingAtm = false
        end
    end)
end