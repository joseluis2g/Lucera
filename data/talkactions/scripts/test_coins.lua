function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local pontos = player:getPoints()
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Total: " .. pontos)
	return false
end
