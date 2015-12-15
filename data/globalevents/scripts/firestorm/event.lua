dofile('data/firestorm_event.lua')
function onThink(interval)
	if _Fire_Event_Days[os.date("%A")] then
		hours = tostring(os.date("%X")):sub(1, 5)
		tb = _Fire_Event_Days[os.date("%A")][hours]
		if tb then
			resetfsVariables()
			if Game.getStorageValue(fsStartedGlobalStorage) < 1 then
				local teleport = Game.createItem(1387, 1, fsCreateTeleportPosition)
				if teleport then
					teleport:setActionId(5499)
				end
			end
			Game.setStorageValue(fsStartedGlobalStorage, 1)
			Game.broadcastMessage('[Firestorm] Um teleport foi criado em frente ao depot de Thais, corram, faltam ' .. fsWaitMinutes .. ' minutos para o teleport sumir!', MESSAGE_STATUS_WARNING)
			addEvent(startfirestorm, fsWaitMinutes * 60 * 1000)
		end
	end
	return true
end
