local config = {
    npcFrequencia = 1.0,
    veiculosFrequencia = 1.0,
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPedDensityMultiplierThisFrame(config.npcFrequencia)
        SetScenarioPedDensityMultiplierThisFrame(config.npcFrequencia, config.npcFrequencia)
        SetRandomVehicleDensityMultiplierThisFrame(config.veiculosFrequencia)
        SetParkedVehicleDensityMultiplierThisFrame(config.veiculosFrequencia)
        SetVehicleDensityMultiplierThisFrame(config.veiculosFrequencia)

    end 
end)
