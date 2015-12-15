dofile('data/firestorm_event.lua')
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if Game.getStorageValue(fsStartedGlobalStorage) == 2 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'O evento ja comecou.')
		player:teleportTo(fromPosition, true)
		return false
	end

	if Game.getStorageValue(fsStartedGlobalStorage) == 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'O evento nao esta aberto.')
		player:teleportTo(fromPosition, true)
		return false
	end

	if Game.getStorageValue(fsJoinedCountGlobalStorage) >= fsMaxPlayers then
		player:teleportTo(fromPosition, true)
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'O evento ja esta cheio! [' .. Game.getStorageValue(fsJoinedCountGlobalStorage) .. '/' .. fsMaxPlayers .. ']')
		return false
	end

	player:teleportTo(fsWaitingRoomPos)
	Game.setStorageValue(fsJoinedCountGlobalStorage, Game.getStorageValue(fsJoinedCountGlobalStorage) + 1)
	Game.broadcastMessage(string.format('%s entrou no Firestorm Event! [%s/' .. fsMaxPlayers .. '].', player:getName(), Game.getStorageValue(fsJoinedCountGlobalStorage)), MESSAGE_STATUS_WARNING)
	player:setStorageValue(fsJoinStorage, 1)
	return true
end
