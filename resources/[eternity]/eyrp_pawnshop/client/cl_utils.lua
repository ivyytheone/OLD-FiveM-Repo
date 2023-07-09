Utils = {};

Utils.SpawnEntityPed = function(Data) 
    if not DoesEntityExist(Ped) then  
        RequestModel(Data.Model) 

        while not HasModelLoaded(Data.Model) do  
            Citizen.Wait(0)
        end

        Ped = CreatePed(5, Data.Model, Data.Coords - vector4(0, 0, 0.98, 0), false, false)  

        FreezeEntityPosition(Ped, true) 

        SetEntityInvincible(Ped, true)
        SetBlockingOfNonTemporaryEvents(Ped, true)
        SetPedDefaultComponentVariation(Ped) 
    end 
end