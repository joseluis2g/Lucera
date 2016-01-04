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
	'fire_event'
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

	-- Premium System
	if player:getPremiumDays() > 0 and player:getStorageValue(Storage.Promotion) <= 0 then
		player:setStorageValue(Storage.Promotion, 1)
	end

	if not player:isPremium() and player:getStorageValue(Storage.Promotion) >= 1 then
		local town = Town(2)
		player:setStorageValue(Storage.Promotion, 0)
		player:setOutfit(
			{
				lookBody = 113,
				lookAddons = 0,
				lookType = player:getSex() == 0 and 137 or 129,
				lookTypeEx = 0,
				lookHead = 95,
				lookMount = 0,
				lookLegs = 39,
				lookFeet = 115,
			}
		)
		player:setTown(town)
		player:teleportTo(town:getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sua Premium Account acabou!")
	end

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
