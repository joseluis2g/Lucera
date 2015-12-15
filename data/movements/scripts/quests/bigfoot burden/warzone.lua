local bosses = {
	[3144] = {position = Position(33099, 31950, 10), name = 'deathstrike'},
	[3145] = {position = Position(33103, 31951, 11), name = 'gnomevil'},
	[3146] = {position = Position(33081, 31902, 12), name = 'abyssador', checkItemId = 18463},
}

local timeToWait = 20 * 60 * 60 --20 hours
local timeBetweenBosses = 30 * 60 --minutes

local STORAGE_PITTIME = 1010 --time between bosses in pits (30 min)
local STORAGE_PITBUSY = 1030 --prevent entering players when the boss has been summoned
local STORAGE_SUMMON = 1020 --storage to store when a boss is going to ve summoned


function onStepIn(creature, item, position, fromPosition)
	local player = Player(creature)
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	if boss.checkItemId then
		if Tile(position):getItemById(boss.checkItemId) then
			return true
		end
	end

	if player:getStorageValue(item.uid) > os.time() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You need to wait ' .. timeToWait / 60 / 60 .. ' hours in order to fight with ' .. boss.name .. ' again.')
		player:teleportTo(fromPosition)
		return true
	end
	
	if (Game.getStorageValue(STORAGE_PITBUSY) or 0) > 0 or os.time() < (Game.getStorageValue(STORAGE_PITTIME) or 0) then --there is a team in the pits or not 30 min passed
		player:teleportTo(fromPosition)
		return true
	end
	
	player:teleportTo(boss.position)
	boss.position:sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have half an hour to heroically defeat ' .. boss.name .. '. Otherwise you\'ll be teleported out by the gnomish emergency device.')
	player:setStorageValue(item.uid, os.time() + timeToWait)
	
	if Game.getStorageValue(STORAGE_SUMMON) < 1 then
		Game.setStorageValue(STORAGE_SUMMON, 1)
		addEvent(summonBoss, 60 * 1000, item.uid)
		addEvent(removeBossFromPit, timeBetweenBosses * 1000, item.uid)
	end
	return true
end

function summonBoss(uid)
	if not isBossInPit(uid) then
		Game.createMonster(bosses[uid].name, bosses[uid].position)
		Game.setStorageValue(STORAGE_PITTIME, os.time() + timeBetweenBosses)
		Game.setStorageValue(STORAGE_PITBUSY, 1)
	end
end

function isBossInPit(uid)
	if not bosses[uid] then return false end
	for x = bosses[uid].position.x - 10, bosses[uid].position.x + 15 do
		for y = bosses[uid].position.y - 10, bosses[uid].position.y + 15 do
			local tile = Tile({x = x, y = y, z = bosses[uid].position.z})
			if tile then
				local creature = tile:getTopCreature()
				if creature and creature:isMonster() and creature:getName():lower() == bosses[uid].name:lower() then
					return creature
				end
			end
		end
	end
	return nil
end

function removeBossFromPit(uid)
	--to edit
	local c = isBossInPit(uid)
	if c ~= nil then
		c:remove()
	end
	Game.setStorageValue(STORAGE_SUMMON, 0)
	Game.setStorageValue(STORAGE_PITBUSY, 0)
	return false
end
--[[local bosses = {
	[3144] = {position = Position(33099, 31950, 10), name = 'deathstrike', str = 52500},
	[3145] = {position = Position(33103, 31951, 11), name = 'gnomevil', str = 52501},
	[3146] = {position = Position(33081, 31902, 12), name = 'abyssador', checkItemId = 18463, str = 52502},
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	local time = 24 * 60 * 60
	if player:getExhaustion(boss.str) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Voce so pode entrar nesta sala uma vez por dia.')
		player:teleportTo(fromPosition)
		return true
    end

	if boss.checkItemId then
		if Tile(position):getItemById(boss.checkItemId) then
			return true
		end
	end

	player:teleportTo(boss.position)
	player:setExhaustion(boss.str, time)
	boss.position:sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have half an hour to heroically defeat ' .. boss.name .. '. Otherwise you\'ll be teleported out by the gnomish emergency device.')
	return true
end]]
