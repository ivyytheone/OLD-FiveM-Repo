Callbacks = {}; 

RegisterNUICallback('getCharacterData', function(data, callback)
    local character = Callbacks:TriggerCallback({
        event = 'getCharacterData',
        data = {
            id = data.id
        }
    })

    callback(character)
end)

RegisterNUICallback('saveCharacterData', function(data, callback)
    local characterData = data.data;

    if characterData then 
        local updated = Callbacks:TriggerCallback({
            event = 'updateCharacter',
            data = {
                characterData = characterData, 
                rank = data.rank, 
                hasAccess = data.hasAccess, 
                job = data.job
            }
        })

        if updated then 
            ESX.ShowNotification(('Du har uppdaterat <span style="color: yellow">%s</span>!'):format(characterData.id)); 
        end

        callback(updated)
    end
end)

RegisterNUICallback('changeCapital', function(data, callback)
    if not data then return end; 

    local updated = Callbacks:TriggerCallback({
        event = 'updateCapital',
        data = {
            type = data.type, 
            amount = data.amount, 
            job = data.job
        }
    })

    if updated then 
        ESX.ShowNotification('Du har uppdaterat kapitalet!')
        callback(true)
    else
        ESX.ShowNotification(updated.message)
    end
end)

RegisterNUICallback('firePlayer', function(data, callback)
    local fired = Callbacks:TriggerCallback({
        event = 'firePlayer',
        data = {
            player = data.player
        }
    })

    if fired then 
        callback(true)
    end
end)

RegisterNUICallback('hirePlayer', function(data, callback)
    local distance, cloestPlayer = ESX.Game.GetClosestPlayer(GetEntityCoords(PlayerPedId())); 

    if distance < 1.0 and closestPlayer ~= -1 then 
        ESX.ShowNotification('Ingen spelare är in närheten!')
        return
    end
    
    local hired = Callbacks:TriggerCallback({
        event = 'hirePlayer',
        data = {
            job = data.job, 
            player = cloestPlayer
        }
    })
end)

RegisterNUICallback('close', function(data, callback)
    SetNuiFocus(false, false); 
    callback(true)
end)

function Callbacks:TriggerCallback(data)
    local p = promise:new(); 

    ESX.TriggerServerCallback('lowkey_jobpanel:' .. data.event, function(results) 
        p:resolve(results)
    end, data.data)

    return Citizen.Await(p)
end