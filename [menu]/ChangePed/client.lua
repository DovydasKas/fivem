RegisterNetEvent('SetPedModel')
AddEventHandler('SetPedModel', function(source, pedName)
    local player = PlayerId()
    local ped = pedName
    if not IsModelValid(ped) then
        TriggerEvent('chat:addMessage', {
                args = {'Model is invalid!'}
            })
        return
        end
        
        RequestModel(ped)
        while not HasModelLoaded(ped) do
        wait(500)
        end
        SetPlayerModel(player, ped)
        SetModelAsNoLongerNeeded(ped)
    
end)