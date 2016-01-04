local config = {
	[2150] = {onWater = Position(32652, 32981, 8), outWater = Position(32652, 32978, 8), fromPos = Position(32652, 32980, 8)},
	[2151] = {onWater = Position(32651, 32981, 8), outWater = Position(32651, 32978, 8), fromPos = Position(32651, 32980, 8)},
	[2153] = {onWater = Position(32613, 32977, 8), outWater = Position(32613, 32980, 8), fromPos = Position(32613, 32978, 8)},
	[2154] = {onWater = Position(32612, 32977, 8), outWater = Position(32612, 32980, 8), fromPos = Position(32612, 32978, 8)},
	[2155] = {onWater = Position(32622, 32995, 8), outWater = Position(32622, 32992, 8), fromPos = Position(32622, 32994, 8)},
	[2156] = {onWater = Position(32621, 32995, 8), outWater = Position(32621, 32992, 8), fromPos = Position(32621, 32994, 8)},
	[2157] = {onWater = Position(32593, 33000, 8), outWater = Position(32590, 33000, 8), fromPos = Position(32592, 33000, 8)},
	[2158] = {onWater = Position(32593, 32999, 8), outWater = Position(32590, 32999, 8), fromPos = Position(32592, 32999, 8)},
	[2159] = {onWater = Position(32590, 32983, 8), outWater = Position(32593, 32983, 8), fromPos = Position(32591, 32983, 8)},
	[2160] = {onWater = Position(32590, 32982, 8), outWater = Position(32593, 32982, 8), fromPos = Position(32591, 32982, 8)},
	[2161] = {onWater = Position(32245, 32891, 8), outWater = Position(32248, 32891, 8), fromPos = Position(32246, 32891, 8)},
	[2162] = {onWater = Position(32245, 32892, 8), outWater = Position(32248, 32892, 8), fromPos = Position(32246, 32892, 8)},
	[2163] = {onWater = Position(32233, 32920, 8), outWater = Position(32233, 32917, 8), fromPos = Position(32233, 32919, 8)},
	[2164] = {onWater = Position(32234, 32920, 8), outWater = Position(32234, 32917, 8), fromPos = Position(32234, 32919, 8)},
	[2165] = {onWater = Position(32263, 32913, 8), outWater = Position(32263, 32916, 8), fromPos = Position(32263, 32914, 8)},
	[2166] = {onWater = Position(32264, 32913, 8), outWater = Position(32264, 32916, 8), fromPos = Position(32264, 32914, 8)},
	[2167] = {onWater = Position(32271, 32873, 8), outWater = Position(32271, 32876, 8), fromPos = Position(32271, 32874, 8)},
	[2168] = {onWater = Position(32272, 32873, 8), outWater = Position(32272, 32876, 8), fromPos = Position(32272, 32874, 8)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = config[item.actionid]
	if not portal then
		return false
	end

	if portal.fromPos == fromPosition then
		player:teleportTo(portal.outWater, true)
	else
		player:teleportTo(portal.onWater, false)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	end

	return true
end
