function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local p = param:split(",")
	if p[1] == "battlefield" then
		local players = tonumber(p[2])
		if players == nil then return false end
		if players % 2 ~= 0 then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Uma quantidade "par" de players deve ser setada para o evento iniciar.')
			return false
		end

		Game.setStorageValue(_Lib_Battle_Info.TeamOne.storage, 0)
		Game.setStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
		Game.setStorageValue(_Lib_Battle_Info.storage_count, 0)

		local tp = Game.createItem(1387, 1, _Lib_Battle_Info.tpPos)
		tp:setActionId(45000)
		CheckEvent(_Lib_Battle_Info.limit_Time)
		Game.setStorageValue(_Lib_Battle_Info.storage_count, players)
		broadcastMessage("[BattleField] Um teleport foi criado no templo de Thais, corram, apenas " .. players .. " jogadores poderao entrar, para serem divididos em " .. (players / 2) .. " VS " .. (players / 2) .. ".")
	end
	return false
end
