-- Labs = {}

-- Citizen.CreateThread(function()
--     Citizen.Wait(100)
--     TriggerServerEvent('eyrp_quests:Labs:LockDoors', true)
--     LoadInterior(GetInteriorAtCoords(3600.253662109375, 3701.61083984375, 29.68946456909179))
--     Labs.PlaceKeyPad()

--     while true do
--         local Player, sleepThread = PlayerPedId(), 250

--         local DistanceToKeyPad = #(GetEntityCoords(Player) - Config.Labs.KeyPad.Coords)

--         if Labs.In and not IsPedDeadOrDying(Player) then

--             if not IsEntityAttached(Case) then
--                 sleepThread = 7
--                 Funcs.DrawScreenText(0.82, 1.430, 1.0, 1.0, 0.4, 'Rör dig längre in i ~y~labbet~s~, glöm inte att hålla koll på din omgivning!', 255, 255, 255, 255)
--             end

--             if DoesEntityExist(Case) and IsEntityAttached(Case) then
--                 sleepThread = 7
--                 Funcs.DrawScreenText(0.82, 1.430, 1.0, 1.0, 0.4, 'Skynda dig ut från ~y~labbet~s~, polisen har blivit larmad om händelsen!', 255, 255, 255, 255)
--             end

--         elseif not Labs.In then

--             if DoesEntityExist(Case) then
--                 DeleteEntity(Case)
--                 DeleteObject(Case)
--                 SetModelAsNoLongerNeeded(Case)
--             end
--         end

--         if DistanceToKeyPad <= 1.5 and not Labs.In and not IsPedDeadOrDying(Player) and IsPedOnFoot(Player) then
--             sleepThread = 7;
--             exports['eyrp_core']:DrawText3D(Config.Labs.KeyPad.Coords, Config.Labs.KeyPad.Text)

--             if IsControlJustReleased(0, 38) then
--                 exports['eyrp_core']:LoadAnimDict(Config.Labs.KeyPad.Animation.Enter.Dict)

--                 exports['eyrp_core']:PlayAnimation({
--                     Dict = Config.Labs.KeyPad.Animation.Enter.Dict,
--                     Lib = Config.Labs.KeyPad.Animation.Enter.Lib
--                 })

--                 Citizen.Wait(500)

--                 exports['eyrp_core']:PlayAnimation({
--                     Dict = Config.Labs.KeyPad.Animation.Idle.Dict,
--                     Lib = Config.Labs.KeyPad.Animation.Idle.Lib
--                 })

--                 local Password = Labs.Input('Skriv in lösenord', '', 30);

--                 if Password == Config.Labs.KeyPad.Password then
--                     Labs.CreatePickups()
--                     exports['eyrp_core']:PlayAnimation({
--                         Dict = Config.Labs.KeyPad.Animation.Exit.Dict,
--                         Lib = Config.Labs.KeyPad.Animation.Exit.Lib
--                     })

--                     PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', false)
                    
--                     Labs.In = true
--                     Labs.CreatePeds()

--                     Citizen.Wait(1000)
--                     ClearPedTasks(PlayerPedId())

--                     Labs.OpenLab()
--                 else
--                     exports['eyrp_notify']:LoadNotification('Du skrev in fel lösenord, var god försök igen!', 'error', true)

--                     exports['eyrp_core']:PlayAnimation({
--                         Dict = Config.Labs.KeyPad.Animation.Exit.Dict,
--                         Lib = Config.Labs.KeyPad.Animation.Exit.Lib
--                     })

--                     Citizen.Wait(1000)

--                     ClearPedTasks(PlayerPedId())
--                 end
--             end
--         end

--         Citizen.Wait(sleepThread)
--     end
-- end)

-- AddEventHandler('onResourceStop', function(Resource)
--     if Resource == GetCurrentResourceName() then 
--         TriggerServerEvent('eyrp_quests:Labs:LockDoors', false)
--         Labs.In = false

--         if DoesEntityExist(Case) then
--             DeleteEntity(Case)
--             SetModelAsNoLongerNeeded(Case)
--         end
--     end
-- end)

-- Labs.CreatePeds = function()
--     for index, value in pairs(Config.Labs.Peds.Coords) do
--         Utils.SpawnEntityPed({
--             Model = Config.Labs.Peds.Model,
--             Coords = value
    
--         }, function(Ped) 
--             TaskGoToCoordAnyMeans(Ped, vector3(3613.8369140625, 3724.189697265625, 29.68989372253418), 2.0, 0, 0, 786603, 1.0)

--             GiveWeaponToPed(Ped, GetHashKey('WEAPON_COMBATPISTOL'), 50, false, false)
--             SetPedAsEnemy(Ped, true)
--             TaskCombatPed(Ped, PlayerPedId(), 0, 16)
--             SetPedRelationshipGroupHash(Ped, 'SECURITY_GUARD')
--             SetPedDiesWhenInjured(Ped, true)
    
--         end)
--     end
-- end

