-- self = {};
-- Fridolf = {};

-- CreateThread(function()
--     Wait(100)

--     self.InQuest = false
--     self.Attached = false

--     ESX.TriggerServerCallback('eyrp_quests:GetConfig', function(Response)
--         if Response then
--             Config = Response

--             exports['eyrp_tools']:SpawnPed({
--                 Model = Config.Fridolf.Model,
--                 Coords = Config.Fridolf.Location
--             }, function(Ped)
--                 SetBlockingOfNonTemporaryEvents(Ped, true);
--                 FreezeEntityPosition(Ped, true);
--                 SetEntityInvincible(Ped, true);

--                 exports['eyrp_tools']:SpawnObject({
--                     Model = 'prop_cs_milk_01',
--                     Coords = GetEntityCoords(Ped)
--                 }, function(Object)
--                     AttachEntityToEntity(Object, Ped, GetPedBoneIndex(Ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)

--                     exports['eyrp_tools']:PlayAnimation({
--                         Ped = Ped,
--                         Dict = Config.Fridolf.Animation.Dict,
--                         Lib = Config.Fridolf.Animation.Lib,
--                         Flag = 49
--                     })

--                     while true do
--                         local Player = PlayerPedId(), 250;
                        
--                         local Distance = #(GetEntityCoords(Player) - GetEntityCoords(Ped))

--                         if Distance <= 1.5 and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) and not self.InQuest then

--                             sleepThread = 7;

--                             exports['eyrp_tools']:DrawText3D(GetEntityCoords(Ped), Config.Fridolf.Text)

--                             if IsControlJustReleased(0, 38) then
--                                 Fridolf.StartQuest(Ped, Config)
--                             end
--                         elseif Distance <= 1.5 and IsPedOnFoot(Player) and DoesEntityExist(Box) and GetEntityAttachedTo(Box) == Player and not IsPedDeadOrDying(Player) then
--                             exports['eyrp_tools']:DrawText3D(GetEntityCoords(Ped), '[~g~E~s~] - Lämna ölen')
--                         end

--                         Wait(sleepThread)
--                     end
--                 end)
--             end)
--         end
--     end)
-- end)

-- Fridolf.DropBeer = function(Ped, Config, Box)
--     self.InQuest = false
--     self.Attached = false

--     DetachEntity(Box)
--     PlaceObjectOnGroundProperly(Box)

--     Wait(10000)
--     DeleteEntity(Box)
-- end

-- Fridolf.StartQuest = function(Ped, Config)
--     self.State = 1 --math.random(1, 8)
    
--     if self.State == 1 then

--         exports['eyrp_notify']:LoadNotification('Tjenare, du skulle du kunna vara bussig o hjälpa en gammal man?')

--         Wait(1500)

