
AddEventHandler('onClientGameTypeStart', function()
    TriggerServerEvent('framework:SpawnPlayer')
end)

RegisterNetEvent('framework:LastPosition')
AddEventHandler('framework:LastPosition', function(PosX,PosY,PosZ)
   exports.spawnmanager:spawnPlayer({
    x = PosX,
    y = PosY,
    z = PosZ,
    model = 's_m_y_robber_01'})

end)

Citizen.CreateThread(function() -- Save player pos
    
    while true do
        Citizen.Wait(10000) -- Every 10 seconds
        PosX, PosY, PosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) -- Get players X Y Z
        TriggerServerEvent('framework:SavePlayerPosition', PosX, PosY, PosZ) -- Save it

    end
end)