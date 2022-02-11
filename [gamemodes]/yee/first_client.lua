

------------- Car spawner
RegisterCommand("spawn", function(source, args)


    local vehiclee = args[1] or 'adder'

      if not IsModelInCdimage(vehiclee) or not IsModelAVehicle(vehiclee) then
        TriggerEvent('chat:addMessage', {
            args = {'Vehicle with the name '..vehiclee..' does not exist'}
        })
        return
    end
    
    RequestModel(vehiclee)
    while not HasModelLoaded(vehiclee) do
    wait(500)
    end

    local pedid = PlayerPedId()
    local Coords = GetEntityCoords(pedid)
    local car = CreateVehicle(vehiclee, Coords.x, Coords.y, Coords.z, GetEntityHeading(pedid), true, false)
    SetPedIntoVehicle(pedid, car, -1)

    SetEntityAsNoLongerNeeded(car)
    SetModelAsNoLongerNeeded(vehiclee)

    TriggerEvent('chat:addMessage', {
        args = {'Your vehicle has been spawned!'}
    })

end, false)
-----------------------------------------------------------------


---- Death message
Citizen.CreateThread(function()
    local resPos = vector3(298.3385, -584.7165, 43.24829)
    RegisterNetEvent("baseevents:onPlayerDied")
    
    AddEventHandler('baseevents:onPlayerDied', function()
        local x = 10
        while (x >=0) do       
            TriggerEvent('chat:addMessage', {
                args = {'You died, respawn availabe in '..x..'' }
            })
            Citizen.Wait(1000)
            x = x-1
        end
        TriggerEvent('chat:addMessage', {
            args = {'Press E to go to the hospital' }
        })
            while IsPlayerDead(PlayerId()) do
                Citizen.Wait(0)
                if IsControlJustReleased(0,  38) then
                    exports.spawnmanager:spawnPlayer({
                        x = resPos.x,
                        y = resPos.y,
                        z = resPos.z,
                        
                    })
                end
            end
    end)
end)
-----------------------------------------------------------------
 
