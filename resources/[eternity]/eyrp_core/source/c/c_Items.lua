local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)

    local player = PlayerPedId()

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
        SetEntityAsNoLongerNeeded(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'kepp' then
        ClearPedTasks(player)
        Utils.PlayMovementClipSpeed('move_m@generic')
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'kepp' and IsPedOnFoot(player) and not IsPedDeadOrDying(player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(player);

            Hotkey.Using = true;

            exports['eyrp_tools']:SpawnObject({
                Model = 'prop_cs_walking_stick',
                Coords = GetEntityCoords(player)
            }, function(object)
                Hotkey.Prop = object

                Utils.PlayMovementClipSpeed('move_heist_lester')

                exports['eyrp_tools']:PlayAnimation({
                    Ped = player,
                    Dict = 'move_characters@lester@waiting',
                    Lib = 'lester_waitidle_a',
                    Flag = 49
                })

                AttachEntityToEntity(object, player, GetPedBoneIndex(player, 57005), vector3(0.12, -0.005, -0.025), vector3(0.0, -70.0, 0.0), false, true, false, false, 2, true);
            end)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@humane_labs@finale@keycards',
        Lib = 'ped_b_enter_loop',
        Prop = 'ng_proc_ciglight01a',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'lighter' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'lighter' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);
            Hotkey.Using = true;

            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), -0.01, 0.00, 0.037, 20.0, -420.0, 180.0, true, true, false, true, 1, true)

        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)

    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_paparazzi@male@base',
        Lib = 'base',
        Prop = 'prop_pap_camera_01',
    }
    

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'camera' then
        ClearPedTasks(Player);
        Camera.DestroyCam()
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'camera' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() Camera.DestroyCam() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

            Camera.Init(Hotkey.Prop)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)

    local Player = PlayerPedId()

    local Animation = {
        Dict = 'missfinale_c2mcs_1',
        Lib = 'fin_c2_mcs_1_camman',
        Prop = 'prop_v_cam_01'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'bigcamera' then
        ClearPedTasks(Player);
        BigCamera.DestroyCam(BigCamera.Cam)
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'bigcamera' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() BigCamera.DestroyCam(BigCamera.Cam) end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)
            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            BigCamera.Init(Hotkey.Prop)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_drinking@coffee@male@base',
        Lib = 'base',
        Prop = 'p_amb_brolly_01',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'paraply' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'paraply' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
        Lib = 'idle_a',
        Prop = 'prop_cs_tablet'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'ipad' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'ipad' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), -0.05, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
            exports['eyrp_mdt_cad']:OpenCAD()
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@box_carry@',
        Lib = 'idle',
        Prop = 'prop_food_tray_03'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'dl' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'dl' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.0, -0.12, -0.16, 10.0, 0.0, 0.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@humane_labs@finale@keycards',
        Lib = 'ped_b_enter_loop',
        Prop = 'p_ld_id_card_002',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'idcard' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'idcard' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), -0.01, 0.00, 0.037, 20.0, -420.0, 180.0, true, true, false, true, 1, true)

            ---ÄNDRA SEN
            --AttachEntityToEntity(prop, ped, GetPedBoneIndex(Player, 28422), -0.00, -0.025, 0.0, 20.0, 140.0, -150.0, true, true, false, true, 1, true)	
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@humane_labs@finale@keycards',
        Lib = 'ped_b_enter_loop',
        Prop = 'itap_policeid',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'policecard' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'policecard' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })
            --prop_policeid_01
            --AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), -0.01, 0.00, 0.037, 20.0, 140.0, 300.0, true, true, false, true, 1, true)
        
            --itap_policeid
            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.02, 0.01, 0.020, 20.0, 140.0, 300.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    local Animation = {
        Prop = 'prop_ld_case_01',
    }

    if Hotkey.Using and Item.name == 'portfolj' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'portfolj' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player) + 0.2, true, true, true)

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 57005), 0.10, 0.0, 0.0, 0.0, 280.0, 53.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
        Lib = 'base',
        Prop = 'itap_kebab'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'kebabrulle' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'kebabrulle' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })
            
            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.15, 0.022, 0.084, 280.0, 125.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('hunger', 200000)
                end
                DeleteEntity(Hotkey.Prop)
                ClearPedTasks(Player)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    local Animation = {
        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
        Lib = 'base',
        Prop = 'marabou'
    }

    if Hotkey.Using and Item.name == 'marabou' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'marabou' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.17, 0.0022, 0.084, 340.0, 125.0, 0.0, true, true, false, true, 1, true)

            Citizen.Wait(15000)
            
            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('hunger', 200000)
                end
                DeleteEntity(Hotkey.Prop)
                ClearPedTasks(Player)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@humane_labs@finale@keycards',
        Lib = 'ped_b_enter_loop',
        Prop = 'prop_police_phone',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'qpark' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'qpark' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)


            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), -0.01, 0.00, 0.037, 20.0, 140.0, 300.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'mp_player_intdrink',
        Lib = 'loop_bottle',
        Prop = 'itap_monster',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'monster' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'monster' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('thirst', 200000)
                end
                DeleteEntity(Hotkey.Prop)
                ClearPedTasks(Player)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'mp_player_intdrink',
        Lib = 'loop_bottle',
        Prop = 'itap_monster2',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'monster2' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'monster2' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('thirst', 200000)
                end
                DeleteEntity(Hotkey.Prop)
                ClearPedTasks(Player)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'mp_player_intdrink',
        Lib = 'loop_bottle',
        Prop = 'itap_monster3',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'monster3' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'monster3' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('thirst', 200000)
                end
                DeleteEntity(Hotkey.Prop)
                ClearPedTasks(Player)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'mp_player_intdrink',
        Lib = 'loop_bottle',
        Prop = 'nocco',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'noccomiami' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'noccomiami' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('thirst', 200000)
                end
                DeleteEntity(Hotkey.Prop)
                ClearPedTasks(Player)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'mp_player_intdrink',
        Lib = 'loop_bottle',
        Prop = 'fanta',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'fanta' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'fanta' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('thirst', 200000)
                end
                ClearPedTasks(Player)
                DeleteEntity(Hotkey.Prop)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'mp_player_intdrink',
        Lib = 'loop_bottle',
        Prop = 'cola',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'cola' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'cola' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)
            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('thirst', 200000)
                end
                ClearPedTasks(Player)
                DeleteEntity(Hotkey.Prop)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'mp_player_intdrink',
        Lib = 'loop_bottle',
        Prop = 'redbull',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'redbull' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'redbull' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('thirst', 200000)
                end
                DeleteEntity(Hotkey.Prop)
                ClearPedTasks(Player)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@humane_labs@finale@keycards',
        Lib = 'ped_a_enter_loop',
        Prop = 'prop_single_rose',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'ros' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'ros' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.13, 0.15, 0.0, -100.0, 0.0, -20.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'impexp_int-0',
        Lib = 'mp_m_waremech_01_dual-0',
        Prop = 'v_ilev_mr_rasberryclean',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'teddybear' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'teddybear' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            Citizen.Wait(500)
            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 24817), -0.20, 0.46, -0.016, -180.0, -90.0, 0.0, true, true, false, true, 1, true)	
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
        Lib = 'base',
        Prop = 'billys'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'billys' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'billys' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

			Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.10, 0.0022, 0.084, 350.0, 125.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('hunger', 200000)
                end
                ClearPedTasks(Player)
                DeleteEntity(Hotkey.Prop)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'move_p_m_zero_rucksack',
        Lib = 'idle',
        Prop = 'p_michael_backpack_s'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'hospitalbackpack' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'hospitalbackpack' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 24818), 0.07, -0.11, -0.05, 0.0, 90.0, 175.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'missheistdocksprep1hold_cellphone',
        Lib = 'static',
        Prop = 'xm_prop_x17_bag_med_01a'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'hospitalbag' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'hospitalbag' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 57005), 0.39, 0.0, 0.0, 0.0, 266.0, 60.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'missheistdocksprep1hold_cellphone',
        Lib = 'static',
        Prop = 'prop_big_bag_01'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'policebag' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'policebag' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

            ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 57005), 0.33, 0.0, 0.0, 0.0, 266.0, 60.0, true, true, false, true, 1, true)         
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_drinking@coffee@male@base',
        Lib = 'base',
        Prop = 'p_ing_microphonel_01',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'mic' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'mic' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.0, 0.0, 0.04, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'missfra1',
        Lib = 'mcs2_crew_idle_m_boom',
        Prop = 'prop_v_bmike_01'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'bigmic' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'bigmic' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), -0.08, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_musician@guitar@male@idle_a',
        Lib = 'idle_b',
        Prop = 'prop_acc_guitar_01'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'gitarr' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'gitarr' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 24818), -0.1, 0.31, 0.1, 0.0, 20.0, 150.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'impexp_int-0',
        Lib = 'mp_m_waremech_01_dual-0',
        Prop = 'prop_snow_flower_02'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'bukett' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'bukett' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 24817), -0.29, 0.40, -0.02, -90.0, -90.0, 0.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
        Lib = 'base',
        Prop = 'prop_donut_02'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'chokladmunk' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'chokladmunk' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

			Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.17, 0.0022, 0.084, 340.0, 125.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)

            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('hunger', 200000)
                end
                ClearPedTasks(Player)
                DeleteEntity(Hotkey.Prop)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@mp_player_intupperspray_champagne',
        Lib = 'idle_a',
        Prop = 'ba_prop_battle_champ_open_03'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'champange' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'champange' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

			Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

            TriggerServerEvent('eyrp_core:SyncChampange', Hotkey.Prop)

            Citizen.Wait(20000)
            if DoesEntityExist(Hotkey.Prop) then
                ClearPedTasks(Player)
                DeleteEntity(Hotkey.Prop)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'cellphone@',
        Lib = 'cellphone_text_in',
        Prop = 'itap_radio'
    }

    if DoesEntityExist(Hotkey.Prop) then

        Utils.PlayAnimation({
            Dict = 'cellphone@',
            Lib = 'cellphone_text_out'
        })

        Wait(500)
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'radio' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'radio' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            TaskPlayAnim(ped, Animation.Dict, Animation.Lib, 1.0, -1, -1, 50, 0, false, false, false)

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, true, true, false, true, 1, true)

        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
        Lib = 'base',
        Prop = 'prop_donut_01'
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'ringmunk' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'ringmunk' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

			Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 18905), 0.17, 0.0022, 0.084, 340.0, 125.0, 0.0, true, true, false, true, 1, true)

            Funcs.RemoveItem(Item.name)

            Citizen.Wait(20000)
            if DoesEntityExist(Hotkey.Prop) then
                if IsEntityPlayingAnim(Player, Animation.Dict, Animation.Lib, 3) then
                    exports['esx_status']:Add('hunger', 200000)
                end
                ClearPedTasks(Player)
                DeleteEntity(Hotkey.Prop)
                SetEntityAsNoLongerNeeded(Hotkey.Prop)
            end
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_drinking@coffee@male@idle_a',
        Lib = 'idle_b',
        Prop = 'p_amb_coffeecup_01',
    }


    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'kaffe' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end
    
    if State then
        if Item.name == 'kaffe' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })
            
            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

            TriggerServerEvent('eyrp_core:SyncCoffe', NetworkGetNetworkIdFromEntity(Hotkey.Prop))

        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@box_carry@',
        Lib = 'idle',
        Prop = 'p_t_shirt_pile_s',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'prisonclothes' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'prisonclothes' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })
            
            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 60309), 0.025, 0.08, 0.255, -235.0, 290.0, 0.0, true, true, false, true, 1, true)

        end
    end
