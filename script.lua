local config = {
    npc = 1.0, -- 0.0 (Desativa npc)
    veiculos = 1.0, -- 0.0 (Desativa Veículos)
    barcos = true, -- false (Desativa Barcos)
    policia = 1.0, -- 0.0 (Desativa npc da Policia)
    armasdrop = false, -- true (Ativa o drop de armas quando um npc é morto)
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Não alterar.
        SetPedDensityMultiplierThisFrame(config.npc)
        SetScenarioPedDensityMultiplierThisFrame(config.npc, config.npc)
        SetRandomVehicleDensityMultiplierThisFrame(config.veiculos)
        SetParkedVehicleDensityMultiplierThisFrame(config.veículos)
        SetVehicleDensityMultiplierThisFrame(config.veiculos)
        SetRandomBoats(config.barcos)
        SetCreateRandomCops(config.policia)
        SetCreateRandomCopsNotOnScenarios(config.policia)
        SetCreateRandomCopsOnScenarios(config.policia)

local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
    end
end)

-- remove os npc droparem armas.

function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finalizado = false

    repeat
        if not IsEntityDead(ped) then
            SetPedDropsWeaponsWhenDead(ped, config.armasdrop)
        end
        finalizado, ped = FindNextPed(handle)
    until not finalizado

    EndFindPed(handle)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        SetWeaponDrops()
    end
end)

-- Veículos de npc trancados.

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        local ped = GetPlayerPed(-1)
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
                Wait(1000)
            local veiculos = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
            local trancados = GetVehicleDoorLockStatus(veh)
            if trancados == 2 then
                ClearPedTasks(ped)
            end
        end
    end
end)
