
AddEventHandler('PlayerSpawned', function()
    TriggerServerEvent('framework:SpawnPlayer')
end)

RegisterNetEvent('framework:LastPosition')
AddEventHandler('framework:LastPosition', function(x,y,z)
    Citizen.wait(1)
    local defaultModel = GetHashKey('mp_m_freemode_01')
    RequestModel(defaultModel) -- Need to request model before setting it
    while not HasModelLoaded(defaultModel) do -- Wait for model to load, so game does not crash
        Citizen.wait(1)
    end
    SetPlayerModel(PlayerId(), defaultModel)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(defaultModel) -- Remove model after its loaded and no longer needed

    SetEntityCoords(GetPlayerPed(-1), x, y, z, 1, 0, 0, 1) -- spawn player in his last position
end)

Citizen.CreateThread(function() -- Save player pos
    while true do
        Citizen.Wait(5000) -- Every 5 seconds
        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) -- Get players X Y Z
        TriggerServerEvent('framework:SavePlayerPosition', x, y, z) -- Save it
    end
end)