function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local p = param:split(",")

	local target = Player(p[1])
	local addonMale = tonumber(p[2])
	local addonFemale = tonumber(p[3])

	if not target then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Player ' .. param .. ' is currently not online.')
		return false
	end

	if not addonMale or not addonFemale then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Set params.')
		return false
	end

	if target:getAccountType() > player:getAccountType() then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Cannot perform action.')
		return false
	end

	target:addOutfitAddon(addonMale, 3)
	target:addOutfitAddon(addonFemale, 3)

	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Os addons foram adicionados para ' .. target:getName() .. '.')
	target:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, '[Vanaheim Global] Voce recebeu seu premio.')
	target:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
	target:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
	target:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	return false
end
