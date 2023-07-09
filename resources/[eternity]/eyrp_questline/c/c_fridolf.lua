self = {};
Fridolf = {};

CreateThread(function()
    Wait(100)
    
    ESX.TriggerServerCallback('eyrp_quests:GetConfig', function(Response)
        if Response then
            Config = Response

            exports['eyrp_tools']:SpawnPed({
                Model = Config.Fridolf.Model,
                Coords = Config.Fridolf.Location
            }, function(Fridolf)
                SetBlockingOfNonTemporaryEvents(Fridolf, true)
                FreezeEntityPosition(Fridolf, true)
                SetEntityInvincible(Fridolf, true)

                exports['eyrp_tools']:PlayScenario({
                    Ped = Fridolf,
                    Scenario = 'WORLD_HUMAN_SMOKING'
                })

                while true do
                    local Player, sleepThread = PlayerPedId(), 250;

                    local Distance = #(GetEntityCoords(Player) - GetEntityCoords(Fridolf))

                    if Distance <= 1.5 and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) and not self.InQuest then
                        sleepThread = 7;

                        exports['eyrp_tools']:DrawText3D(GetEntityCoords(Fridolf), '[~g~E~s~] - Prata med Fridolf')

                        if IsControlJustReleased(0, 38) then
                            self.StartQuest(Fridolf, Config)
                        end
                    end

                    if DoesEntityExist(Box) and IsEntityAttached(Box) and GetEntityAttachedTo(Box) == Player then
                        self.Attached[Player] = true
                    end

                    if DoesEntityExist(Box) and IsEntityAttached(Box) and GetEntityAttachedTo(Box) ~= Player then
                        self.Attached[Vehicle] = true
                    end

                    Wait(sleepThread)
                end
            end)
        end
    end)
end)

self.StartQuest = function(Ped, Config)
    local State = 1 --math.random(1, 5)

    if State == 1 then
        Fridolf.Beer(Ped, Config, State)
    end
end

