Config = {}
Config.BlipName = 'Trabajo de camionero'
-- ## Payment of work ## --
Config.MinPayout = 120 -- Minimum Payout
Config.MaxPayout = 150 -- Max Payout

-- ## do you use legacy fuel? ## --
Config.LegacyFuel = true -- true yes , false no
Config.Fuel = 100 -- 100% You can put the value you want from 0 - 100 of how much gasoline you want the truck to have

Config.Vehicle = 'pounder' -- https://wiki.rage.mp/index.php?title=Vehicles  ## search for the vehicle code you want

Config.NPC = 'a_m_m_indian_01' -- https://docs.fivem.net/docs/game-references/ped-models/ search you ped

config = {
    ['job'] = {
        ['coords'] = vector3(1197.12, -3253.5, 8.2),
    },
    ['routes'] = {
        [1] = {
            x = 77.17,
            y = 6337.0,
            z = 30.23
        },
        [2] = {
            x = 1348.89,
            y = 3600.74,
            z = 33.87
        },
        [3] = {
            x = -3019.12,
            y = 86.23,
            z = 10.61
        },
        [4] = {
            x = -1921.53,
            y = 2044.62,
            z = 139.74
        },
        [5] = { -- Routesrandom end
            x = 3563.1,
            y = 3661.41,
            z = 32.9
        }
    }
}

-- # IMPORTANT # --
--If you add more routes to the config above you must add the last number as for example now it is "5"
Config.Routesrandom= 5 