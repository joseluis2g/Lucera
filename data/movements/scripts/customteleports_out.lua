local config = {
	-- Port hope
	[5005] = {position = Position(32650, 32982, 8)},
	[5006] = {position = Position(32607, 32976, 8)},
	[5007] = {position = Position(32625, 32998, 8)},
	[5008] = {position = Position(32595, 33005, 8)},
	[5009] = {position = Position(32587, 32981, 8)},

	--Liberty Bay
	[5014] = {position = Position(32243, 32892, 8)},
	[5015] = {position = Position(32234, 32923, 8)},
	[5016] = {position = Position(32272, 32872, 8)},
	[5017] = {position = Position(32265, 32913, 8)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local portal = config[item.uid]
	if not portal then
		return false
	end

	player:teleportTo(portal.position, true)
	return true
end
