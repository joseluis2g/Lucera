function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemid = item:getId()
	local chance = math.random(100)
	if chance <= 85 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You ransack the pile but fail to find any usuful parts.')
		Game.createMonster("Guzzlemaw", Position(player:getPosition()))
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Amidst the pile of various bones you find a large, hollow part, similar to a pipe.')
		player:addItem(22389, 1)
	end
	item:transform(itemid + 1)
	addEvent(function()
		item:transform(itemid)
	end, 2 * 60 * 1000)
	return true
end
