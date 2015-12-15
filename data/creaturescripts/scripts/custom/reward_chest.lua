-- CONFIG
REWARD_CHEST = {
	BOSSES = {"bibby bloodbath", "chizzoron the distorter", "ferumbras",
			"furyosa", "gaz'haragoth", "ghazbaran", "hirintror",
			"jaul", "mad mage", "mawhawk", "morgaroth", "obujos",
			"ocyakao", "omrafir", "orshabaal", "raging mage",
			"tanjis", "the mutated pumpkin", "the pale count",
			"the welter", "tyrn", "white pale", "zulazza the corruptor",
			"zushuka"}, -- LOWER ->  'Orshabaal' should be 'orshabaal'
	
	
	-- List of items to sell -- Each one of them got 250 gold price -- 	
	
	-- Next update this will be available
	jewelry = {
		{	ids = {2150, 9970, 2146},
			price = 200 -- in Gold Coins
		},
		
		{	ids = {2149, 2147, 2146},
			price = 250
		},
		
		{	ids = {2145, 2143},
			price = 300
		},
		
		{	ids = {18418, 18417, 2150},
			price = 400
		},
		
		{	ids = {2149},
			price = 500
		},
		
		{	ids = {18419},
			price = 800
		},
		
		{	ids = {18414},
			price = 1500
		},
		
		{	ids = {7632, 7633, 5799},
			price = 3000
		},
		{	ids = {9971},
			price = 3000
		}
		
	},
	-- Features -- 
	BankMoney = true, -- Auto bank money from bosses
	AutoSellJewelry = true, -- Auto sell jewely and bank their money.
	
	
	-- Defaults -- 
	CONTAINER = 1988, -- This is just must be a container.  -- Don't edit it.
	CORPSE_INTERVAL = 3, -- in minutes, this will remove corpse and move loot to player.
	STORAGES = {
		STORAGE_SQL_TABLE = 919561,
	},
	
	storage_can_open = 102012,
	-- Non Configurable -- 
	LOOT = {}, -- Most important Table.	
	RESERVED_LOOT = {}, -- For people who logged out and didn't take loot.
	
	unique = {},
	highestKiller = {}
}

-- Next update this will be available
local rareItems = {
8850, 7453, 2522, 8852, 8929, 8865, 8869, 8926
}
local uniqueItems = {
5903,
}
--------------------------------------

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
	if type(creature) ~= 'userdata' then
		creature = Creature(creature)
	end
	if type(attacker) ~= 'userdata' then
		attacker = Creature(attacker)
	end
	if attacker then
		if isMonster(creature) then	
			if isInArray(REWARD_CHEST.BOSSES, creature:getName():lower()) then	
				if isPlayer(attacker) then
					if attacker:checkSelectedBoss() ~= creature.uid then
						attacker:selectPlayerBoss(creature) 
					end
					local pop = primaryDamage
					if primaryDamage > creature:getHealth() then
						pop = creature:getHealth()
					end

					if isInArray(REWARD_CHEST.BOSSES, creature:getName():lower()) then
						attacker:updateDamage('killing', pop)
					end
				end
			end
		elseif isPlayer(creature) then
			if isPlayer(attacker) then
			
				if compareBosses(creature, attacker) then
				
					if creature:getTarget() then	
					
						if isInArray(REWARD_CHEST.BOSSES, creature:getTarget():getName():lower()) then		
							local target = creature:getTarget():getName():lower()	
							local leftHp = creature:getTarget():getMaxHealth()-creature:getTarget():getHealth()
							if (primaryType == COMBAT_HEALING) then	
								if attacker.uid ~= creature.uid then
									if leftHp < primaryDamage then
										attacker:updateDamage('healing', leftHp)
									else
										attacker:updateDamage('healing', primaryDamage)
									end
								end
							else
								creature:updateDamage('blocking', primaryDamage)
							end				
						end		
						
					end
					
				end
			end
		end
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

function compareBosses(self, attacker)
	if not REWARD_CHEST.LOOT[self:getGuid()] then 
		REWARD_CHEST.LOOT[self:getGuid()] = {}
		print('Error -> Function compareBosses', 'Player with guid '..self:getGuid()..' was not registered.')
		return false
	end
	if not REWARD_CHEST.LOOT[self:getGuid()]['mUid'] then
		return false
	end
	
	if REWARD_CHEST.LOOT[self:getGuid()]['mUid'] == REWARD_CHEST.LOOT[attacker:getGuid()]['mUid'] then
		return true
	end
	
	return false