end)

local Hotkey = {}

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@humane_labs@finale@keycards',
        Lib = 'ped_b_enter_loop',
        Prop = 'prop_meth_bag_01',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'kokain' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'kokain' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), -0.01, 0.00, 0.037, 20.0, -420.0, 180.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {}

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@humane_labs@finale@keycards',
        Lib = 'ped_b_enter_loop',
        Prop = 'p_amb_joint_01',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'joint' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'joint' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), -0.01, 0.00, 0.037, 20.0, -420.0, 180.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'anim@heists@humane_labs@finale@keycards',
        Lib = 'ped_b_enter_loop',
        Prop = 'itap_triss',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'triss' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'triss' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 28422), 0.13, 0.15, 0.0, -100.0, 0.0, -20.0, true, true, false, true, 1, true)
        end
    end
end)

local Hotkey = {};

RegisterNetEvent('Inventory:Hotkey')
AddEventHandler('Inventory:Hotkey', function(Item, State, RemoveProp)
    local Player = PlayerPedId()

    local Animation = {
        Dict = 'amb@world_human_musician@guitar@male@idle_a',
        Lib = 'idle_b',
        Prop = 'prop_el_guitar_03',
    }

    if DoesEntityExist(Hotkey.Prop) then
        DeleteEntity(Hotkey.Prop)
    end

    if Hotkey.Using and Item.name == 'elgitarr' then
        ClearPedTasks(Player);
        Hotkey.Using = false
    end

    if State then
        if Item.name == 'elgitarr' and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
            if RemoveProp then RemoveProp() end;

			ClearPedTasks(Player);

            Hotkey.Using = true;
            Utils.LoadModel(Animation.Prop)
            Hotkey.Prop = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)

            Utils.PlayAnimation({
                Dict = Animation.Dict,
                Lib = Animation.Lib
            })

            AttachEntityToEntity(Hotkey.Prop, Player, GetPedBoneIndex(Player, 24818), -0.1, 0.31, 0.1, 0.0, 20.0, 150.0, true, true, false, true, 1, true)
        end
    end
