local blessings = {
	{id = BLESSING_WISDOM_OF_SOLITUDE, name = 'Wisdom of Solitude'},
	{id = BLESSING_SPARK_OF_PHOENIX, name = 'Spark of the Phoenix'},
	{id = BLESSING_FIRE_OF_SUNS, name = 'Fire of the Suns'},
	{id = BLESSING_SPIRITUAL_SHIELDING, name = 'Spiritual Shielding'},
	{id = BLESSING_EMBRACE_OF_TIBIA, name = 'Embrace of Tibia'},
	{id = BLESSING_TWIST_OF_FATE, name = 'Twist of Fate'}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local result, bless = 'Received blessings:'
	for i = 1, #blessings do
		bless = blessings[i]
		result = player:hasBlessing(bless.id) and result .. '\n' .. bless.name or result
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 20 > result:len() and 'No blessings received.' or result)
	return true
end
