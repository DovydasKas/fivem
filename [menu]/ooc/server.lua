RegisterServerEvent('chat:serverAdd')
AddEventHandler('chat:serverAdd', function(name, message)

    TriggerEvent('chat:addMessage',{
        multiline = true,
        args = {'OOC '..name.. message}
    })

end)