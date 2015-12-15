function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getExhaustion(5493) > 0 then
		player:sendTextMessage(TALKTYPE_MONSTER_SAY, 'You cannot use objects that fast.')
		return false
	end

	player:say('Aaaah...', TALKTYPE_MONSTER_SAY)
	player:setExhaustion(5493, 1)
	return true
end
