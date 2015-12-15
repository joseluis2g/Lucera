-- ordered as in creaturescripts.xml
local events = {
	'TutorialCockroach',
	'ElementalSpheresOverlords',
	'BigfootBurdenVersperoth',
	'BigfootBurdenWarzone',
	'BigfootBurdenWeeper',
	'BigfootBurdenWiggler',
	'SvargrondArenaKill',
	'NewFrontierShardOfCorruption',
	'NewFrontierTirecz',
	'ServiceOfYalaharDiseasedTrio',
	'ServiceOfYalaharAzerus',
	'ServiceOfYalaharQuaraLeaders',
	'InquisitionBosses',
	'InquisitionUngreez',
	'KillingInTheNameOfKills',
	'MastersVoiceServants',
	'SecretServiceBlackKnight',
	'ThievesGuildNomad',
	'WotELizardMagistratus',
	'WotELizardNoble',
	'WotEKeeper',
	'WotEBosses',
	'WotEZalamon',
	'PlayerDeath',
	'AdvanceSave',
	'AdvanceRookgaard',
	'PythiusTheRotten',
	'DropLoot',
	'fire_event',
	'healthchange',
	'RewardChest'
}

local function onMovementRemoveProtection(cid, oldPosition, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPosition = player:getPosition()
	if (playerPosition.x ~= oldPosition.x or playerPosition.y ~= oldPosition.y or playerPosition.z ~= oldPosition.z) or player:getTarget() then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPosition, time - 1)
end

function onLogin(player)
	local loginStr = 'Welcome to ' .. configManager.getString(configKeys.SERVER_NAME) .. '!'
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. ' Please choose your outfit.'
		player:sendTutorial(1)
	else
		if loginStr ~= '' then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format('Your last visit was on %s.', os.date('%a %b %d %X %Y', player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	local playerId = player:getId()

	-- Stamina
	nextUseStaminaTime[playerId] = 0

	if player:getAccountType() >= ACCOUNT_TYPE_TUTOR and player:getPremiumDays() < 15 then
		player:addPremiumDays(15)
	end

	-- Reward Chest
	if not REWARD_CHEST.LOOT[player:getGuid()] then
		REWARD_CHEST.LOOT[player:getGuid()] = {}
	end

	REWARD_CHEST.LOOT[player:getGuid()]['guid'] = player:getGuid()
	REWARD_CHEST.LOOT[player:getGuid()]['uid'] = player.uid
	REWARD_CHEST.LOOT[player:getGuid()]['name'] = player:getName()

	if REWARD_CHEST.LOOT[player:getGuid()]['uid'] ~= player.uid then
		REWARD_CHEST.LOOT[player:getGuid()]['uid'] = player.uid
	end

	if REWARD_CHEST.LOOT[player:getGuid()]['name'] ~= player:getName() then
		REWARD_CHEST.LOOT[player:getGuid()]['name'] = player:getName()
	end

	if REWARD_CHEST.LOOT[player:getGuid()]['guid'] ~= player:getGuid() then
		REWARD_CHEST.LOOT[player:getGuid()]['guid'] = player:getGuid()
	end

	REWARD_CHEST.LOOT[player:getGuid()]['killingDamage'] = 0
	REWARD_CHEST.LOOT[player:getGuid()]['healingDamage'] = 0
	REWARD_CHEST.LOOT[player:getGuid()]['blockingDamage'] = 0

	player:sendOfflineLoot()

	--[[Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	local value = player:getStorageValue(Storage.Promotion)
	if player:isPremium() then
		local value = player:getStorageValue(Storage.Promotion)
		if not promotion and value ~= 1 then
			player:setStorageValue(Storage.Promotion, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end]]

	-- Events
	for i = 1, #events do
		player:registerEvent(events[i])
	end

	if player:getStorageValue(Storage.combatProtectionStorage) <= os.time() then
		player:setStorageValue(Storage.combatProtectionStorage, os.time() + 10)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end
	return true
end
