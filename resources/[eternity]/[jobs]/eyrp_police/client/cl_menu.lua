Menu = {};  
cachedData = {};  

local cuff = false

Citizen.CreateThread(function() 
    while true do   
        Citizen.Wait(0)

        if IsControlJustReleased(0, 167) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "police" then  
            Menu.Open()
        end
    end
end)  

function Menu.Open(); 
    local mElements = {
		{
			label = "Individåtgärder",
			action = "individual_measures"
		},   
		{
			label = "Överfallsalarm", 
			action = "larm"
		},
        {
            label = "Fängelsemeny", 
            action = "jail_menu"
        }, 
		{
            label = "Ta fram objekt", 
            action = "props"
        }, 
	} 

	if ESX.PlayerData.job.grade_name == "boss" then 
		table.insert(mElements, {
			label = "Chef meny",
			action = "bossMenu"
		})
	end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "main_police_actions", {
		["title"] = "Polisen - Handlingar",
		["align"] = Config.Align,
		["elements"] = mElements 
	}, function(data, menu) 
        local event = data.current.action       
 
		if event == "jail_menu" then  
			TriggerEvent('esx-qalle-jail:openJailMenu')
		end

		if event == 'props' then
			Props.OpenMenu()
		end

		if event == "larm" then  
			if IsEntityDead(PlayerPedId()) then 
				exports['eyrp_notify']:LoadNotification("Du kan ej göra detta när du är medvetlös.", 'error') return
			end 

			ESX.TriggerServerCallback('getPerson', function(data)
				if data then
					exports['eyrp_phone']:CreateAlarm({
						Coords = GetEntityCoords(PlayerPedId()),
						Title = 'Överfallsalarm',
						Description = 'Kollegan ' .. data.firstname .. ' ' .. data.lastname .. '  har aktiverat överfallsalarmet',
						Priority = '1'
					})
				end
			end)
		end

		if event == "bossMenu" then 
			ESX.UI.Menu.Open("default", GetCurrentResourceName(), "bossMenu", {
				title = "Chef meny", 
				align = Config.Align, 
				elements = {
					{ label = "Skicka faktura till företag", event = "send_invoice_to_company" }, 
					{ label = "Kolla företagets fakturor", event = "check_company_billings" },
				}
			}, function(Data, Menu)
				local Value = Data.current.event

				if Value == "send_invoice_to_company" then  
					exports.billing:createbilling()
				else
					exports.billing:showJobInvoices("police")
				end
			end, function(Data, Menu)
				Menu.close()
			end)
		end

        if event == "individual_measures" then  
            local player, distance = ESX.Game.GetClosestPlayer(); 

            if distance ~= -1 and distance <= 2.0 then
                cachedData["target"] = player
                cachedData["closestPlayer"] = GetPlayerPed(player)
            else
                exports['eyrp_notify']:LoadNotification("Det är ingen i närheten.") return
            end  

            local mElements = {
				{
					label = "Belägg med handklovar",
					action = "cuff"
				},
				{
					label = "Ta av handklovar",
					action = "uncuff"
				},
				{
					label = "Eskortera",
					action = "drag"
				}, 
				{
					label = "Visitera", 
					action = "search"
				},
				{
					label = "Ge böter",
					action = "billing"
				}, 
				{
					label = "Kolla körkort", 
					action = "korkort"
				}, 
				{
					label = "Hantera jaktlicens", 
					action = "hunt_license"
				}
			} 

            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "individual_measures", {
				["title"] = "Individåtgärder.",
				["align"] = Config.Align,
				["elements"] = mElements
			}, function(data, menu) 
                local action = data.current.action  

                if action == "cuff" then               
                    if HasEntityClearLosToEntityInFront(PlayerPedId(), GetPlayerPed(player)) and not HasEntityClearLosToEntityInFront(GetPlayerPed(player), PlayerPedId()) then
						exports['eyrp_tools']:PlayAnimation({
							Ped = PlayerPedId(),
							Dict = 'mp_arresting',
							Lib = 'a_uncuff',
							Flag = 1
						})

						TriggerEvent('esx_handcuffs:cuffcheck', source)
                    else
                        ESX.ShowNotification('Du måste stå bakom personen i fråga.', 'error')
                    end  

                end 

				if action == "uncuff" then
					if HasEntityClearLosToEntityInFront(PlayerPedId(), GetPlayerPed(player)) and not HasEntityClearLosToEntityInFront(GetPlayerPed(player), PlayerPedId()) then
						exports['eyrp_tools']:PlayAnimation({
							Ped = PlayerPedId(),
							Dict = 'mp_arresting',
							Lib = 'a_uncuff',
							Flag = 1
						})
						TriggerEvent('esx_handcuffs:unlockingcuffs', source)
					else
						ESX.ShowNotification('Du måste stå bakom personen i fråga.', 'error')
					end
				end 

				if action == 'search' then
					if IsEntityPlayingAnim(GetPlayerPed(player), "random@mugging3", 'handsup_standing_base', 3) or IsEntityPlayingAnim(GetPlayerPed(player), "mp_arresting", "idle", 3) or IsPedFatallyInjured(GetPlayerPed(player)) then 

						exports['eyrp_tools']:PlayAnimation({
							Ped = PlayerPedId(),
							Dict = 'amb@prop_human_bum_bin@base',
							Lib = "base",
							Flag = 1
						})

						print('neger')
						TriggerServerEvent('searchPlayer', GetPlayerServerId(player))
					else
						ESX.ShowNotification('Åtgärd omöjlig')  
					end
				end

				if action == "hunt_license" then  
					TriggerEvent('loffe_hunting:licenseMenu')
				end

				if action == "billing" then  
					exports.billing:createbilling()
				end 

				if action == "drag" then  

					if IsEntityPlayingAnim(PlayerPedId(), 'switch@trevor@escorted_out', '001215_02_trvs_12_escorted_out_idle_guard2', 3) then
						ClearPedTasks(PlayerPedId())
					end

					exports['eyrp_tools']:PlayAnimation({
						Ped = PlayerPedId(),
						Dict = 'switch@trevor@escorted_out',
						Lib = '001215_02_trvs_12_escorted_out_idle_guard2',
						Flag = 49
					})

					TriggerServerEvent("eyrp_police:dragPlayer", GetPlayerServerId(cachedData["target"]))
				end
            end, function(data, menu) 
				menu.close() 
            end)
        end 
    end, function(data, menu) 
		menu.close() 
    end)
end 
