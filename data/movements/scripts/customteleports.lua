local config = {
	-- Port hope
	[5000] = {position = Position(32649, 32983, 9)},
	[5001] = {position = Position(32609, 32974, 9)},
	[5002] = {position = Position(32620, 32997, 9)},
	[5003] = {position = Position(32597, 33005, 9)},
	[5004] = {position = Position(32588, 32980, 9)},

	-- Liberty Bay
	[5010] = {position = Position(32243, 32893, 9)},
	[5011] = {position = Position(32238, 32919, 9)},
	[5012] = {position = Position(32270, 32870, 9)},
	[5013] = {position = Position(32262, 32910, 9)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = config[item.uid]
	if not portal then
		return false
	end

	local headItem = player:getSlotItem(CONST_SLOT_HEAD)
	if headItem and isInArray({5461, 12541, 15408}, headItem.itemid) then
		player:teleportTo(portal.position)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		local itemPos = item:getPosition()
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(Position(itemPos.x, itemPos.y + 1, itemPos.z), true)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Without any device to allow underwater breathing, you will not be able to dive here.')
	end
	return true
end
