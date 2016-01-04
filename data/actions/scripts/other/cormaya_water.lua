local config = {
	[2050] = {position = Position(33202, 32012, 11)},
	[2051] = {position = Position(33264, 32012, 7)}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local portal = config[item.actionid]
	if not portal then
		return false
	end

	player:teleportTo(portal.position, false)
	player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	return true
end
