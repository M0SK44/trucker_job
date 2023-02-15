
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



-- @events
RegisterNetEvent("trucker_job:giveMoney", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local pago = math.random (Config.MinPayout,Config.MaxPayout)
    xPlayer.showNotification("Recibiste un pago de $"..pago)
    xPlayer.addMoney(pago)
   
end)


