function onSay(player, words, param)
	local days = 4
	local players = Game.getPlayers()

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	for _, targetPlayer in ipairs(players) do
		targetPlayer:addPremiumDays(days)
		targetPlayer:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, '[Vanaheim Global] Voce recebeu ' .. days .. ' dias de Premium Account.')
		targetPlayer:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
	end
end