end)

self = {}

RegisterNetEvent('eyrp_core:onEat')
AddEventHandler('eyrp_core:onEat', function(Data, Options)
    local player = PlayerPedId();

    if IsEntityPlayingAnim(player, Options.Animation.Dict, Options.Animation.Lib, 3) or self.Consuming then return end

    if DoesEntityExist(foodprop) then
        DeleteEntity(foodprop)
        ClearPedTasks(player)
        SetEntityAsNoLongerNeeded(foodprop)
    end

    SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)

    exports['eyrp_tools']:SpawnObject({
        Model = Options.Prop,
        Coords = GetEntityCoords(player)
    }, function(Object)
        self.Consuming = true
        foodprop = Object

        exports['eyrp_tools']:PlayAnimation({
            Ped = player,
            Dict = Options.Animation.Dict,
            Lib = Options.Animation.Lib,
            Flag = 49
        })

        AttachEntityToEntity(Object, player, GetPedBoneIndex(player, tonumber(Options.Bone.Index)), Options.Bone.X, Options.Bone.Y, Options.Bone.Z, Options.Bone.XR, Options.Bone.YR, Options.Bone.ZR, true, true, false, true, 1, true)
    
        TriggerServerEvent('eyrp_inventory:eventHandler', 'RemoveItem', {
            name = Data['Tab'],
            item = Data['Item']
        })

        Wait(20000)

        if DoesEntityExist(Object) then
            if IsEntityPlayingAnim(player, Options.Animation.Dict, Options.Animation.Lib, 3) then
                exports['esx_status']:Add('hunger', 200000)
            end

            self.Consuming = false
            DeleteEntity(Object)
            ClearPedTasks(player)
        end

    end)
