RegisterNetEvent('tizo:finalas')
AddEventHandler("tizo:finalas", function(itemas)
    local _source = source
    local item = itemas
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerCoords = xPlayer.getCoords(true)
    local distance = #(playerCoords - vector3(-14.2849, 6485.2510, 31.4974))
    local turizoles = exports.ox_inventory:GetItemCount(_source, 'cbdzole')
    if distance <= 15 then
        if item == 'burger' then
            exports.ox_inventory:AddItem(_source, 'cbdzole', 1)
        elseif item == 'water' and turizoles > 1 then
            exports.ox_inventory:AddItem(_source, 'cbdjointas', 1)
            exports.ox_inventory:RemoveItem(_source, 'cbdzole', 2)
        elseif item == 'water' and turizoles == 1 or 0 then
            TriggerClientEvent('ox_lib:notify', _source, { type = 'error', description = 'Neturi Zoles!'})
        else
            print("Player triggered this bad boy - "..source)
        end
    else
        print("Player attempted to trigger the event outside of the allowed area. ID - "..source)
    end
end)
lib.callback.register('tizo:turizirkles', function(hasLicense)
    local _source = source
	local zirkles = exports.ox_inventory:GetItemCount(_source, 'scissors')
	if zirkles ~= 0 then
        return true
    else 
        return false
    end
end)