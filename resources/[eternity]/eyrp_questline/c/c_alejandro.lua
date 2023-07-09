Alejandro = {}

CreateThread(function()
    Wait(100)

    ESX.TriggerServerCallback('eyrp_quests:GetConfig', function(Response)
        if Response then
            Config = Response

            exports['eyrp_tools']:SpawnPed({
                Model = Config.Alejandro.Model,
                Coords = Config.Alejandro.Location
            }, function(Ped)
                SetEntityInvincible(Ped, true)
                SetBlockingOfNonTemporaryEvents(Ped, true)
                FreezeEntityPosition(Ped, true)
        
                exports['eyrp_tools']:PlayAnimation({
                    Ped = Ped,
                    Dict = Config.Alejandro.Animation.Dict,
                    Lib = Config.Alejandro.Animation.Lib,
                    Flag = 1
                })
        
                exports['eyrp_tools']:SpawnObject({
                    Model = 'prop_cigar_01',
                    Coords = GetEntityCoords(Ped)
                }, function(Cigar)
                    AttachEntityToEntity(Cigar, Ped, GetPedBoneIndex(Ped, 47419), 0.010, 0.0, 0.0, 50.0, 0.0, -80.0, true, true, false, true, 1, true)
                
                    TriggerServerEvent('eyrp_tobak:SyncCigar', Cigar)
        
                    while true do
                        local Player, sleepThread = PlayerPedId(), 250;
        
                        local DisplayCoords = GetWorldPositionOfEntityBone(Ped, GetPedBoneIndex(Ped, 35731))
        
                        local Distance = #(GetEntityCoords(Player) - DisplayCoords)
        
                        if Distance <= 1.5 and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
                            sleepThread = 7;
                            exports['eyrp_tools']:DrawText3D(DisplayCoords, Config.Alejandro.Text)
        
                            if IsControlJustReleased(0, 38) then
                                Alejandro.Init(Ped, Config)
                            end
                        end
                        Wait(sleepThread)
                    end
                end)
            end)
        end
    end)
end)

Alejandro.Init = function(Ped, Config)
    exports["eyrp_confirmation"]:ShowConfirmationBox({
		["title"] = "Alejandro",
		["content"] = "Vill du köpa information? (" .. Config.Alejandro.Price .. 'kr)',
		["currentPlayer"] = GetPlayerServerId(PlayerId()),
		["closestPlayer"] = GetPlayerServerId(PlayerId())
	}, function(accepted)
		if accepted then 
             ESX.TriggerServerCallback('eyrp_core:payMoney', function(Response)
                 if Response then
                     PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                     Alejandro.BuyInfo(Ped, Config)
                 else
                     exports['eyrp_notify']:LoadNotification('Du har inte råd med detta', 'error', true)
                 end
             end, Config.Alejandro.Price)
		end
	end)
end

Alejandro.BuyInfo = function(Ped, Config)
    local Player = PlayerPedId();
    
    ClearPedTasks(Player)
    RemoveAllPedWeapons(Player);
    TaskTurnPedToFaceEntity(Player, Ped)

    Wait(500)

    exports['eyrp_tools']:SpawnObject({
        Model = 'prop_amanda_note_01',
        Coords = GetEntityCoords(Ped)
    }, function(Note)
        AttachEntityToEntity(Note, Ped, GetPedBoneIndex(Ped, 28422), -0.01, 0.00, 0.037, 20.0, -420.0, 180.0, true, true, false, true, 1, true)

        exports['eyrp_tools']:PlayAnimation({
            Ped = Ped,
            Dict = 'mp_common',
            Lib = 'givetake1_a',
            Flag = 0
        })

        exports['eyrp_tools']:PlayAnimation({
            Ped = Player,
            Dict = 'mp_common',
            Lib = 'givetake2_a',
            Flag = 0
        })

        Wait(2000)

        exports['eyrp_inventory']:addInventoryItem({
            item = 'postit',
            message = true,
            data = {
                message = Config.Alejandro.Information[ math.random( #Config.Alejandro.Information ) ]
            }
        })

        if DoesEntityExist(Note) then
            ClearPedTasks(Player)
            DeleteEntity(Note)

            exports['eyrp_tools']:PlayAnimation({
                Ped = Ped,
                Dict = Config.Alejandro.Animation.Dict,
                Lib = Config.Alejandro.Animation.Lib,
                Flag = 1
            })
        end
    end)
end