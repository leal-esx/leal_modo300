ESX                           = nil
local PlayerData              = {}
local ativadom = false
local playerPed = PlayerPedId()

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)  
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)


RegisterCommand('modo300', function(source, args, rawCommand)
	if (PlayerData.job.name == 'police' or PlayerData.job.name == 'gnr') and ativadom == false and IsPedSittingInAnyVehicle(playerPed) then 
		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		if vehicle ~= nil then 
		SetVehicleMaxSpeed(vehicle, 75.5)
		exports["LegacyFuel"]:SetFuel(vehicle, 100)
		ESX.ShowNotification('Modo 300 Ativado')
		--exports['mythic_notify']:SendAlert('inform', 'Modo 300 Ativado', 3500) -- Caso Uses Mythic Notify.
		--exports['okokNotify']:Alert('Modo 300', 'Ativado !', 3500, 'success') -- Caso uses OkOkNotify.
		ativadom = true
		Citizen.Wait(60000*5) --Aguarde 5 Minutos para ativar o modo 300 novamente.
		ativadom = false
		end
     else
	if not (PlayerData.job.name == 'police' or PlayerData.job.name == 'gnr') or not IsPedSittingInAnyVehicle(playerPed) then
	     --ESX.ShowNotification('Não Podes usar este comando !')
		 exports['mythic_notify']:SendAlert('error', 'Não Podes usar este comando !', 3500) -- Caso Uses Mythic Notify.
		 --exports['okokNotify']:Alert('', 'Não Podes usar este comando !', 3500, 'error')
	else	 
         --ESX.ShowNotification('Já Ativaste Modo 300 Recentemente. Aguarde 5 Minutos !')
		 exports['mythic_notify']:SendAlert('error', 'Já Ativaste Modo 300 Recentemente. Aguarde 5 Minutos', 3500) -- Caso Uses Mythic Notify. ( Usado no Video )
		 --exports['okokNotify']:Alert('', 'Já Ativaste Modo 300 Recentemente. Aguarde 5 minutos!', 3500, 'error')
        end		 
	end
end)