Fridolf.Beer = function(Ped, Config, State)
    exports["eyrp_confirmation"]:ShowConfirmationBox({
        ["title"] = "Vill du hjälpa Fridolf",
        ["content"] = "Tjenare, jag ska ha firmafest imorgon. Systemet har bommat och vi behöver öl! Du vill inte hjälpa till?",
        ["currentPlayer"] = GetPlayerServerId(PlayerId()),
        ["closestPlayer"] = GetPlayerServerId(PlayerId())
    }, function(Accepted)
        if Accepted then
            exports['eyrp_notify']:LoadNotification('Vackert! Låna min cykel, den står på parkeringen bakom dig!', 'success', true)

            exports['eyrp_tools']:SpawnVehicle({
                Model = Config.Fridolf.Vehicle.Model,
                Coords = Config.Fridolf.Vehicle.Coords
            })

            SetNewWaypoint(Config.Fridolf.Market.Coords.x, Config.Fridolf.Market.Coords.y)

            exports['eyrp_tools']:SpawnPed({
                Model = Config.Fridolf.Market.Model,
                Coords = Config.Fridolf.Market.Coords
            }, function(Xhiao)
                SetBlockingOfNonTemporaryEvents(Xhiao, true);
                FreezeEntityPosition(Xhiao, true);
                SetEntityInvincible(Xhiao, true)

                exports['eyrp_tools']:PlayAnimation({
                    Ped = Xhiao,
                    Dict = 'amb@world_human_leaning@male@wall@back@foot_up@idle_a',
                    Lib = 'idle_a',
                    Flag = 49
                })

                while true do
                    local Player, sleepThread = PlayerPedId(), 250;
                    
                    if State then

                        local Distance = #(GetEntityCoords(Player) - GetEntityCoords(Ped))
                        local Distance2 = #(GetEntityCoords(Player) - GetEntityCoords(Xhiao))

                        if not IsPedInAnyVehicle(Player, true) and not DoesEntityExist(Box) and Distance <= 20.0 then
                            sleepThread = 7;
                            exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Lånda fridolfs cykel ~y~Cykel~s~')
                        end

                        local Vehicle = GetVehiclePedIsIn(Player, false)
    
                        if IsPedInAnyVehicle(Player, true) and GetEntityModel(Vehicle) == GetHashKey(Config.Fridolf.Vehicle.Model) and not DoesEntityExist(Box) then
                            sleepThread = 7;
                            exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Åk till Markanden och leta efter ~y~Xhiao Ping~s~')
                        end

                        if not IsPedInAnyVehicle(Player, true) and Distance2 <= 2.0 and not DoesEntityExist(Box) then
                            exports['eyrp_tools']:DrawText3D(GetEntityCoords(Xhiao), '[~g~E~s~] - Prata med Xhiao Ping')
                            
                            if IsControlJustReleased(0, 38) then
                                local RandomState = 1 --math.random(1, 5)

                                if RandomState == 1 or RandomState == 2 then

                                    exports['eyrp_tools']:PlayAnimation({
                                        Ped = Player,
                                        Dict = 'anim@heists@box_carry@',
                                        Lib = 'idle',
                                        Flag = 49
                                    })

                                    Box = CreateObject(GetHashKey('v_ret_ml_beerpis1'), GetEntityCoords(Player), 1, 1, 1)
                                    AttachEntityToEntity(Box, Player, GetPedBoneIndex(Player, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)

                                end
                            end
                        end

                        local ClosestBike = ESX.Game.GetClosestVehicle(GetEntityCoords(Player), Config.Fridolf.Vehicle.Model)

                        if DoesEntityExist(ClosestBike) then

                            local Distance3 = #(GetEntityCoords(Player) - GetEntityCoords(ClosestBike))

                            if Distance3 <= 2.0 and DoesEntityExist(Box) and IsEntityAttached(Box) and GetEntityAttachedTo(Box) == Player and not IsPedInAnyVehicle(Player, true) then
                                sleepThread = 7;
                                exports['eyrp_tools']:DrawText3D(GetEntityCoords(ClosestBike), '[~g~G~s~] - Lägg på lådan')

                                if IsControlJustReleased(0, 47) then
                                    ClearPedTasks(Player)
                                    AttachEntityToEntity(Box, ClosestBike, GetEntityBoneIndexByName(ClosestBike, 'steering') , 0.0, -0.6, 0.33, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                                    
                                    SetNewWaypoint(Config.Fridolf.Location.x, Config.Fridolf.Location.y)
                                end
                            end
                        end

                        local CreatePickup = GetClosestObjectOfType(GetEntityCoords(Player), 2.0, GetHashKey('v_ret_ml_beerpis1'))

                        if DoesEntityExist(CreatePickup) then
                            local Distance4 = #(GetEntityCoords(Player) - GetEntityCoords(CreatePickup))

                            if Distance4 <= 2.0 and DoesEntityExist(Box) and IsEntityAttached(Box) and GetEntityAttachedTo(Box) ~= Player and IsPedOnFoot(Player) then
                                sleepThread = 7;
                                exports['eyrp_tools']:DrawText3D(GetEntityCoords(ClosestBike), '[~g~E~s~] - Plocka upp')

                                if IsControlJustReleased(0, 38) then
                                    exports['eyrp_tools']:PlayAnimation({
                                        Ped = Player,
                                        Dict = 'anim@heists@box_carry@',
                                        Lib = 'idle',
                                        Flag = 49
                                    })
                                    AttachEntityToEntity(Box, Player, GetPedBoneIndex(Player, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
                                end
                            end
                        end

                        if not IsPedInAnyVehicle(Player, true) and Distance2 <= 10.0 and not DoesEntityExist(Box) then
                            sleepThread = 7;
                            exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Leta efter ~y~Xhiao Ping~s~')
                        end

                        if DoesEntityExist(Box) and IsEntityAttached(Box) then
                            if GetEntityAttachedTo(Box) == Player then
                                sleepThread = 7;
                                exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Lägg på flaket på pakethållaren!')
                            elseif GetEntityAttachedTo(Box) == Vehicle and IsPedOnAnyBike(Player) and DoesEntityExist(Box) and GetEntityModel(Vehicle) == GetHashKey(Config.Fridolf.Vehicle.Model) then
                                sleepThread = 7;
                                exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Cykla tillbaka till ~y~Fridolf~s~')
                            end
                        end
                    end
                    Wait(sleepThread)
                end
            end)
        end
    end)
end

AddEventHandler('onResourceStop', function(Resource)
    if Resource == GetCurrentResourceName() then
        print(GetCurrentResourceName() .. ' has been stopped!')

        self.InQuest[self.State] = false
        
        if DoesEntityExist(Box) then
            DeleteEntity(Box)
            SetModelAsNoLongerNeeded(Box)
        end
    end
end)