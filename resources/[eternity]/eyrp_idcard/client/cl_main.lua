Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

Idcard = {
	coords = vector3(441.43, -979.64, 30.69)
};

Citizen.CreateThread(function()
	Idcard:Init(); 
end)

function Idcard:Init() 
	while true do 
		local player = PlayerPedId(); 
		local interval = 1500; 

		local dst = #(GetEntityCoords(player) - Idcard.coords); 

		if dst < 5.0 then 
			interval = 5; 

			ESX.Game.Utils.DrawText3D(Idcard.coords, ('[~g~E~s~] - Hämta idkort')); 

			if dst < 1.0 then 
				if IsControlJustReleased(0, 38) then 
					Idcard:GiveIdcard(); 
				end
			end
		end

		Citizen.Wait(interval); 
	end
end

function Idcard:GiveIdcard()
	if exports['eyrp_inventory']:HasItem('idcard') then  
		ESX.ShowNotification('Du har redan ett idkort?')
	else
		ESX.TriggerServerCallback('eyrp_idcard:addInventoryItem', function() 
			
		end)
	end
end