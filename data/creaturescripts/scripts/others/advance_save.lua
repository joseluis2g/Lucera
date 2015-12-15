local config = {
	heal = true,
	save = true,
	effect = false
}

local advances_storage_base = 55
local advances = {
	{level = 20, money = 20000, msg = 'Voce ganhou 20k por upar o level %d, aproveite e coloque sua promotion.'},
	{level = 50, money = 30000, msg = 'Voce ganhou 30k por upar o level %d.'},
	{level = 80, money = 40000, msg = 'Voce ganhou 40k por upar o level %d.'},
	{level = 100, money = 50000, msg = 'Voce ganhou 50k por upar o level %d.'}
}

function onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	if config.effect then
		player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
		player:say('LEVEL UP!', TALKTYPE_MONSTER_SAY)
	end

	if config.heal then
		player:addHealth(player:getMaxHealth())
	end

	if config.save then
		player:save()
	end

	if advances then
		for _, data in ipairs(advances) do
			if player:getLevel() >= data.level and player:getStorageValue(advances_storage_base + data.level) < 1 then
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, string.format(data.msg, data.level))
				player:addMoney(data.money)
				player:setStorageValue(advances_storage_base + data.level, 1)
				player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
				player:say('LEVEL UP!', TALKTYPE_MONSTER_SAY)
			end
		end
	end
	return true
end
