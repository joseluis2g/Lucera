function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
		player:setSkull(SKULL_NONE)
		player:setSkullTime(0)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Seu skull foi removido com sucesso!")
		player:setKills({ })
		player:removeCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
		item:remove(1)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce so pode remover red ou black skull!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
