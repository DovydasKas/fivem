local display = false

--command to open menu
RegisterCommand("menu", function(source, args)
    SetDisplay(not display)
end)

RegisterNUICallback("exit", function(data)
    chat("Menu closed", {0,255,0})
    SetDisplay(false)
end)

--Change ped model
RegisterNUICallback("pedModel", function(data)
    chat(data.text, {0,255,0})
    SetDisplay(false)
end)

----spawn vehicle
--RegisterNUICallback("vehicle", function(data)
--    local car = data.text
--    
--    
--    
--    
--    SetDisplay(false)
--end)
--
--get weapon
--RegisterNUICallback("weapon", function(data)
--    local weapon = data.text
--    
--    
--    
--    
--    SetDisplay(false)
--end)

--if error, print to chat
RegisterNUICallback("error", function(data)
    chat(data.error, {255,0,0})
    SetDisplay(false)
end)
--on/off menu
function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
while display do
    Citizen.wait(0)
    DisableControlAction(0, 1, display)
    DisableControlAction(0, 2, display)
    DisableControlAction(0, 142, display)
    DisableControlAction(0, 18, display)
    DisableControlAction(0, 322, display)
    DisableControlAction(0, 106, display)
    end
end)

--message to chat
function chat(str, color)
    TriggerEvent('chat:addMessage', {
        color = color,
        multiline = true,
        args = {str}

    })
end

