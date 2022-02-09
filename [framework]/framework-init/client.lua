
AddEventHandler('onClientGameTypeStart', function()
    TriggerServerEvent('framework:SpawnPlayer')
end)

RegisterNetEvent('framework:LastPosition')
AddEventHandler('framework:LastPosition', function(PosX,PosY,PosZ,model)
   exports.spawnmanager:spawnPlayer({
    x = PosX,
    y = PosY,
    z = PosZ,
    pModel = model})

end)

Citizen.CreateThread(function() -- Save player pos

    while true do
        Citizen.Wait(10000) -- Every 10 seconds
        local playerPed = GetPlayerPed(PlayerId())
        local model = GetEntityModel(playerPed)
        PosX, PosY, PosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) -- Get players X Y Z
        TriggerServerEvent('framework:SavePlayerPosition', PosX, PosY, PosZ, model) -- Save it
        
    end
end)

