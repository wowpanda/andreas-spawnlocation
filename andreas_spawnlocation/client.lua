ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function fade()
	DoScreenFadeOut(1500)
	Wait(2000)
	DoScreenFadeIn(1500)
end

RegisterNUICallback('park', function()
	fade()
	SetEntityCoords(GetPlayerPed(-1), Config.Park.x, Config.Park.y, Config.Park.z)
end)

RegisterNUICallback('sjukhus', function()
	fade()
	SetEntityCoords(GetPlayerPed(-1), Config.Hospital.x, Config.Hospital.y, Config.Hospital.z)
end)

RegisterNUICallback('motell', function()
	fade()
	SetEntityCoords(GetPlayerPed(-1), Config.Motell.x, Config.Motell.y, Config.Motell.z)
end)

RegisterNUICallback('senaste', function()
	fade()
	TriggerEvent('andreas_spawnlocation:spawn')
end)

RegisterNUICallback('NUIFocusOff', function()
	fade()
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)

RegisterNetEvent('andreas_spawnlocation:setNui')
AddEventHandler('andreas_spawnlocation:setNui', function()
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openGeneral'})
end)

-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 163) then
			SetNuiFocus(true, true)
			SendNUIMessage({type = 'openGeneral'})
		end
	end
end)