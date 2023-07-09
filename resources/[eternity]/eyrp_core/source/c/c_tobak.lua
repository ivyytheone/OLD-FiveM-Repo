RegisterNetEvent('eyrp_items:UseSnus')
AddEventHandler('eyrp_items:UseSnus', function(data)
    local snusCount, player = tonumber(data.Item['data'].snuscount), PlayerPedId()

    if snusCount >= 1 then

        TriggerServerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
            name = data.Tab,
            item = {
                uuid = data.Item.uuid,
                data = { snuscount = snusCount - 1 }
            }
        })

        ClearPedTasks(player)
        RemoveAllPedWeapons(player, true)
        
        exports['eyrp_tools']:PlayAnimation({
            Ped = player,
            Dict = 'mp_suicide',
            Lib = 'pill_fp',
            Flag = 49
        })
        
        Wait(1500)
        exports['eyrp_tools']:LoadAnimDict('facials@gen_male@base')
        PlayFacialAnim(player, 'smoking_exhale_1', 'facials@gen_male@base')
        Wait(1000)
        ClearPedTasks(player)

        exports['notifications']:notify('Du blev av med ~y~ 1 Prilla~s~', {
            type = 'bell',
            color = 'yellow',
            title = 'Inventory',
            duration = 3000
        })

    else
        exports['notifications']:notify('Dosan är dom dumme fan', {
            type = 'bell',
            color = 'red',
            title = 'Inventory',
            duration = 3000
        })
    end
end)

RegisterNetEvent('eyrp_items:UseCigg')
AddEventHandler('eyrp_items:UseCigg', function(data)
    local ciggCount, player = tonumber(data.Item['data'].ciggcount), PlayerPedId();

    if ciggCount >= 1 then

        if (exports['eyrp_inventory']:HasItem('lighter')) then

            if IsPedUsingScenario(player, 'WORLD_HUMAN_SMOKING') then
                ClearPedTasks(player)
                return
            end

            TriggerServerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
                name = data.Tab,
                item = {
                    uuid = data.Item.uuid,
                    data = { ciggcount = ciggCount - 1 }
                }
            })
            ClearPedTasks(player)
            RemoveAllPedWeapons(player, true)
            exports['eyrp_tools']:PlayScenario({
                Ped = player,
                Scenario = 'WORLD_HUMAN_SMOKING'
            })

            exports['notifications']:notify('Du blev av med ~y~ 1 Cigarett~s~', {
                type = 'bell',
                color = 'yellow',
                title = 'Inventory',
                duration = 3000
            })

            exports['eyrp_progressbar']:StartProgress('Röker...', 30000, function()

                exports['notifications']:notify('Du känner dig lugnare...', {
                    type = 'person',
                    color = 'yellow',
                    title = 'Inventory',
                    duration = 3000
                })

                ClearPedTasks(player)
            end)
        else
            exports['notifications']:notify('Du har ingen tändare', {
                type = 'bell',
                color = 'red',
                title = 'Inventory',
                duration = 3000
            })
        end
    else
        exports['notifications']:notify('Ciggpaketet är tomt', {
            type = 'bell',
            color = 'red',
            title = 'Inventory',
            duration = 3000
        })
    end
end)

RegisterNetEvent('eyrp_items:UseCigar')
AddEventHandler('eyrp_items:UseCigar', function(data)
    local player = PlayerPedId();

    if DoesEntityExist(cigarProp) then
        DeleteEntity(cigarProp)
        SetEntityAsNoLongerNeeded(cigarProp)
        ClearPedTasks(player)
    end

    if (exports['eyrp_inventory']:HasItem('lighter')) then
        exports['eyrp_tools']:SpawnObject({
            Model = 'prop_cigar_01',
            Coords = GetEntityCoords(player)
        }, function(thisObj)
            cigarProp = thisObj
    
            AttachEntityToEntity(thisObj, player, GetPedBoneIndex(player, 28422), -0.01, 0.00, 0.037, 20.0, -420.0, 180.0, true, true, false, true, 1, true)
    
            exports['eyrp_tools']:PlayAnimation({
                Ped = player,
                Dict = 'amb@world_human_smoking@male@male_a@enter',
                Lib = 'enter',
                Flag = 49
            })
    
            Wait(2600)
            AttachEntityToEntity(thisObj, player, GetPedBoneIndex(player, 47419), 0.010, 0.0, 0.0, 50.0, 0.0, -80.0, true, true, false, true, 1, true)
            TriggerServerEvent('eyrp_tobak:SyncCigar', thisObj)
            ClearPedTasks(player)
    
            CreateThread(function()
                while DoesEntityExist(thisObj) do
                    Funcs.DrawTxt(0.9, 1.4, 1.0, 1.0, 0.3, '[~r~X~s~] - Kasta ciggarren', 255, 255, 255, 255)
            
                    if IsControlJustReleased(0, 323) and DoesEntityExist(thisObj) then
                        DetachEntity(thisObj, 1, true)
                        Wait(2000)
                        DeleteEntity(thisObj)
                        SetEntityAsNoLongerNeeded(thisObj)
                    end
    
                    Wait(7)
                end
            end)
        end)
    else
        exports['notifications']:notify('Du har ingen tändare', {
            type = 'bell',
            color = 'red',
            title = 'Inventory',
            duration = 3000
        })
    end
end)

RegisterNetEvent('eyrp_tobak:SyncCigar')
AddEventHandler('eyrp_tobak:SyncCigar', function(Prop)
    local Effect = {
        Dict = 'cut_solomon1',
        Lib = 'cs_sol2_coffee_steam'
    }

    exports['eyrp_tools']:LoadPtfx(Effect.Dict)

    local particleEffects = {}
	
    SetPtfxAssetNextCall(Effect.Dict)
    particle = StartParticleFxLoopedOnEntity(Effect.Lib, Prop, 0.0, 0.0, -0.1, 20.0, 320.0, 20.0, 2.0, false, false, false);
    table.insert(particleEffects, 1, particle)
end)