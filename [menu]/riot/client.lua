
RegisterCommand("riot", function(source, args)
    local var = args[1]
    if var == 'enable' then
        SetRiotModeEnabled(true)
        TriggerEvent('chat:addMessage', {
            args = {'Riot enabled'}
        })
    elseif var == 'disable' then
        SetRiotModeEnabled(false)
        TriggerEvent('chat:addMessage', {
            args = {'Riot disabled'}
        })
    end

end)