end)

RegisterNetEvent('eyrp_core:onDrink')
AddEventHandler('eyrp_core:onDrink', function(Data, Prop)
    local Player = PlayerPedId()

    if IsEntityPlayingAnim(Player, 'mp_player_intdrink', 'loop_bottle', 3) or self.Consuming then return end

    if DoesEntityExist(DrinkProp) then
        DeleteEntity(DrinkProp)
        ClearPedTasks(Player)
        SetEntityAsNoLongerNeeded(DrinkProp)
    end

    SetCurrentPedWeapon(Player, GetHashKey("WEAPON_UNARMED"), true)

    Utils.LoadModel(Prop)
    DrinkProp = CreateObject(Prop, GetEntityCoords(Player), 1, 1, 1)
    self.Consuming = true

    Utils.PlayAnimation({
        Dict = 'mp_player_intdrink',
        Lib = 'loop_bottle'
    })
    
    AttachEntityToEntity(DrinkProp, Player, GetPedBoneIndex(Player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

    TriggerServerEvent('eyrp_inventory:eventHandler', 'RemoveItem', {
        name = Data['Tab'],
        item = Data['Item']
    })

    Wait(20000)

    if DoesEntityExist(DrinkProp) then
        if IsEntityPlayingAnim(Player, 'mp_player_intdrink', 'loop_bottle', 3) then
            exports['esx_status']:Add('thirst', 200000)
        end

        self.Consuming = false
        DeleteEntity(DrinkProp)
        ClearPedTasks(Player)
        SetEntityAsNoLongerNeeded(DrinkProp)

        local randomStates = math.random(1, 50) 

        if randomStates == 13 then
            ESX.ShowNotification('Jadu, jag tror du har för mycket vätska i kaggen. men det är lugnt, en rap löser alla problem!')

            Wait(2000)

            TriggerServerEvent('eyrp:SyncBurp', GetPlayerServerId(PlayerId()))
        end
    end
end)

RegisterNetEvent('eyrp_items:UseStock')
AddEventHandler('eyrp_items:UseStock', function(Data, Item)
    local Amount = tonumber(Data.Item['data'].snusdosor)

    if IsPedDeadOrDying(PlayerPedId()) then return end

    if Amount >= 1 then

        local newAmount = Amount - 1

        TriggerServerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
            name = Data.Tab,
            item = {
                uuid = Data.Item.uuid,
                data = { snusdosor = tonumber(newAmount) }
            }
        })

        exports['eyrp_inventory']:addInventoryItem({
            item = Item,
            data = {},
            message = false
        });
    else
        exports['eyrp_notify']:LoadNotification('Stocken är tom', 'error', true)
    end
end)

