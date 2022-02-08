
AddEventHandler('onClientGameTypeStart', function()
    TriggerServerEvent('framework:SpawnPlayer')
end)

RegisterNetEvent('framework:LastPosition')
AddEventHandler('framework:LastPosition', function(PosX,PosY,PosZ)
   -- Citizen.wait(1)
    local defaultModel = 'a_f_m_prolhost_01'
    RequestModel(defaultModel) -- Need to request model before setting it
    while not HasModelLoaded(defaultModel) do
    print('Loading model...')
    wait(3000)
    end
    SetPlayerModel(PlayerId(), defaultModel)
    --SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(defaultModel) -- Remove model after its loaded and no longer needed

   SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1) -- spawn player in his last position
end)

Citizen.CreateThread(function() -- Save player pos
    while true do
        Citizen.Wait(10000) -- Every 10 seconds
        PosX, PosY, PosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) -- Get players X Y Z
        TriggerServerEvent('framework:SavePlayerPosition', PosX, PosY, PosZ) -- Save it
    end
end)