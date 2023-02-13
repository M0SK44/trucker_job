ESX = exports['es_extended']:getSharedObject()

-- ## INVENTARIO M0SK4 ## --

-- You need to change the coordinates to your liking, follow the pattern shown in the code

CreateThread(function()

    while true do
        local optimizado = 1000 -- optimization

        local Player = PlayerPedId()
        local pCoords = GetEntityCoords(Player)

        -- # INVENTORY 1 #
        if #(pCoords - vec3(107.68, -1975.52, 20.96)) < 3 then -- Groove --
            Create3D(vec3(107.68, -1975.52, 20.96),'~w~[~b~Inventario~w~] \n~w~Presiona [~b~E~w~] para ingresar ')
            -- DrawMarker(2, 107.68, -1975.52, 20.96-0.5 , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 50, false, true, 2, nil, nil, false) # If you need a marking this is the option
            optimizado = 0
            if IsControlJustReleased(0, 38) and
                #(pCoords - vec3(107.68, -1975.52, 20.96)) then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(),
                                 'inventario_ballas', {
                    title = "Contraseña del inventario" -- Name input
                }, function(data, menu)
                    local amount = tonumber(data.value)

                    if amount == 500 then -- "500" Is password
                        PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS",
                                          1) -- sound effect
                        StartScreenEffect("SuccessNeutral", 0, 0) -- sound
                        TriggerEvent('inventory:openHouse', "steam:id",
                                     "Inventario 1", "Inventario banda", 400) -- Trigger chezza inventory personal
                        menu.close()
                    else
                        ESX.ShowNotification("~r~Esta no es la contraseña del inventario")
                        menu.close()
                    end
                end, function(data, menu) menu.close() end)
            end
        end

        -- # INVENTORY 2 #

        if #(pCoords - vec3(-163.4, -1619.2, 33.64)) < 3 then -- Families --
            Create3D(vec3(-163.4, -1619.2, 33.64),'~w~[~b~Inventario~w~] \n~w~Presiona [~b~E~w~] para ingresar ')
            optimizado = 0
            if IsControlJustReleased(0, 38) and
                #(pCoords - vec3(-163.4, -1619.2, 33.64)) then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(),
                                 'inventario_ballas',
                                 {title = "Contraseña del inventario"},
                                 function(data, menu)
                    local amount = tonumber(data.value)

                    if amount == 2810038 then
                        PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS",
                                          1)
                        StartScreenEffect("SuccessNeutral", 0, 0)
                        TriggerEvent('inventory:openHouse', "steam:id",
                                     "Inventario families",
                                     "Inventario banda f", 400)
                        menu.close()
                    else
                        ESX.ShowNotification(
                            "~r~Esta no es la contraseña del inventario")
                        menu.close()
                    end
                end, function(data, menu) menu.close() end)
            end
        end

        -- # INVENTORY 3 #

        if #(pCoords - vec3(1250.68, -1581.0, 58.36)) < 3 then -- Marabunta --
            Create3D(vec3(1250.68, -1581.0, 58.36),'~w~[~b~Inventario~w~] \n~w~Presiona [~b~E~w~] para ingresar ')
            optimizado = 0
            if IsControlJustReleased(0, 38) and
                #(pCoords - vec3(1250.68, -1581.0, 58.36)) then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(),
                                 'inventario_ballas',
                                 {title = "Contraseña del inventario"},
                                 function(data, menu)
                    local amount = tonumber(data.value)

                    if amount == 8269 then
                        PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS",
                                          1)
                        StartScreenEffect("SuccessNeutral", 0, 0)
                        TriggerEvent('inventory:openHouse', "steam:id",
                                     "Inventario marabunta",
                                     "Inventario banda m", 400)
                        menu.close()
                    else
                        ESX.ShowNotification(
                            "~r~Esta no es la contraseña del inventario")
                        menu.close()
                    end
                end, function(data, menu) menu.close() end)
            end
        end

        -- # INVENTORY 4 #

        if #(pCoords - vec3(2188.16, 5569.72, 53.88)) < 3 then -- Norte Weed camp --
            Create3D(vec3(2188.16, 5569.72, 53.88),'~w~[~b~Inventario~w~] \n~w~Presiona [~b~E~w~] para ingresar ')
            optimizado = 0
            if IsControlJustReleased(0, 38) and
                #(pCoords - vec3(2188.16, 5569.72, 53.88)) then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(),
                                 'inventario_ballas',
                                 {title = "Contraseña del inventario"},
                                 function(data, menu)
                    local amount = tonumber(data.value)

                    if amount == 5647382910 then
                        PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS",
                                          1)
                        StartScreenEffect("SuccessNeutral", 0, 0)
                        TriggerEvent('inventory:openHouse', "steam:id",
                                     "Inventario weed camp",
                                     "Inventario banda c", 400)
                        menu.close()
                    else
                        ESX.ShowNotification(
                            "~r~Esta no es la contraseña del inventario")
                        menu.close()
                    end
                end, function(data, menu) menu.close() end)
            end
        end

        -- # INVENTORY 5 #

        if #(pCoords - vec3(485.28, -1533.68, 29.28)) < 3 then -- Azteca --
            Create3D(vec3(485.28, -1533.68, 29.28),'~w~[~b~Inventario~w~] \n~w~Presiona [~b~E~w~] para ingresar ')
            optimizado = 0
            if IsControlJustReleased(0, 38) and
                #(pCoords - vec3(485.28, -1533.68, 29.28)) then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(),
                                 'inventario_ballas',
                                 {title = "Contraseña del inventario"},
                                 function(data, menu)
                    local amount = tonumber(data.value)

                    if amount == 0798 then
                        PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS",
                                          1)
                        StartScreenEffect("SuccessNeutral", 0, 0)
                        TriggerEvent('inventory:openHouse', "steam:id",
                                     "Inventario azteca", "Inventario banda a",
                                     400)
                        menu.close()
                    else
                        ESX.ShowNotification(
                            "~r~Esta no es la contraseña del inventario")
                        menu.close()
                    end
                end, function(data, menu) menu.close() end)
            end
        end

        Wait(optimizado)

    end

end)

-- ## FUNCIONES ## --

Create3D = function(coords, texto)
    local x, y, z = table.unpack(coords)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0 * scale, 0.33 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropshadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(5)
        AddTextComponentString(texto)
        DrawText(_x, _y)
    end
end