end
function onKill(creature, target)
	if target:getMaster() then
		return true
	end
    if (Monster(target) ~= nil) and isInArray(REWARD_CHEST.BOSSES, target:getName():lower()) then
    	local corpse = Item(doCreateItem(MonsterType(target:getName()):getCorpseId(), 1, target:getPosition()))
    	local pos, id = corpse:getPosition(), corpse:getId()
		local id = corpse:getId()
		corpse:remove()
    	target:setDropLoot(false)
		doLootPlayers(target, pos, id)
    end
	return true
end

-- Table Functions
functions = {
	dmgStrings = {'killing', 'healing', 'blocking'},
	dmgIntegers = {1, 2, 3}
}
--[[check boss UID 
]]
function Player.checkSelectedBoss(self)
	if not REWARD_CHEST.LOOT[self:getGuid()] then
		REWARD_CHEST.LOOT[self:getGuid()] = {}
	end
	if REWARD_CHEST.LOOT[self:getGuid()]['mUid'] then
		return REWARD_CHEST.LOOT[self:getGuid()]['mUid']
	end
	return nil
end
function Player.selectPlayerBoss(self, targetEx)
	if not REWARD_CHEST.LOOT[self:getGuid()] then
		print('Error -> Function selectPlayerBoss', 'Player wasn\'t registered.')
		REWARD_CHEST.LOOT[self:getGuid()] = {}
	end
	REWARD_CHEST.LOOT[self:getGuid()]['killingDamage'] = 0
	REWARD_CHEST.LOOT[self:getGuid()]['healingDamage'] = 0
	REWARD_CHEST.LOOT[self:getGuid()]['blockingDamage'] = 0
	
	REWARD_CHEST.LOOT[self:getGuid()]['mUid'] = targetEx.uid
	if REWARD_CHEST.LOOT[self:getGuid()]['mUid'] ~= targetEx.uid then
		print('Error -> Function selectPlayerBoss', 'Monster UID is not registerd to player'..self:getGuid()..'.')
	end
end
function Player.getLootInfo(self, eType)
	if type(eType) ~= 'string' then
		return false
	end
	
	if not REWARD_CHEST.LOOT[self:getGuid()] then
		REWARD_CHEST.LOOT[self:getGuid()] = {}
		print('Error -> Function getLootInfo', 'Player wasn\'t registered, registerd so.')
		return nil
	end

	
	if eType == 'guid' then
		local number = REWARD_CHEST.LOOT[self:getGuid()][eType]
		print('Message -> Function getLootInfo', 'You can use player:getGuid() instead')
		return number
	end
	if eType == 'uid' then
		local number = REWARD_CHEST.LOOT[self:getGuid()][eType]
		print('Message -> Function getLootInfo', 'You can use player.uid instead')
		return number
	end
	if eType == 'killingDamage' then
		if REWARD_CHEST.LOOT[self:getGuid()]['killingDamage'] then
			return REWARD_CHEST.LOOT[self:getGuid()][eType]
		else
			print('Message -> Function getLootInfo', 'This player with name ['..self:getName()..'] is not killing a boss right now.')
			return false
		end
	end
	if eType == 'healingDamage' then
		if REWARD_CHEST.LOOT[self:getGuid()]['healingDamage'] then
			return REWARD_CHEST.LOOT[self:getGuid()][eType]
		else
			print('Message -> Function getLootInfo', 'This player with name ['..self:getName()..'] is not killing a boss right now.')
			return false
		end
	end
	if eType == 'blockingDamage' then
		if REWARD_CHEST.LOOT[self:getGuid()]['blockingDamage'] then
			return REWARD_CHEST.LOOT[self:getGuid()][eType]
		else
			print('Message -> Function getLootInfo', 'This player with name ['..self:getName()..'] is not killing a boss right now.')
			return false
		end
	end
	
	print('Error -> Function getLootInfo', 'This type is not found.')
	return false
end
function Player.updateDamage(self, dmgType, value)	
	
	REWARD_CHEST.LOOT[self:getGuid()][dmgType:lower()..'Damage'] = REWARD_CHEST.LOOT[self:getGuid()][dmgType:lower()..'Damage'] + value
	--[[if REWARD_CHEST.LOOT[self:getGuid()][dmgType:lower()..'Damage'] > 0 then
		value = value + REWARD_CHEST.LOOT[self:getGuid()][dmgType:lower()..'Damage']
	else
		REWARD_CHEST.LOOT[self:getGuid()][dmgType:lower()..'Damage'] = value
	end]]
				
	return true

