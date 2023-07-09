Citizen.CreateThread(function() 
    Citizen.Wait(100); 

    while true do  

      local ped, sleepThread = PlayerPedId(), 750; 

      local health = GetEntityHealth(ped)
      local armor = GetPedArmour(ped)

      SendNUIMessage({
        heal = health, 
        armor = armor
      })

      Citizen.Wait(sleepThread);
    end
end) 

RegisterCommand('armor', function() 
  SetPedArmour(PlayerPedId(), 100)
end)