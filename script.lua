local config = {
    npc = 1.0, -- 0.0 (Desativa npc)
    veiculos = 1.0, -- 0.0 (Desativa Veículos)
    barcos = 1.0, -- 0.0 (Desativa Barcos)
    policia = 1.0, -- 0.0 (Desativa npc da Policia)
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPedDensityMultiplierThisFrame(config.npc)
        SetScenarioPedDensityMultiplierThisFrame(config.npc, config.npc)
        SetRandomVehicleDensityMultiplierThisFrame(config.veiculos)
        SetParkedVehicleDensityMultiplierThisFrame(config.veículos)
        SetVehicleDensityMultiplierThisFrame(config.veiculos)
        SetRandomBoats(config.barcos)
        SetCreateRandomCops(config.policia)
        SetCreateRandomCopsNotOnScenarios(config.policia)
        SetCreateRandomCopsOnScenarios(config.policia)

    end 
end)
