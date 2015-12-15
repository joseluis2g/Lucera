function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local p = param:split(",")

	local target = Player(p[1])
	local mount = tonumber(p[2])

	if not target then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Player ' .. param .. ' is not currently online.')
		return false
	end

	if not mount then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Set param.')
		return false
	end

	if target:getAccountType() > player:getAccountType() then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Cannot perform action.')
		return false
	end

	target:addMount(mount)

	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'A montaria foi adicionada para ' .. target:getName() .. '.')
	target:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, '[Vanaheim Global] Voce recebeu seu premio.')
	target:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
	target:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
	target:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	return false
end
