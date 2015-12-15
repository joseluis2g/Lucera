local theInquisitionQst = {
	[1] = {str = Storage.TheInquisition.Questline, value = 21},
	[2] = {str = Storage.TheInquisition.Mission01, value = 7},
	[3] = {str = Storage.TheInquisition.Mission02, value = 3},
	[4] = {str = Storage.TheInquisition.Mission03, value = 6},
	[5] = {str = Storage.TheInquisition.Mission04, value = 3},
	[6] = {str = Storage.TheInquisition.Mission05, value = 3},
	[7] = {str = Storage.TheInquisition.Mission06, value = 3},
	[8] = {str = Storage.TheInquisition.Mission07, value = 1}
}

--[[local throneStorages = {
	Storage.PitsOfInferno.ThroneInfernatil,
	Storage.PitsOfInferno.ThroneTafariel,
	Storage.PitsOfInferno.ThroneVerminor,
	Storage.PitsOfInferno.ThroneApocalypse,
	Storage.PitsOfInferno.ThroneBazir,
	Storage.PitsOfInferno.ThroneAshfalor,
	Storage.PitsOfInferno.ThronePumin
}

local function hasTouchedOneThrone(player)
	for i = 1, #throneStorages do
		if player:getStorageValue(throneStorages[i]) == 1 then
			return true
		end
	end
	return false
end]]

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	if player:getStorageValue(51995) <= 0 then
		for _, cfg in pairs(theInquisitionQst) do
			player:setStorageValue(cfg.str, cfg.value)
		end
		player:setStorageValue(51995, 1)
		player:addItem(7494, 1)
	end

	--[[if not hasTouchedOneThrone(player) or player:getLevel() < 100 or player:getStorageValue(Storage.TheInquisition.Questline) < 20 then
		player:teleportTo(fromPosition)
		position:sendMagicEffect(CONST_ME_TELEPORT)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end]]

	local destination = Position(33168, 31683, 15)
	player:teleportTo(destination)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
