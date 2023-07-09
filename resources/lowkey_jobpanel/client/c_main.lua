ESX = nil

Jobpanel = {}; 

ESX = exports.es_extended:getSharedObject(); 

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

function Jobpanel:OpenMenu(job) 
    if not job or type(job) ~= 'string' then return end; 

    local jobSettings = Config.Jobs[job]; 

    if not jobSettings then
        print(('Could not find job: %s in the config'):format(job))
        return
    end; 

    local character = Callbacks:TriggerCallback({
        event = 'getCharacterData',
        data = {
            id = ESX.GetPlayerData().identifier 
        }
    })

    if ESX.GetPlayerData().job.name == job and ESX.GetPlayerData().job.grade_name == 'boss' or character.hasAccess > 0 then
        local jobData = Callbacks:TriggerCallback({
            event = 'getData', 
            data = {
                job = job, 
            }
        })
    
        if jobData.type ~= 'success' then 
            print(('Could not find any information about job ~r~%s'):format(job))
            return
        end
    
        SetNuiFocus(true, true); 
    
        SendNUIMessage({
            event = 'open', 
            data = {
                job = job, 
                capital = jobData.data.capital, 
                ranks = jobData.data.ranks, 
                employees = jobData.data.employees, 
                jobSettings = jobSettings, 
                job = job, 
            }
        })
    else
        ESX.ShowNotification('Du har inte tillgång till denna dator!')
    end
end

RegisterCommand('jobpanel', function()
    Jobpanel:OpenMenu('police')
end)