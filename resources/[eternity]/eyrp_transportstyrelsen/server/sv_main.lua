ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end)  

VehicleData = {}

ESX.RegisterServerCallback("eyrp_transportstyrelsen:SearchVehicle", function(Source, Callback, Plate)
    local player = ESX.GetPlayerFromId(Source);

    if player then
        local sqlQuery = [[
            SELECT owner, vehicle, insured FROM owned_vehicles WHERE plate = @plate
        ]]

        MySQL.Async.fetchAll(sqlQuery, {
            ["@plate"] = Plate
        }, function(Response)
            if Response[1] then
                
                local UserFetch = [[
                    SELECT * FROM users WHERE identifier = @owner
                ]]
                
                MySQL.Async.fetchAll(UserFetch, {
                    ['owner'] = Response[1].owner
                }, function(Resp)

                    if Resp[1] then
                        Callback({
                            firstname = Resp[1].firstname,
                            lastname = Resp[1].lastname,
                            dob = Resp[1].dateofbirth,
                            sex = Resp[1].sex,
                            height = Resp[1].height,
                            plate = Plate,
                            vehicle = json.decode(Response[1].vehicle)
                        })
                    end
                end)
            else
                Callback(false)
            end
        end)
    end
end)