-- Labs.OpenLab = function()

--     exports['adrp_phone']:CreateAlarm({
--         Coords = GetEntityCoords(PlayerPedId()),
--         Title = 'Överfallslarm',
--         Description = 'En vakt på Humane Labs har aktiverat sitt överfallsalarm.',
--         Priority = '1'
--     })

--     TriggerServerEvent('eyrp_quests:Labs:LockDoors', false)
-- end

-- Labs.CreatePickups = function()
--     exports['eyrp_core']:LoadModel(Config.Labs.Props.Model)
--     Case = CreateObject(GetHashKey(Config.Labs.Props.Model), Config.Labs.Props.Coords, true, true, true)

--     PlaceObjectOnGroundProperly(Case)
--     SetEntityAsMissionEntity(Case)

--     Citizen.CreateThread(function()
--         while true do
--             local Player, sleepThread = PlayerPedId(), 250;
    
--             local Distance = #(GetEntityCoords(Player) - GetEntityCoords(Case))
    
--             if Distance <= 1.5 and not IsEntityAttached(Case) and not IsPedDeadOrDying(Player) and IsPedOnFoot(Player) then
--                 sleepThread = 7;
    
--                 exports['eyrp_core']:DrawText3D(GetEntityCoords(Case), '[~g~E~s~] - Plocka upp')
    
--                 if IsControlJustReleased(0, 38) then

--                     ClearPedTasks(Player)
--                     SetCurrentPedWeapon(Player, GetHashKey('WEAPON_UNARMED'), true)
    
--                     AttachEntityToEntity(Case, Player, GetPedBoneIndex(Player, 57005), 0.10, 0.0, 0.0, -95.0, 280.0, 53.0, true, false, true, false, 1, true)
    
--                 end
--             end
    
--             if IsPedDeadOrDying(Player) then
--                 DetachEntity(Case)
--             end
    
--             Citizen.Wait(sleepThread)
--         end
--     end)
-- end

-- Labs.PlaceKeyPad = function()
--     exports['eyrp_core']:LoadModel(Config.Labs.KeyPad.Model)

--     KeyPad = CreateObject(GetHashKey(Config.Labs.KeyPad.Model), Config.Labs.KeyPad.Coords, 1, 1, 1)

--     SetEntityHeading(KeyPad, Config.Labs.KeyPad.Heading)
-- end

-- RegisterNetEvent('eyrp_quests:Labs:LockDoors')
-- AddEventHandler('eyrp_quests:Labs:LockDoors', function(State)
--     for index, value in pairs(Config.Labs.Doors) do
--         local Door = GetClosestObjectOfType(value.Coords, 2.0, value.Model, false)

--         if DoesEntityExist(Door) then

--             if State then
--                 FreezeEntityPosition(Door, true)
--                 SetEntityHeading(Door, value.Heading)
--             else
--                 FreezeEntityPosition(Door, false)
--             end
--         end
--     end
-- end)


-- Labs.Input = function(TextEntry, ExampleText, MaxStringLenght)
--     AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
--     DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 

--     while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
--         RemoveAllPedWeapons(PlayerPedId());
        
--         Citizen.Wait(100)
--     end
        
--     if UpdateOnscreenKeyboard() ~= 2 then
--         local Result = GetOnscreenKeyboardResult()
--         Citizen.Wait(500)
--         return Result
--     else
--         Citizen.Wait(500)
--         return false 
--     end
-- end

-- Config.Labs = {
--     Doors = {
--         {
--             Coords = vector3(3620.843, 3751.527, 27.69208),
--             Heading = 324.99993896484,
--             Model = -1081024910
--         },
--         {
--             Coords = vector3(3627.715, 3746.718, 27.69208),
--             Heading = 325.00109863281,
--             Model = -1081024910
--         }
--     },

--     Props = {
--         Model = 'prop_idol_case_02',
--         Coords = vector3(3560.772705078125, 3673.75, 29.12942695617675)
--     },

--     KeyPad = {
--         Coords = vector3(3624.7158203125, 3749.236650390625, 28.81573753356933),
--         Model = 'prop_ld_keypad_01',
--         Heading = 138.7848358154297,

--         Text = '[~g~E~s~] - Skriv in kod',

--         Password = '123',

--         Animation = {

--             Enter = {
--                 Dict = 'mp_heists@keypad@',
--                 Lib = 'enter'
--             },

--             Idle = {
--                 Dict = 'mp_heists@keypad@',
--                 Lib = 'idle_a'
--             },

--             Exit = {
--                 Dict = 'mp_heists@keypad@',
--                 Lib = 'exit'
--             }
--         }
--     },

--     Peds = {
--         Model = 's_m_m_security_01',

--         Coords = {
--             vector4(3598.28564453125, 3715.03515625, 29.68939590454101, 170.57823181152344),
--             vector4(3599.768798828125, 3714.742919921875, 29.68939590454101, 170.2321319580078),
--         }
--     }
-- }