TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local back = false
local inJob = false

-- @threads
CreateThread(function()
   SpawnNPC(Config.NPC,vector4(1197.12, -3253.5, 6.1,92.2))
   local listo = 0
   local marca = 0
    while true do
        local msec = 1000
        local Player = PlayerPedId()
        local pCoords = GetEntityCoords(Player)
        
        if #(pCoords - vector3(1197.12, -3253.5, 7.9)) < 20 and marca ==  1 then -- ## Mark of the truck ## --
            msec = 0
            DrawMarker(3, 1184.04, -3239.68, 10.04, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 50, 255, 255, 50, false, true, 2, nil, nil, false)
            if #(pCoords - vector3(1184.04, -3239.68, 7.9)) < 3 then    
             marca = 0 
            end   
        end  

        if #(pCoords - vector3(1197.12, -3253.5, 7.9)) < 5 and listo == 0 then -- ## start of work ## --
            msec = 0
            
            Create3D(config['job']['coords'], "~w~[~b~Trabajo Camionero~w~]\n~w~Presiona ~w~[~b~E~w~] para empezar a trabajar")
             
                if IsControlJustPressed(0, 38) then
                    
                    listo = 1
                    marca = 1
                    ESX.Game.SpawnVehicle(Config.Vehicle, vec3(1184.04, -3239.68, 6.04), 85.28, function(vehicle)
                        SetVehicleNumberPlateText(vehicle, "CAMION")
                    if Config.LegacyFuel == true then   
                        --TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) --  If you want the character to be inside the vehicle instantly
                        exports.LegacyFuel:SetFuel(GetVehiclePedIsIn(PlayerPedId()), 100) 
                        exports.LegacyFuel:SetFuel(vehicle, Config.Fuel)
                        -- ## (in case you use LegacyFuel)
                    end    
                       
                    end)
                    ESX.ShowNotification('Tu trabajo hoy es ir a descargar el camion, ~g~te marcamos en el GPS')
                    StartScreenEffect("SuccessNeutral", 0, 0)
                    PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                    sigsite = math.random(1, Config.Routesrandom) -- ## If you add more routes you must change here also the number ## --
                    distance = #(vector3(1171.52, -3243.62, 5.8) - vec3(config['routes'][sigsite].x,config['routes'][sigsite].y, config['routes'][sigsite].z))
                   
                    
                    inJob = true
                    SetNewWaypoint(config['routes'][sigsite].x, config['routes'][sigsite].y)
               
                end
            
            elseif #(pCoords - vector3(1197.12, -3253.5, 7.9)) < 5 and listo == 1 then
                msec = 0
                Create3D(config['job']['coords'], "~w~[~b~Trabajo Camionero~w~]\n~r~Ya sacaste un camión")    
        end

        if inJob then
            if #(pCoords  - vec3(config['routes'][sigsite].x, config['routes'][sigsite].y, config['routes'][sigsite].z)) < 15 then
                msec = 0
                DrawMarker(1,config['routes'][sigsite].x,config['routes'][sigsite].y, config['routes'][sigsite].z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.9001,255,255,51, 200, 0, 0, 0, 0)

                if #(pCoords  - vec3(config['routes'][sigsite].x, config['routes'][sigsite].y, config['routes'][sigsite].z)) < 3 then
                    ESX.ShowHelpNotification('Pulsa ~g~E ~w~para descargar el camion')
                    local playerPed = PlayerPedId()
                    if IsControlJustPressed(1, 38)  and IsVehicleModel(GetVehiclePedIsIn(playerPed, false), GetHashKey(Config.Vehicle))  then
                        local getVehicle = GetVehiclePedIsIn(PlayerPedId())
                        FreezeEntityPosition(getVehicle, true)
                        ESX.ShowNotification('Descargando el ~g~camion... ')
                        --exports['pogressBar']:drawBar(5000, 'Descargando el camion...', function() 			
                       -- end) ##Progress bar
                        Wait(5000)
                        FreezeEntityPosition(getVehicle, false)
                        inJob = false
                        StartScreenEffect("SuccessNeutral", 0, 0)
                        PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                        ESX.ShowNotification('Ve a dejar el camion a la ~g~empresa')
                        back = true
                        SetNewWaypoint(1189.77, -3242.96)
                        Citizen.Wait(5000)
                        ESX.ShowNotification('Recuerda hidratarte o comer para evitar algun accidente laboral')
                    else
                        ESX.ShowNotification('Recuerda que debes estar en el ~g~camion entregado')
                    end
                end
            end
        end

        if back then
            if #(pCoords  - vector3(1189.77, -3242.96, 5.03)) < 40 then
                msec = 0
                ESX.Game.Utils.DrawText3D(vector3(1189.77, -3242.96, 7.03), "[~b~Garaje~w~]\nDeja el camion aqui", 2, 0)
                DrawMarker(1,vector3(1189.77, -3242.96, 5.03), 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.9001,255,255,51, 200, 0, 0, 0, 0)

                if #(pCoords  - vector3(1189.77, -3242.96, 5.03)) < 3 then
                    ESX.ShowHelpNotification('Pulsa ~g~E ~w~para dejar el camion')
                    local playerPed = PlayerPedId()
                    if IsControlJustPressed(1, 38)  and IsVehicleModel(GetVehiclePedIsIn(playerPed, false), GetHashKey(Config.Vehicle))   then
                        local vehicle = GetVehiclePedIsIn(PlayerPedId())
                        ESX.Game.DeleteVehicle(vehicle)
                        StartScreenEffect("SuccessNeutral", 0, 0)
                        PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                        TriggerServerEvent("trucker_job:giveMoney") -- Pay
                        inJob = false
                        back = false
                        listo = 0
                    end
                end
            end
        end

        Wait(msec)
    end
end)


-- ## FUNTION 3D ## -- DONT TOUCH
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

-- ## BLIP ## --
blip = AddBlipForCoord(vector3(1197.12, -3253.5, 7.9))
SetBlipSprite(blip, 67)
SetBlipDisplay(blip, 4)
SetBlipScale(blip, 0.7)
SetBlipColour(blip, 46)
SetBlipAsShortRange(blip, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(Config.BlipName) --Name BLIP 
EndTextCommandSetBlipName(blip)

SpawnNPC = function (modelo, x,y,z,h)
    hash = GetHashKey(modelo)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
    Wait(1)
    end
    crearNPC = CreatePed(5,hash, x,y,z,h, false, true)
    FreezeEntityPosition(crearNPC, true)
    SetEntityInvincible(crearNPC, true)
    SetBlockingOfNonTemporaryEvents(crearNPC, true)
    TaskStartScenarioInPlace(crearNPC, "WORLD_HUMAN_CLIPBOARD", 0, false)
    
end