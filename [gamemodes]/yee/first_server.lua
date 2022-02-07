

-- Get player cords
RegisterCommand("cords", function(source, args, rawCommand)
    --local pedid = PlayerId()
    local ped = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(ped)

    print(playerCoords)

end, false)
-----------------------------------------------------------------
