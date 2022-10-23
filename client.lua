ESX                           = nil
local PlayerData              = {}

local ativadom = false
local pode = false
local playerPed = PlayerPedId()


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)  
		Citizen.Wait(0)
	end
end)


RegisterCommand('modo300', function(source, args, rawCommand)
    for i=1, #Config.trabalhos, 1 do
        if ESX.PlayerData.job.name == Config.trabalhos[i][1] then
            pode = true
        end
    end
    if pode == true and ativadom == false and IsPedSittingInAnyVehicle(playerPed) then  
		local jogador = GetPlayerPed(-1)
		local carro = GetVehiclePedIsIn(jogador, false)
		if carro ~= nil then 
		SetVehicleMaxSpeed(carro, 83.3)
		if Config.LegacyFuel == true then
		exports["LegacyFuel"]:SetFuel(carro, 100)
		else
		ESX.ShowNotification('Contacta um Administrador do servidor ! Erro: no.legacyfuel')
		end		
		if Config.alertas == 'default' or Config.alertas == "esx" or Config.alertas == "" or Config.alertas == nil then
		ESX.ShowNotification('Modo 300 Ativado')
		end
		if Config.alertas == 'mythic' or Config.alertas == 'mythic-notify' then
		exports['mythic_notify']:SendAlert('inform', 'Modo 300 Ativado', 3500) -- Caso Uses Mythic Notify.
		end
		if Config.alertas == 'okoknotify' or Config.alertas == 'okok' then
	    exports['okokNotify']:Alert('Modo 300', 'O Modo foi Ativado !', 3500, 'success') -- Caso uses OkOkNotify.
		end
		ativadom = true
		Citizen.Wait(Config.aguardar*60000) --Aguarde x Minutos para ativar o modo 300 novamente.
		ativadom = false
		end
     else
	if not pode or not IsPedSittingInAnyVehicle(playerPed) then
     if Config.alertas == 'default' or Config.alertas == "esx" or Config.alertas == "" or Config.alertas == nil then
	  ESX.ShowNotification('Não Podes usar este comando !')
	 end
     if Config.alertas == 'mythic' or Config.alertas == 'mythic-notify' then  
		 exports['mythic_notify']:SendAlert('error', 'Não Podes usar este comando !', 3500) -- Caso Uses Mythic Notify.
	 end	 
     if Config.alertas == 'okoknotify' or Config.alertas == 'okok' then 
		 exports['okokNotify']:Alert('', 'Não Podes usar este comando !', 3500, 'error')
	 end	 
	else
    if Config.alertas == 'default' or Config.alertas == "esx" or Config.alertas == "" or Config.alertas == nil then	 
     ESX.ShowNotification('Já Ativaste Modo 300 Recentemente. Aguarde '..Config.aguardar..' minuto(s), ou ocorreu um erro !')
	end 
    if Config.alertas == 'mythic' or Config.alertas == 'mythic-notify' then  
		 exports['mythic_notify']:SendAlert('error', 'Já Ativaste Modo 300 Recentemente. Aguarde '..Config.aguardar..' minuto(s), ou ocorreu um erro !', 3500) -- Caso Uses Mythic Notify. ( Usado no Video )
	end	 
    if Config.alertas == 'okoknotify' or Config.alertas == 'okok' then
		 exports['okokNotify']:Alert('', 'Já Ativaste Modo 300 Recentemente. Aguarde '..Config.aguardar..' minuto(s), ou ocorreu um erro !', 3500, 'error')
	end

        end		 
	end
end)