end
--[[Gets the loot -> tree with player UID.
]]
function getRootByUid(uid)
	for i = 1, getEveryPlayer() do
		if REWARD_CHEST.LOOT[i] then
			if (REWARD_CHEST.LOOT[i]['uid']  == uid) then
				return REWARD_CHEST.LOOT[i]['guid']
			end
		end
	end
end
function findInRoot(guid, findTableIndex)
	for i = 1, #findTableIndex do
		if findTableIndex[i] then
			if findTableIndex[i]['guid'] == guid then
				return i
			end
		end
	end
	return nil
end

function getEveryPlayer()
	local resultId = db.storeQuery("select id As count from players order by id desc limit 1")
	if resultId then
		local count = result.getDataInt(resultId, "count")
		result.free(resultId)
		return count
	end
	return 0
end

function makePlayersTable(monsterEx) 
	if not REWARD_CHEST.unique[monsterEx.uid] then
		REWARD_CHEST.unique[monsterEx.uid] = {}
	end
	local result = {killers = {}, healers = {}, blockers = {}}
	
	local count = getEveryPlayer()
	for i = 1, count do
		if REWARD_CHEST.LOOT[i] then
			if REWARD_CHEST.LOOT[i]['mUid'] and REWARD_CHEST.LOOT[i]['mUid'] ~= nil then
				if REWARD_CHEST.LOOT[i]['killingDamage'] then
					if REWARD_CHEST.LOOT[i]['killingDamage'] > 0 then
						result.killers[#result.killers+1] = REWARD_CHEST.LOOT[i]['uid']
					end
				end
				if REWARD_CHEST.LOOT[i]['healingDamage'] then
					if REWARD_CHEST.LOOT[i]['healingDamage'] > 0 then
						result.healers[#result.healers+1] = REWARD_CHEST.LOOT[i]['uid']
					end
				end
				if REWARD_CHEST.LOOT[i]['blockingDamage'] then
					if REWARD_CHEST.LOOT[i]['blockingDamage'] > 0 then
						result.blockers[#result.blockers+1] = REWARD_CHEST.LOOT[i]['uid']
					end
				end
			end
		end
	end

	madeTable = result
	local rHp, fHp = monsterEx:getMaxHealth(), (monsterEx:getMaxHealth() * (30/100) ) + monsterEx:getMaxHealth()
	local killerDCount, healerDCount, blockerDCount = 0, 0, 0
	local portalKillerDamage, portalHealerDamage, portalBlockerDamage = fHp * (70 / 100), fHp * (15 / 100), fHp * (15 / 100)
	
	local calcsResult = {killers = {}, healers = {}, blockers = {}, highestKiller = 0}
	if (#madeTable.killers > 0) then
		for s = 1, #madeTable.killers do
			local lootTree = REWARD_CHEST.LOOT[getRootByUid(madeTable.killers[s])]
			local damage = lootTree['killingDamage']	
			if damage > calcsResult.highestKiller then
				calcsResult.highestKiller = damage
				REWARD_CHEST.highestKiller[monsterEx.uid] = lootTree['uid']
				--print(Player(lootTree['uid']):getName(), damage)

			end
		end
		for l = 1, #madeTable.killers do
			local lootTree = REWARD_CHEST.LOOT[getRootByUid(madeTable.killers[l])]
			local damage = lootTree['killingDamage']
			killerDCount = killerDCount+damage
		end
		for i = 1, #madeTable.killers do
			local lootTree = REWARD_CHEST.LOOT[getRootByUid(madeTable.killers[i])]
			local c = (lootTree['killingDamage']/killerDCount)
			local cDamage = portalKillerDamage*c
			
			calcsResult.killers[i] = {}
			calcsResult.killers[i]['guid'] = lootTree['guid']
			calcsResult.killers[i]['dmgPercent'] = cDamage
		end
	else
		print('Error -> Function makePlayersTable', 'There was no killers found.')
	end
	
	if (#madeTable.healers > 0) and (madeTable.healers ~= nil) then
		for l = 1, #madeTable.healers do
			local lootTree = REWARD_CHEST.LOOT[getRootByUid(madeTable.healers[l])]
			local damage = lootTree['healingDamage']
			healerDCount = healerDCount+damage
		end
		for i = 1, #madeTable.healers do
			local lootTree = REWARD_CHEST.LOOT[getRootByUid(madeTable.healers[i])]
			local c = (lootTree['healingDamage']/healerDCount)
			local cDamage = portalHealerDamage*c
			
			calcsResult.healers[i] = {}
			calcsResult.healers[i]['guid'] = lootTree['guid']
			calcsResult.healers[i]['dmgPercent'] = cDamage
		end
	end
	
	if (#madeTable.blockers > 0) and (madeTable.blockers ~= nil) then
		for l = 1, #madeTable.blockers do
			local lootTree = REWARD_CHEST.LOOT[getRootByUid(madeTable.blockers[l])]
			local damage = lootTree['blockingDamage']
			healerDCount = healerDCount+damage
		end
		for i = 1, #madeTable.blockers do
			local lootTree = REWARD_CHEST.LOOT[getRootByUid(madeTable.blockers[i])]
			local c = (lootTree['blockingDamage']/healerDCount)
			local cDamage = portalBlockerDamage*c
			
			calcsResult.blockers[i] = {}
			calcsResult.blockers[i]['guid'] = lootTree['guid']
			calcsResult.blockers[i]['dmgPercent'] = cDamage
		end
	end

	local findTableKillers, findTableHealers, findTableBlockers = calcsResult.killers, calcsResult.healers, calcsResult.blockers
	local FinalTable = {highestKiller = calcsResult.highestKiller, boolBlocker = false, boolHealer = false, index = {} }
	
	if (#findTableKillers > 0) and (findTableKillers ~= nil) then
		
		for i = 1, #findTableKillers do
			local findRoot = findInRoot(findTableKillers[i]['guid'], FinalTable.index)
			if findRoot ~= nil then
				local dmg = FinalTable.index[findRoot]['dmG']
				FinalTable.index[findRoot]['dmG'] = dmg + findTableKillers[i]['dmgPercent']
			else
				local nCount = #FinalTable.index+1
				FinalTable.index[nCount] = {}
				FinalTable.index[nCount]['guid'] = findTableKillers[i]['guid']
				FinalTable.index[nCount]['dmG'] = findTableKillers[i]['dmgPercent']
			end
		end
	end
	
	
	if (#findTableHealers > 0) and (findTableHealers ~= nil) then
		boolHealer = true
		for i = 1, #findTableHealers do
			local findRoot = findInRoot(findTableHealers[i]['guid'], FinalTable.index)
			if findRoot ~= nil then
				local dmg = FinalTable.index[findRoot]['dmG']
				FinalTable.index[findRoot]['dmG'] = dmg + findTableHealers[i]['dmgPercent']
			else
				local nCount = #FinalTable.index+1
				FinalTable.index[nCount] = {}
				FinalTable.index[nCount]['guid'] = findTableHealers[i]['guid']
				FinalTable.index[nCount]['dmG'] = findTableHealers[i]['dmgPercent']
			end
		end
	end
	
	
	if (#findTableBlockers > 0) and (findTableBlockers ~= nil) then
		boolBlocker = true
		for i = 1, #findTableBlockers do
			local findRoot = findInRoot(findTableBlockers[i]['guid'], FinalTable.index)
			if findRoot ~= nil then
				local dmg = FinalTable.index[findRoot]['dmG']
				FinalTable.index[findRoot]['dmG'] = dmg + findTableBlockers[i]['dmgPercent']
			else
				local nCount = #FinalTable.index+1
				FinalTable.index[nCount] = {}
				FinalTable.index[nCount]['guid'] = findTableBlockers[i]['guid']
				FinalTable.index[nCount]['dmG'] = findTableBlockers[i]['dmgPercent']
			end
		end
	end
	
	return FinalTable
end

function doLootPlayers(monster--[[USERDATA_MONSTER]], pos--[[CORPSE_POSITION]], id)
	Game.createItem(id, 1, pos)
	local corpse = Tile(pos):getItemById(id)
	if type(corpse) ~= 'userdata' then
		corpse = Container(corpse)
	end
	corpse:setAttribute('aid', 24343)
    corpse:setAttribute('text', monster.uid)

	
	addEvent(doRemoveCorpse, 1 * 60 * 1000, pos, id)
	local tablePlayers = makePlayersTable(monster)
	local mH = monster:getMaxHealth() 
	local maxHealth = mH
	if tablePlayers.boolBlocker then maxHealth = maxHealth + (mH * (15/100) ) end
	if tablePlayers.boolHealer then maxHealth = maxHealth + (mH * (15/100) ) end
	
	for i = 1, #tablePlayers.index do
		local uid = REWARD_CHEST.LOOT[tablePlayers.index[i]['guid']]['uid']	
		local name = REWARD_CHEST.LOOT[tablePlayers.index[i]['guid']]['name']
		REWARD_CHEST.LOOT[tablePlayers.index[i]['guid']]['mUid'] = monster.uid
		local damage = tablePlayers.index[i]['dmG']
		resetPlayer(getRootByUid(uid))
		if Player(uid) then
			Player(uid):setStorageValue(REWARD_CHEST.storage_can_open, monster.uid)
			local loot
			if REWARD_CHEST.highestKiller[monster.uid] == uid then -- this is not working yet, but don't play it, on update i do so.
				loot = MonsterType(monster:getName()):getBossReward(damage/maxHealth)
			else
				loot = MonsterType(monster:getName()):getBossReward(damage/maxHealth)
			end
			if #loot > 0 then
				local rewardBag = doCreateItemEx(REWARD_CHEST.CONTAINER)
				addContainerItems(Container(rewardBag), loot)
				Player(uid):moveCorpseItemsToRewardChest(false)
				Player(uid):finallazeReward(rewardBag, monster:getName())
				--Player(uid):moveCorpseItemsToRewardChest(true)
				addEvent(moveCorpseItems, 1 * 60 * 1000, uid, true)
			else
				Player(uid):sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You looted nothing.')
			end
		else
			local loot
			if REWARD_CHEST.highestKiller[monster.uid] == uid then
				loot = MonsterType(monster:getName()):getBossReward(damage/maxHealth)
			else
				loot = MonsterType(monster:getName()):getBossReward(damage/maxHealth)
			end
			
			schedulePlayerLoot(name, loot, monster:getName(), monster.uid)
		end	
	end
	return true
end
function doRemoveCorpse(pos, id)
	local tile = Tile(pos)
	tile:getItemById(id):remove()
end
function schedulePlayerLoot(name, loot, monsterName, monsterUid)
	name = name:lower()
	if not REWARD_CHEST.RESERVED_LOOT[name] then
		REWARD_CHEST.RESERVED_LOOT[name] = {}
	end
	
	REWARD_CHEST.RESERVED_LOOT[name]['loot'] = loot
	REWARD_CHEST.RESERVED_LOOT[name]['mName'] = monsterName
	REWARD_CHEST.RESERVED_LOOT[name]['mUid'] = monsterUid
	print('schedule -> Looter', 'Someone left his loot, it\'s saved once he is back.')
end

function resetPlayer(guid)
	REWARD_CHEST.LOOT[guid]['killingDamage'] = 0
	REWARD_CHEST.LOOT[guid]['healingDamage'] = 0
	REWARD_CHEST.LOOT[guid]['blockingDamage'] = 0
	REWARD_CHEST.LOOT[guid]['mUid'] = 0
	
end
function Player.sendOfflineLoot(self)
	local name = self:getName():lower()
	if REWARD_CHEST.RESERVED_LOOT[name] then
		if REWARD_CHEST.RESERVED_LOOT[name]['loot'] then
			
			local monsterName = REWARD_CHEST.RESERVED_LOOT[name]['mName']
			local loot = REWARD_CHEST.RESERVED_LOOT[name]['loot']
			local mUid = REWARD_CHEST.RESERVED_LOOT[name]['mUid']
			self:setStorageValue(REWARD_CHEST.storage_can_open, mUid)
			if #loot > 0 then
				local rewardBag = doCreateItemEx(REWARD_CHEST.CONTAINER)
				addContainerItems(Container(rewardBag), loot)
				self:finallazeReward(rewardBag, monsterName)
				self:moveCorpseItemsToRewardChest(true)
				return true
			else
				self:moveCorpseItemsToRewardChest(false)
				self:sendTextMessage(MESSAGE_INFO_DESCR, 'You were killing a boss before, but you looted nothing.')
				return true
			end
		end
	end
	return false
end
--REWARD CHEST FUNCTIONS
function moveCorpseItems(uid, enabled)
	if Player(uid) then
		Player(uid):moveCorpseItemsToRewardChest(enabled)
	end
end
function Player.finallazeReward(self, rewardBag, name)
	local str
	if name then
		str = '[Reward Chest] You looted from '..name..': '	
	else
		print('Warning -> Function finallazeReward', 'Monster name is a nil value.')
		str = '[Reward Chest] You looted : '
	end
	local result = getContainerItems(Container(rewardBag))
	if result.count ~= tonumber(0) then
		for i = 0, result.count do
			if result.items[i] then
				local ItemInside = result.items[i]
				local id = ItemInside:getId()
				local count = ItemInside:getCount()
				
				
				
				
				if REWARD_CHEST.BankMoney and (id == 2152 or id == 2148) then
					if id == 2152 then
						self:setBankBalance(self:getBankBalance() + (count*100))
					elseif id == 2148 then
						self:setBankBalance(self:getBankBalance() + (count))
					end
				else
					self:addToRewardCorpse(id, count)
				end				
				
				
				if result.count - i == 1 then
					if count == 1 then									
						str = str..ItemInside:getName()..''
					else
						str = str..count..' '..ItemInside:getName()..''
					end								
				else
					if count == 1 then									
						str = str..ItemInside:getName()..', '
					else
						str = str..count..' '..ItemInside:getName()..', '
					end
				end
			end
		end
	end		
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, str .. '.')
	local pStr = ''
	if REWARD_CHEST.BankMoney then
		pStr = pStr..'Money auto banked.'
	end
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, pStr)
	return true
end

function getDecayTime(id, name)
	local decayTime = 0
	do
		local o = io.open('data/items/items.xml','r')
		file = o:read('*a')
		o:close()
	end
	local function sumDecayTime(corpse)
		for attr in file:gmatch('<item.-id="' .. corpse ..'"(.-)</item>') do
			local decayTo = attr:match('<attribute.-key="decayTo".-value="(.-)".-/>')
			local duration = attr:match('<attribute.-key="duration".-value="(.-)".-/>')
			decayTime = decayTime + duration
			return decayTime
		end
	end
	sumDecayTime(id)
	return decayTime
end




function Player.moveCorpseItemsToRewardChest(self, state) -- Not used -// Bugged Sources. Will be released once fixed.
	if self:getRewardCorpse():getSize() == 0 then
		return false
	end
	if type(self) ~= 'userdata' then
		self = Player(self)
	end
	if not(self) then
		return false
	end
	local container = self:getRewardCorpse()
	local items = getContainerItems(container)
	for i = 0, items.count do	
		i = (items.count-1)-i
		local item = container:getItem(i)
		if item then
			self:addToRewardChest(item:getId(), item:getCount())
			container:getItem(i):remove()
		end
	end
	if state then
		self:sendTextMessage(MESSAGE_INFO_DESCR, 'Your reward was moved to your reward chest.')
	end
	return true
end
-- MONSTERTYPE FUNCTIONS
function MonsterType.createLootItem(self, lootBlock, chance)
	local lootTable, itemCount = {}, 0
	local randvalue = math.random(0, 100000) / (getConfigInfo("rateLoot") * chance)
	if randvalue < lootBlock.chance then
		if (ItemType(lootBlock.itemId):isStackable()) then
			itemCount = randvalue % lootBlock.maxCount + 1
		else
			itemCount = 1
		end
	end

	while itemCount > 0 do
		local n = math.min(itemCount, 100)
		itemCount = itemCount - n
		table.insert(lootTable, {lootBlock.itemId, n})
	end

	return lootTable
end

function MonsterType.getBossReward(self, chance)
	local result = {}
	if getConfigInfo("rateLoot") > 0 then
		for _, loot in pairs(self:getLoot()) do
			local itemList = self:createLootItem(loot, chance)
			if itemList then
				for _, item in ipairs(itemList) do
					table.insert(result, item)
				end
			end
		end
	end
	return result
end
-- CONTAINER FUNCTIONS
function getContainerItems(container) -- Returns array of items of a container.
	local result = {count = 0, items = {}}
	local indexes = container:getSize()
	result.count = indexes
	if indexes == 0 then
		return result
	end	
	for i=0, indexes do
		result.items[i] = container:getItem(i)
	end
	return result
end
function addContainerItems(container, items) -- Add some items to the container.
    for k, v in pairs(items) do
        if ItemType(k):isContainer() then
            local newBag = Container(doCreateItemEx(k, 1))
            addContainerItems(newBag, v)
            container:addItemEx(newBag)
        else
            container:addItem(v[1], v[2])
        end
    end
end
