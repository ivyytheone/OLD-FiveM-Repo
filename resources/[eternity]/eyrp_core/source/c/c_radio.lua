local KeyboardInput = function(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        RemoveAllPedWeapons(PlayerPedId());
        
		Citizen.Wait(100)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local Result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		return Result
	else
		Citizen.Wait(500)
		return false 
	end
end

local CurrentFrequency = nil;

RegisterNetEvent('DropRadio')
AddEventHandler('DropRadio', function(Data)
    if CurrentFrequency and (Data.data.frequency == CurrentFrequency) then
        exports["tokovoip_script"]:removePlayerFromRadio(tonumber(CurrentFrequency))
    end
end)

RegisterNetEvent('eyrp_radio:ChangeFrequency')
AddEventHandler('eyrp_radio:ChangeFrequency', function(Data)
    local Frequency = KeyboardInput('Välj frekvens (Mhz)', '', 30);

    if not Frequency then return end;
    if not tonumber(Frequency) then
        exports['eyrp_notify']:LoadNotification('Frekvensen måste vara ett nummer', 'error', true)
        return
    end

    if tonumber(Frequency) < 1 then
        exports['eyrp_notify']:LoadNotification('Frekvensen måste vara minst 1', 'error', true)
        return
    end

    if tonumber(Frequency) > 4 then
        TriggerServerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
            name = Data.Tab,
            item = {
                uuid = Data.Item.uuid,
                data = { label = ' ', frequency = tonumber(Frequency) }
            }
        })
    end

    for _, LockedChannels in pairs(Config.LockedChannels) do

        if tonumber(Frequency) == LockedChannels['Frequency'] then

            TriggerServerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
                name = Data.Tab,
                item = {
                    uuid = Data.Item.uuid,
                    data = { frequency = tonumber(Frequency), label = LockedChannels['Label'] }
                }
            })
        end
    end
    exports['eyrp_notify']:LoadNotification('Du bytte till frekvens till ~y~' .. Frequency .. 'Mhz~s~', 'success')
end)

RegisterNetEvent('eyrp_radio:JoinRadio')
AddEventHandler('eyrp_radio:JoinRadio', function(Data)
    local Frequency = Data.Item['data'].frequency;

    if Frequency < 1 then
        exports['eyrp_notify']:LoadNotification('Du måste välja en frekvens innan du kan gå med', 'error', true)
        return
    end

    CurrentFrequency = Frequency

    --exports['mumble-voip']:SetRadioChannel(tonumber(Frequency))
    exports["tokovoip_script"]:addPlayerToRadio(tonumber(Frequency))
end)

RegisterNetEvent('eyrp_radio:LeaveRadio')
AddEventHandler('eyrp_radio:LeaveRadio', function(Data)

    -- exports['mumble-voip']:SetRadioChannel(0)

    local CurrentFrequency = Data.Item['data'].frequency;

    if CurrentFrequency then
        exports["tokovoip_script"]:removePlayerFromRadio(tonumber(CurrentFrequency))
    end
end)