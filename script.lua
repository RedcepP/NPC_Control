local config = {
    npc = 1.0,
    veiculos = 1.0,
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPedDensityMultiplierThisFrame(config.npc)
        SetScenarioPedDensityMultiplierThisFrame(config.npc, config.npc)
        SetRandomVehicleDensityMultiplierThisFrame(config.veiculos)
        SetParkedVehicleDensityMultiplierThisFrame(config.veículos)
        SetVehicleDensityMultiplierThisFrame(config.veiculos)

    end 
end)