--         exports["eyrp_confirmation"]:ShowConfirmationBox({
--             ["title"] = "Fridolf",
--             ["content"] = "Vill du hjälpa Fridolf?",
--             ["currentPlayer"] = GetPlayerServerId(PlayerId()),
--             ["closestPlayer"] = GetPlayerServerId(PlayerId())
--         }, function(accepted)
--             if accepted then 
--                 self.InQuest = true

--                 exports['eyrp_tools']:SpawnVehicle({
--                     Model = Config.Fridolf.Vehicle.Model,
--                     Coords = Config.Fridolf.Vehicle.Coords
--                 })

--                 exports['eyrp_notify']:LoadNotification('Här låna min bil, den står på parkeringen bakom dig')

--                 SetNewWaypoint(465.65380859375, -699.6261596679688)

--                 exports['eyrp_tools']:SpawnPed({
--                     Model = Config.Fridolf.Market.Model,
--                     Coords = Config.Fridolf.Market.Coords
--                 }, function(Xhiao)
--                     SetBlockingOfNonTemporaryEvents(Xhiao, true);
--                     FreezeEntityPosition(Xhiao, true);
--                     SetEntityInvincible(Xhiao, true)
    
--                     exports['eyrp_tools']:PlayAnimation({
--                         Ped = Xhiao,
--                         Dict = 'amb@world_human_leaning@male@wall@back@foot_up@idle_a',
--                         Lib = 'idle_a',
--                         Flag = 49
--                     })

--                     while true do
--                         local Player, sleepThread = PlayerPedId(), 7;

--                         if IsEntityPlayingAnim(Player, 'anim@heists@box_carry@', 'idle', 3) and DoesEntityExist(Box) and GetEntityAttachedTo(Box) == Player then

--                             print('hej')

--                             local Vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(Player), 'cruiser')
--                             local Distance = #(GetEntityCoords(Player) - GetEntityCoords(Vehicle))

--                             if Distance <= 2.0 and IsPedOnFoot(Player) then
--                                 exports['eyrp_tools']:DrawText3D(GetEntityCoords(Vehicle), '[~g~G~s~] - Lägg på ölflaket')

--                                 if IsControlJustReleased(0, 47) then
--                                     ClearPedTasks(Player)
--                                     AttachEntityToEntity(Box, Vehicle, GetEntityBoneIndexByName(Vehicle, 'steering') , 0.0, -0.6, 0.33, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

--                                     SetNewWaypoint(-762.0796508789062, 352.8923034667969)
--                                 end

--                             end
--                         end

--                         local DstToMarket = #(GetEntityCoords(Player) - GetEntityCoords(Xhiao))
    
--                         if self.InQuest then
    
--                             if not IsPedInAnyVehicle(Player, true) and not DoesEntityExist(Box) and DstToMarket > 10.0 then
--                                 exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Sätt dig i ~y~Fridolfs bil~s~')
--                             end
    
--                             local Vehicle = GetVehiclePedIsIn(Player, false)
    
--                             if IsPedInAnyVehicle(Player, true) and GetEntityModel(Vehicle) == GetHashKey(Config.Fridolf.Vehicle.Model) and not DoesEntityExist(Box) then
--                                 exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Åk till Kinesiska markanden och leta efter ~y~Xhiao Ping~s~')
--                             end
    
--                             if not IsPedInAnyVehicle(Player, true) and DstToMarket <= 10.0 and not DoesEntityExist(Box) then
--                                 exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Leta efter ~y~Xhiao Ping~s~')
--                             end

--                             if GetEntityAttachedTo(Box) == Player then
--                                 exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Lägg på flaket på pakethållaren!')
--                             end

--                             if not GetEntityAttachedTo(Box) == Player and IsEntityAttached(Box) then
--                                 exports['eyrp_tools']:DrawText2D(0.13, 0.090, 0.30, 'Cykla tillbaka till ~y~Fridolf~s~')
--                             end

--                             if DstToMarket <= 2.0 and not IsPedDeadOrDying(Player) and IsPedOnFoot(Player) and not DoesEntityExist(Box) then
--                                 exports['eyrp_tools']:DrawText3D(GetEntityCoords(Xhiao), Config.Fridolf.Market.Text)

--                                 if IsControlJustReleased(0, 38) then
--                                     local RandomState = math.random(1, 5)

--                                     if RandomState == 1 or RandomState == 2 then

--                                         exports['eyrp_notify']:LoadNotification('Här ta lådfan, hälsa Fridolf så mycket!', 'success', true)

--                                         exports['eyrp_tools']:PlayAnimation({
--                                             Ped = Player,
--                                             Dict = 'anim@heists@box_carry@',
--                                             Lib = 'idle',
--                                             Flag = 49
--                                         })

--                                         Box = CreateObject(GetHashKey('v_ret_ml_beerpis1'), GetEntityCoords(Player), 1, 1, 1)
--                                         AttachEntityToEntity(Box, Player, GetPedBoneIndex(Player, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)

--                                     else
--                                         exports['eyrp_notify']:LoadNotification('我沒啤酒了 "Xhiao har slut på öl, kom tillbaka senare" ', 'error', true)
--                                     end
--                                 end
--                             end
--                         end
--                         Wait(sleepThread)
--                     end
--                 end)
--             else
--                 self.InQuest = false
--                 exports['eyrp_notify']:LoadNotification('Jahopp, vad är de för fel på folk nuförtiden!', 'error', true)
--             end
--         end)
--     end
-- end

-- AddEventHandler('onResourceStop', function(Resource)
--     if Resource == GetCurrentResourceName() then
--         self.InQuest = false
--     end
-- end)

-- RegisterCommand('createbox', function()

--     if DoesEntityExist(Box) then DeleteEntity(Box) end
--     local Player = PlayerPedId()
--     local Bike = ESX.Game.GetClosestVehicle(GetEntityCoords(Player), 'cruiser')
--     Box = CreateObject(GetHashKey('v_ret_ml_beerpis1'), GetEntityCoords(Player), 1, 1, 1)
    
--     AttachEntityToEntity(Box, Bike, GetEntityBoneIndexByName(Bike, 'steering') , 0.0, -0.6, 0.33, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
-- end)

-- RegisterCommand('fridolf', function()
--     self.InQuest = true
-- end)

-- RegisterCommand('getentity', function()
--     local Player = PlayerPedId()

--     if DoesEntityExist(Box) then DeleteEntity(Box) return end

--     exports['eyrp_tools']:PlayAnimation({
--         Ped = Player,
--         Dict = 'anim@heists@box_carry@',
--         Lib = 'idle',
--         Flag = 49
--     })
--     Box = CreateObject(GetHashKey('v_ret_ml_beerpis1'), GetEntityCoords(Player), 1, 1, 1)
--     AttachEntityToEntity(Box, Player, GetPedBoneIndex(Player, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)

--     print(GetEntityAttachedTo(Box))
--     print(PlayerPedId())
-- end)