RegisterNetEvent('eyrp_core:UseBanage')
AddEventHandler('eyrp_core:UseBanage', function(Data, Prop)
    local player, amount = PlayerPedId(), tonumber(Data.Item['data'].maxBandage);

    if amount >= 1 then

        if DoesEntityExist(bandage) then
            DeleteEntity(bandage)
            ClearPedTasks(player)
            SetEntityAsNoLongerNeeded(entity)
        end

        TriggerServerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
            name = Data.Tab,
            item = {
                uuid = Data.Item.uuid,
                data = { maxBandage = tonumber(amount - 1) }
            }
        })

        exports['eyrp_tools']:SpawnObject({
            Model = Prop,
            Coords = GetEntityCoords(player)
        }, function(object)
            bandage = object

            AttachEntityToEntity(object, player, GetPedBoneIndex(player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

            exports['eyrp_tools']:PlayAnimation({
                Ped = player,
                Dict = 'misstrevor1',
                Lib = 'gang_chatting_idle02_c',
                Flag = 1
            })

            exports['eyrp_progressbar']:StartProgress('Applicerar bandage...', math.random(20000, 30000), '#01A62E', function()

                if DoesEntityExist(bandage) then
                    DeleteEntity(bandage)
                    ClearPedTasks(player)
                    SetEntityAsNoLongerNeeded(entity)
                end
            end)
        end)
    else
        exports['eyrp_notify']:LoadNotification('Du har inga rullar kvar.', 'error', true)
    end
end)

RegisterNetEvent('eyrp_items:UseMedicItem')
AddEventHandler('eyrp_items:UseMedicItem', function(Data, Prop)
    local Player = PlayerPedId()

    local Amount = tonumber(Data.Item['data'].pills)

    if Amount >= 1 then

        if DoesEntityExist(MedicProp) then
            DeleteEntity(MedicProp)
            ClearPedTasks(Player)
            SetEntityAsNoLongerNeeded(MedicProp)
        end

        local newAmount = Amount - 1
    
        Utils.LoadModel(Prop)
        MedicProp = CreateObject(Prop, GetEntityCoords(Player), 1, 1, 1)
        AttachEntityToEntity(MedicProp, Player, GetPedBoneIndex(Player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

        Utils.LoadAnimDict('facials@gen_male@base')
        Utils.PlayAnimation({
            Dict = 'mp_suicide',
            Lib = 'pill_fp'
        })

        Citizen.Wait(1500)
        PlayFacialAnim(Player, 'smoking_exhale_1', 'facials@gen_male@base')

        Citizen.Wait(1000)

        if DoesEntityExist(MedicProp) then
            ClearPedTasks(Player)
            DeleteEntity(MedicProp)
            SetEntityAsNoLongerNeeded(MedicProp)
        end
        
    
        TriggerServerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
            name = Data.Tab,
            item = {
                uuid = Data.Item.uuid,
                data = { pills = tonumber(newAmount) }
            }
        })
    else
        exports['eyrp_notify']:LoadNotification('Paketet är tomt', 'error', true)
    end
end)

RegisterNetEvent('eyrp_core:SyncChampange')
AddEventHandler('eyrp_core:SyncChampange', function(Prop)
    local Effect = {
        Dict = 'scr_ba_club',
        Lib = 'scr_ba_club_champagne_spray'
    }

    Utils.LoadPtfx(Effect.Dict)

    local particleEffects = {}
	
    SetPtfxAssetNextCall(Effect.Dict)
    particle = StartParticleFxLoopedOnEntity(Effect.Lib, Prop, 0.0, 0.0, -0.1, 20.0, 320.0, 20.0, 2.0, false, false, false);
    table.insert(particleEffects, 1, particle)
end)

RegisterNetEvent('eyrp_core:SyncCoffe')
AddEventHandler('eyrp_core:SyncCoffe', function(Prop)

    local Effect = {
        Dict = 'cut_solomon1',
        Lib = 'cs_sol2_coffee_steam'
    }

    Utils.LoadPtfx(Effect.Dict)

    local Object = NetworkGetEntityFromNetworkId(Prop)

    local particles = {}

    for i = 1, 2 do
        UseParticleFxAssetNextCall(Effect.Dict)

        local particle = StartParticleFxLoopedOnEntity_2(Effect.Lib, Object, 0.0, 0.0, -0.1, 20.0, 320.0, 20.0, 2.0, false, false, false);

        table.insert(particles, particle)

        Citizen.Wait(math.random(100))
    end
end)

RegisterNetEvent('eyrp_items:StartClean')
AddEventHandler('eyrp_items:StartClean', function(Data)

    local Player = PlayerPedId()
    local Vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(Player), false)
    local Distance = #(GetEntityCoords(Player) - GetEntityCoords(Vehicle))

    if Distance <= 4.0 and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then
        if not IsPedDeadOrDying(Player) then
            
            if GetVehicleDirtLevel(Vehicle) > 2.0 then

                TriggerServerEvent('eyrp_inventory:eventHandler', 'RemoveItem', {
                    name = Data['Tab'],
                    item = Data['Item']
                })

                local Time = math.floor(GetVehicleDirtLevel(Vehicle) / 3, 1) * 30000

                TaskTurnPedToFaceEntity(Player, Vehicle)
                Citizen.Wait(2000)

                Utils.PlayScenario('WORLD_HUMAN_MAID_CLEAN')

                exports['eyrp_progressbar']:StartProgress('Tvättar...', tonumber(Time), '#00b306', function()
                    if IsPedUsingScenario(Player, 'WORLD_HUMAN_MAID_CLEAN') then
                        SetVehicleDirtLevel(Vehicle, 0)
                        ClearPedTasks(Player)
                    else
                        exports['eyrp_notify']:LoadNotification('Du avbröt biltvätten', 'error', true)
                    end
                end)
            else
                exports['eyrp_notify']:LoadNotification('Bilen är nytvättad, känns ju onödigt att tvätta den igen', 'error', true)
            end
    
        else
            exports['eyrp_notify']:LoadNotification('Du kan inte tvätta bilen när du är död', 'error', true)
        end
    else
        exports['eyrp_notify']:LoadNotification('Det är inget fordon i närheten', 'error', true)
    end
end)