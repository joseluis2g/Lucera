local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local newaddon	= 'Here you are, enjoy your brand new addon!'
local noitems		= 'You do not have all the required items.'
local firstAddon	= 'You not have the first addon, which by the way, is a requirement for this addon.'
local already 		= 'It seems you already have this addon, don\'t you try to mock me son!'
local premiumToAddons = false
local needPremium = 'You need premium accout.'

-- [[ CITIZEN ]] --
function firstCitizenAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
	if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
	if not player:hasOutfit(128, 1) and not player:hasOutfit(136, 1) then
		if player:removeItem(5878, 100) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(128, 1)
            player:addOutfitAddon(136, 1)
			if player:hasOutfit(128, 3) and player:hasOutfit(136, 3) then
				player:addAchievement('Exemplary Citizen')
			end
		else
			selfSay(noitems, cid)
		end
	else
		selfSay(already, cid)
	end
end

function secondCitizenAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
	if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(128, 2) and not player:hasOutfit(136, 2) then
        if player:removeItem(5890, 100) and player:removeItem(5902, 50) and player:removeItem(2480, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(128, 2)
            player:addOutfitAddon(136, 2)
			if player:hasOutfit(128, 3) and player:hasOutfit(136, 3) then
				player:addAchievement('Exemplary Citizen')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ CITIZEN ]] --

-- [[ HUNTER ]] --
function firstHunterAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
	if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(129, 1) and not player:hasOutfit(137, 1) then
        if player:removeItem(5947, 1) and player:removeItem(5876, 100) and player:removeItem(5948, 100) and player:removeItem(5891, 5) and player:removeItem(5887, 1) and player:removeItem(5888, 1) and player:removeItem(5889, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(129, 1)
			player:addOutfitAddon(137, 1)
			if player:hasOutfit(129, 3) and player:hasOutfit(137, 3) then
				player:addAchievement('Hunting with Style')
			end
        else
            selfSay(noitems, cid)
        end
    else
		selfSay(already, cid)
    end
end

function secondHunterAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
	if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(129, 2) and not player:hasOutfit(137, 2) then
        if player:removeItem(5875, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(129, 2)
			player:addOutfitAddon(137, 2)
			if player:hasOutfit(129, 3) and player:hasOutfit(137, 3) then
				player:addAchievement('Hunting with Style')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end 
-- [[ HUNTER ]] --

-- [[ MAGE ]] --
function firstMageAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
	if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
	if player:getSex() == 0 then
		if not player:hasOutfit(138, 1) and not player:hasOutfit(133, 1) then
			if player:removeItem(5958, 1) then
				selfSay(newaddon, cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:addOutfitAddon(138, 1)
				player:addOutfitAddon(133, 1)
				if player:hasOutfit(138, 3) and player:hasOutfit(133, 3) then
					player:addAchievement('Ritualist')
				end
			else
				selfSay(noitems, cid)
			end
		else
			selfSay(already, cid)
		end
	else
		if not player:hasOutfit(130, 1) and not player:hasOutfit(141, 1) then
			if player:removeItem(2181, 1) and player:removeItem(2182, 1) and player:removeItem(2183, 1) and player:removeItem(2185, 1) and player:removeItem(2186, 1) and player:removeItem(2187, 1) and player:removeItem(2188, 1) and player:removeItem(2189, 1) and player:removeItem(2190, 1) and player:removeItem(2191, 1) and player:removeItem(5904, 10) and player:removeItem(2193, 20) and player:removeItem(5809, 1) then
				selfSay(newaddon, cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:addOutfitAddon(130, 1)
				player:addOutfitAddon(141, 1)
				if player:hasOutfit(130, 3) and player:hasOutfit(141, 3) then
					player:addAchievement('Alumni')
				end
			else
				selfSay(noitems, cid)
			end
		else
			selfSay(already, cid)
		end
	end
end

function secondMageAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
	if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
	if player:getSex() == 0 then
        if not player:hasOutfit(138, 2) and not player:hasOutfit(133, 2) then
			if player:removeItem(5894, 70) and player:removeItem(5911, 20) and player:removeItem(5883, 40) and player:removeItem(5922, 35) and player:removeItem(5886, 10) and player:removeItem(5881, 60) and player:removeItem(5882, 40) and player:removeItem(5904, 15) and player:removeItem(5905, 30) then
				selfSay(newaddon, cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:addOutfitAddon(138, 2)
				player:addOutfitAddon(133, 2)
				if player:hasOutfit(138, 3) and player:hasOutfit(133, 3) then
					player:addAchievement('Ritualist')
				end
			else
				selfSay(noitems, cid)
			end
		else
			selfSay(already, cid)
		end
	else
        if not player:hasOutfit(130, 2) and not player:hasOutfit(141, 2) then
			if player:removeItem(5903, 1) then
				selfSay(newaddon, cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:addOutfitAddon(130, 2)
				player:addOutfitAddon(141, 2)
				if player:hasOutfit(130, 3) and player:hasOutfit(141, 3) then
					player:addAchievement('Alumni')
				end
			else
				selfSay(noitems, cid)
			end
		else
			selfSay(already, cid)
		end
    end
end
-- [[ MAGE ]] --

-- [[ KNIGHT ]] --
function firstKnightAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(131, 1) and not player:hasOutfit(139, 1) then
        if player:removeItem(5892, 1) and player:removeItem(5880, 100) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(131, 1)
            player:addOutfitAddon(139, 1)
			if player:hasOutfit(131, 3) and player:hasOutfit(139, 3) then
				player:addAchievement('In Shining Armor')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondKnightAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid) 
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(131, 2) and not player:hasOutfit(139, 2) then
        if player:removeItem(5893, 100) and player:removeItem(5924, 1) and player:removeItem(5885, 1) and player:removeItem(5887, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(131, 2)
            player:addOutfitAddon(139, 2)
			if player:hasOutfit(131, 3) and player:hasOutfit(139, 3) then
				player:addAchievement('In Shining Armor')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ KNIGHT ]] --

-- [[ NOBLEMAN ]] --
function firstNoblemanAddon(cid, message, keywords, parameters, node) 
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(132, 1) and not player:hasOutfit(140, 1) then
        if player:removeMoney(150000) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(132, 1)
            player:addOutfitAddon(140, 1)
			if player:hasOutfit(132, 3) and player:hasOutfit(140, 3) then
				player:addAchievement('Aristocrat')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondNoblemanAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(132, 2) and not player:hasOutfit(140, 2) then
        if player:removeMoney(150000) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(132, 2)
            player:addOutfitAddon(140, 2)
			if player:hasOutfit(132, 3) and player:hasOutfit(140, 3) then
				player:addAchievement('Aristocrat')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ NOBLEMAN ]] --

-- [[ SUMMONER ]] --
function firstSummonerAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if player:getSex() == 1 then
        if not player:hasOutfit(138, 1) and not player:hasOutfit(133, 1) then
			if player:removeItem(5958, 1) then
				selfSay(newaddon, cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:addOutfitAddon(138, 1)
				player:addOutfitAddon(133, 1)
				if player:hasOutfit(138, 3) and player:hasOutfit(133, 3) then
					player:addAchievement('Ritualist')
				end
			else
				selfSay(noitems, cid)
			end
		else
			selfSay(already, cid)
		end
	else 
        if not player:hasOutfit(130, 1) and not player:hasOutfit(141, 1) then
			if player:removeItem(2181, 1) and player:removeItem(2182, 1) and player:removeItem(2183, 1) and player:removeItem(2185, 1) and player:removeItem(2186, 1) and player:removeItem(2187, 1) and player:removeItem(2188, 1) and player:removeItem(2189, 1) and player:removeItem(2190, 1) and player:removeItem(2191, 1) and player:removeItem(5904, 10) and player:removeItem(2193, 20) and player:removeItem(5809, 1) then
				selfSay(newaddon, cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:addOutfitAddon(130, 1)
				player:addOutfitAddon(141, 1)
				if player:hasOutfit(130, 3) and player:hasOutfit(141, 3) then
					player:addAchievement('Alumni')
				end
			else
				selfSay(noitems, cid)
			end
		else
			selfSay(already, cid)
		end
    end
end

function secondSummonerAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if player:getSex() == 1 then
        if not player:hasOutfit(138, 2) and not player:hasOutfit(133, 2) then
			if player:removeItem(5894, 70) and player:removeItem(5911, 20) and player:removeItem(5883, 40) and player:removeItem(5922, 35) and player:removeItem(5886, 10) and player:removeItem(5881, 60) and player:removeItem(5882, 40) and player:removeItem(5904, 15) and player:removeItem(5905, 30) then
				selfSay(newaddon, cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:addOutfitAddon(138, 2)
				player:addOutfitAddon(133, 2)
				if player:hasOutfit(138, 3) and player:hasOutfit(133, 3) then
					player:addAchievement('Ritualist')
				end
			else
				selfSay(noitems, cid)
			end
		else
			selfSay(already, cid)
		end
	else
        if not player:hasOutfit(130, 2) and not player:hasOutfit(141, 2) then
			if player:removeItem(5903, 1) then
				selfSay(newaddon, cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:addOutfitAddon(130, 2)
				player:addOutfitAddon(141, 2)
				if player:hasOutfit(130, 3) and player:hasOutfit(141, 3) then
					player:addAchievement('Alumni')
				end
			else
				selfSay(noitems, cid)
			end
		else
			selfSay(already, cid)
		end
    end
end
-- [[ SUMMONER ]] --

-- [[ WARRIOR ]] --
function firstWarriorAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(134, 1) and not player:hasOutfit(142, 1) then
        if player:removeItem(5925, 100) and player:removeItem(5899, 100) and player:removeItem(5884, 1) and player:removeItem(5919, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(134, 1)
            player:addOutfitAddon(142, 1)
			if player:hasOutfit(134, 3) and player:hasOutfit(142, 3) then
				player:addAchievement('Wild Warrior')
			end
        else
            selfSay(noitems, cid)
        end
	else
		selfSay(already, cid)
    end
end

function secondWarriorAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(134, 2) and not player:hasOutfit(142, 2) then
        if player:removeItem(5887, 1) and player:removeItem(5880, 100) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(134, 2)
            player:addOutfitAddon(142, 2)
			if player:hasOutfit(134, 3) and player:hasOutfit(142, 3) then
				player:addAchievement('Wild Warrior')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ WARRIOR ]] --

-- [[ BARBARIAN ]] --
function firstBarbarianAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(143, 1) and not player:hasOutfit(147, 1) then
        if player:removeItem(5880, 100) and player:removeItem(5892, 1) and player:removeItem(5893, 50) and player:removeItem(5876, 50) then
			selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(143, 1)
            player:addOutfitAddon(147, 1)
			if player:hasOutfit(143, 3) and player:hasOutfit(147, 3) then
				player:addAchievement('Brutal Politeness')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondBarbarianAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(143, 2) and not player:hasOutfit(147, 2) then
        if player:removeItem(5884, 1) and player:removeItem(5885, 1) and player:removeItem(5911, 50) and player:removeItem(5910, 50) and player:removeItem(5886, 10) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(143, 2)
            player:addOutfitAddon(147, 2)
			if player:hasOutfit(143, 3) and player:hasOutfit(147, 3) then
				player:addAchievement('Brutal Politeness')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ BARBARIAN ]] --

-- [[ DRUID ]] --
function firstDruidAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(144, 1) and not player:hasOutfit(148, 1) then
        if player:removeItem(5897, 50) and player:removeItem(5896, 50) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(144, 1)
            player:addOutfitAddon(148, 1)
			if player:hasOutfit(144, 3) and player:hasOutfit(148, 3) then
				player:addAchievement('Of Wolves and Bears')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondDruidAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(144, 2) and not player:hasOutfit(148, 2) then
        if player:removeItem(5937, 1) and player:removeItem(5938, 1) and player:removeItem(5906, 100) and player:removeItem(5942, 1) and player:removeItem(5940, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(144, 2)
            player:addOutfitAddon(148, 2)
			if player:hasOutfit(144, 3) and player:hasOutfit(148, 3) then
				player:addAchievement('Of Wolves and Bears')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ DRUID ]] --

-- [[ WIZARD ]] --
function firstWizardAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(145, 1) and not player:hasOutfit(149, 1) then
        if player:removeItem(2488, 1) and player:removeItem(2123, 1) and player:removeItem(2492, 1) and player:removeItem(2536, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(145, 1)
            player:addOutfitAddon(149, 1)
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondWizardAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(145, 2) and not player:hasOutfit(149, 2) then
		if not player:hasOutfit(145, 1) and not player:hasOutfit(149, 1) then
			selfSay(firstAddon, cid)
			return false
		end

        if player:removeItem(5922, 50) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(145, 2)
            player:addOutfitAddon(149, 2)
			player:addAchievement('Warlock')
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ WIZARD ]] --

-- [[ ORIENTAL ]] --
function firstOrientalAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(146, 1) and not player:hasOutfit(150, 1) then
        if player:removeItem(5945,1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(146, 1)
            player:addOutfitAddon(150, 1)
			if player:hasOutfit(146, 3) and player:hasOutfit(150, 3) then
				player:addAchievement('One Thousand and One')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondOrientalAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(146, 2) and not player:hasOutfit(150, 2) then
        if player:removeItem(5883, 100) and player:removeItem(5895, 100) and player:removeItem(5891, 2) and player:removeItem(5912, 100) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(146, 2)
            player:addOutfitAddon(150, 2)
			if player:hasOutfit(146, 3) and player:hasOutfit(150, 3) then
				player:addAchievement('One Thousand and One')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ ORIENTAL ]] --

-- [[ PIRATE ]] --
function firstPirateAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(151, 1) and not player:hasOutfit(155, 1) then
        if player:removeItem(6126, 100) and player:removeItem(6097, 100) and player:removeItem(6098, 100) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(151, 1)
            player:addOutfitAddon(155, 1)
			if player:hasOutfit(151, 3) and player:hasOutfit(155, 3) then
				player:addAchievement('Swashbuckler')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondPirateAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(151, 2) and not player:hasOutfit(155, 2) then
        if player:removeItem(6099, 1) and player:removeItem(6100, 1) and player:removeItem(6101, 1) and player:removeItem(6102, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(151, 2)
            player:addOutfitAddon(155, 2)
			if player:hasOutfit(151, 3) and player:hasOutfit(155, 3) then
				player:addAchievement('Swashbuckler')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ PIRATE ]] --

-- [[ ASSASSIN ]] --
function firstAssassinAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(152, 1) and not player:hasOutfit(156, 1) then
        if player:removeItem(5912, 50) and player:removeItem(5910, 50) and player:removeItem(5911, 50) and player:removeItem(5913, 50) and player:removeItem(5914, 50) and player:removeItem(5909, 50) and player:removeItem(5886, 10) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(152, 1)
            player:addOutfitAddon(156, 1)
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondAssassinAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(152, 2) and not player:hasOutfit(156, 2) then
		if not player:hasOutfit(152, 1) and not player:hasOutfit(156, 1) then
			selfSay(firstAddon, cid)
			return false
		end

        if player:removeItem(5804, 1) and player:removeItem(5930, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(152, 2)
            player:addOutfitAddon(156, 2)
			player:addAchievement('Swift Death')
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ ASSASSIN ]] --

-- [[ BEGGAR ]] --
function firstBeggarAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(153, 1) and not player:hasOutfit(157, 1) then
        if player:removeItem(5883, 100) and player:removeMoney(20000) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(153, 1)
            player:addOutfitAddon(157, 1)
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondBeggarAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(153, 2) and not player:hasOutfit(157, 2) then
		if not player:hasOutfit(153, 1) and not player:hasOutfit(157, 1) then
			selfSay(firstAddon, cid)
			return false
		end

        if player:removeItem(6107, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(153, 2)
            player:addOutfitAddon(157, 2)
			player:addAchievement('Life on the Streets')
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ BEGGAR ]] --

-- [[ SHAMAN ]] --
function firstShamanAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(154, 1) and not player:hasOutfit(158, 1) then
        if player:removeItem(3955, 5) and player:removeItem(5015, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(154, 1)
            player:addOutfitAddon(158, 1)
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondShamanAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(154, 2) and not player:hasOutfit(158, 2) then
		if not player:hasOutfit(154, 1) and not player:hasOutfit(158, 1) then
			selfSay(firstAddon, cid)
			return false
		end

        if player:removeItem(3966, 5) and player:removeItem(3967, 5) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(154, 2)
            player:addOutfitAddon(158, 2)
			player:addAchievement('Way of the Shaman')
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ SHAMAN ]] --

-- [[ NORSEMAN ]] --
function firstNorsemanAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(251, 1) and not player:hasOutfit(252, 1) then
        if player:removeItem(7290, 5) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(251, 1)
            player:addOutfitAddon(252, 1)
			if player:hasOutfit(251, 3) and player:hasOutfit(252, 3) then
				player:addAchievement('Out in the Snowstorm')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondNorsemanAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(251, 2) and not player:hasOutfit(252, 2) then
        if player:removeItem(7290, 10) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(251, 2)
            player:addOutfitAddon(252, 2)
			if player:hasOutfit(251, 3) and player:hasOutfit(252, 3) then
				player:addAchievement('Out in the Snowstorm')
			end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ NORSEMAN ]] --

-- [[ NIGHTMARE ]] --
function firstNightmareAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(268, 1) and not player:hasOutfit(269, 1) then
        if player:removeItem(6500, 500) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(268, 1)
            player:addOutfitAddon(269, 1)
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondNightmareAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(268, 2) and not player:hasOutfit(269, 2) then
		if not player:hasOutfit(268, 1) and not player:hasOutfit(269, 1) then
			selfSay(firstAddon, cid)
			return false
		end

        if player:removeItem(6500, 1000) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(268, 2)
            player:addOutfitAddon(269, 2)
			player:addItem(6391, 1)
			player:addAchievement('Nightmare Walker')
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ NIGHTMARE ]] --

-- [[ BROTHERHOOD ]] --
function firstBrotherhoodAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(278, 1) and not player:hasOutfit(279, 1) then
        if player:removeItem(6500, 500) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(278, 1)
            player:addOutfitAddon(279, 1)
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondBrotherhoodAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(278, 2) and not player:hasOutfit(279, 2) then
		if not player:hasOutfit(278, 1) and not player:hasOutfit(279, 1) then
			selfSay(firstAddon, cid)
			return false
		end

        if player:removeItem(6500, 1000) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(278, 2)
            player:addOutfitAddon(279, 2)
			player:addItem(6433, 1)
			player:addAchievement('Skull and Bones')
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ BROTHERHOOD ]] --

-- [[ YALAHARIAN ]] --
function firstYalaharianAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(325, 1) and not player:hasOutfit(324, 1) then
		if player:hasOutfit(325, 2) and player:hasOutfit(324, 2) then
			selfSay(already, cid)
			return false
		end

        if player:removeItem(9955, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(325, 1)
            player:addOutfitAddon(324, 1)
			player:addAchievement('Yalahari of Power')
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end

function secondYalaharianAddon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if premiumToAddons and not player:isPremium() then selfSay(needPremium, cid) return false end
    if not player:hasOutfit(325, 2) and not player:hasOutfit(324, 2) then
		if player:hasOutfit(325, 1) and player:hasOutfit(324, 1) then
			selfSay(already, cid)
			return false
		end

        if player:removeItem(9955, 1) then
            selfSay(newaddon, cid)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:addOutfitAddon(325, 2)
            player:addOutfitAddon(324, 2)
			player:addAchievement('Yalahari of Wisdom')
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
end
-- [[ YALAHARIAN ]] --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the following outfits: Citizen, Hunter, Mage, Knight, Nobleman, Summoner, Warrior, Barbarian, Druid, Wizard, Oriental, Pirate, Assassin, Beggar, Shaman, Norseman, Nightmare, Brotherhood & Yalaharian. Do you need {help}?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first hunter addon' or 'second hunter addon' where you replace 'hunter' with whatever outfit you'd like to achieve the addons for. Assuming that you already collected all the required pieces, say 'yes' and done - you got yourself an addon!"})

nodecitizen1 = keywordHandler:addKeyword({'first citizen addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first citizen addon you need to give me 100 minotaur leathers. Do you have them with you?'})
nodecitizen1:addChildKeyword({'yes'}, firstCitizenAddon, {})
nodecitizen1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodecitizen2 = keywordHandler:addKeyword({'second citizen addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first hunter addon you need to give me 100 chicken feathers, 50 honeycombs and a legion helmet. Do you have them with you?'})
nodecitizen2:addChildKeyword({'yes'}, secondCitizenAddon, {})
nodecitizen2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodehunter1 = keywordHandler:addKeyword({'first hunter addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first hunter addon you need to give me  Elane Crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, a piece of royal steel, a piece of hell steel and a piece of draconian steel. Do you have them with you?'})
nodehunter1:addChildKeyword({'yes'}, firstHunterAddon, {})
nodehunter1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodehunter2 = keywordHandler:addKeyword({'second hunter addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second hunter addon you need to give me a pair of sniper gloves. Do you have them with you?'})
nodehunter2:addChildKeyword({'yes'}, secondHunterAddon, {})
nodehunter2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodemage1 = keywordHandler:addKeyword({'first mage addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first mage addon you need to give me a winning lottery ticket if you are a female. Otherwise, you need to give me all kind of wands and rods, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'})
nodemage1:addChildKeyword({'yes'}, firstMageAddon, {})
nodemage1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodemage2 = keywordHandler:addKeyword({'second mage addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second mage addon you need to give me 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts if you are a female. Otherwise, you need to give me a ferumbras\' hat. Do you have them with you?'})
nodemage2:addChildKeyword({'yes'}, secondMageAddon, {})
nodemage2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeknight1 = keywordHandler:addKeyword({'first knight addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first knight addon you need to give me a chunk of crude iron and 100 iron ores. Do you have it with you?'})
nodeknight1:addChildKeyword({'yes'}, firstKnightAddon, {})
nodeknight1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeknight2 = keywordHandler:addKeyword({'second knight addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second knight addon you need to give me 100 perfect behemoth fangs, a damaged steel helmet, warrior\'s sweat and a royal steel. Do you have them with you?'})
nodeknight2:addChildKeyword({'yes'}, secondKnightAddon, {})
nodeknight2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodenobleman1 = keywordHandler:addKeyword({'first nobleman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first nobleman addon you need to give me 150,000 gold pieces. Do you have it with you?'})
nodenobleman1:addChildKeyword({'yes'}, firstNoblemanAddon, {})
nodenobleman1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodenobleman2 = keywordHandler:addKeyword({'second nobleman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second nobleman addon you need to give me 150,000 gold pieces. Do you have them with you?'})
nodenobleman2:addChildKeyword({'yes'}, secondNoblemanAddon, {})
nodenobleman2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodesummoner1 = keywordHandler:addKeyword({'first summoner addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first summoner addon you need to give me a winning lottery ticket if you are a male. Otherwise, you need to give me all kind of wands and rods, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'})
nodesummoner1:addChildKeyword({'yes'}, firstSummonerAddon, {})
nodesummoner1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodesummoner2 = keywordHandler:addKeyword({'second summoner addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second summoner addon you need to give me 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts if you are a male. Otherwise, you need to give me a ferumbras\' hat. Do you have them with you?'})
nodesummoner2:addChildKeyword({'yes'}, secondSummonerAddon, {})
nodesummoner2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodewarrior1 = keywordHandler:addKeyword({'first warrior addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first warrior addon you need to give me 100 hardened bones, 100 turtle shells, a fighting spirit and a dragon claw. Do you have it with you?'})
nodewarrior1:addChildKeyword({'yes'}, firstWarriorAddon, {})
nodewarrior1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodewarrior1 = keywordHandler:addKeyword({'second warrior addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second warrior addon you need to give me 100 iron ores and a piece of royal steel. Do you have them with you?'})
nodewarrior1:addChildKeyword({'yes'}, secondWarriorAddon, {})
nodewarrior1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodebarbarian1 = keywordHandler:addKeyword({'first barbarian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first barbarian addon you need to give me 100 iron ore, a chunk of crude iron, 50 behemoth fangs and 50 lizard leathers. Do you have them with you?'})
nodebarbarian1:addChildKeyword({'yes'}, firstBarbarianAddon, {})
nodebarbarian1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodebarbarian2 = keywordHandler:addKeyword({'second barbarian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second barbarian addon you need to give me a fighting spirit, the warrior\'s sweat, 50 red pieces of cloth, 50 green pieces of cloth and 10 spider silk yarns. Do you have them with you?'})
nodebarbarian2:addChildKeyword({'yes'}, secondBarbarianAddon, {}) 
nodebarbarian2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodedruid1 = keywordHandler:addKeyword({'first druid addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first druid addon you need to give me 50 wolf paws and 50 bear paws. Do you have them with you?'})
nodedruid1:addChildKeyword({'yes'}, firstDruidAddon, {})
nodedruid1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodedruid2 = keywordHandler:addKeyword({'second druid addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second druid addon you need to give me Botanist Container, waterhose, 100 demon dusts, a blessed wooden stake and Ceirons wolf tooth chain. Do you have them with you?'})
nodedruid2:addChildKeyword({'yes'}, secondDruidAddon, {})
nodedruid2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodewizard1 = keywordHandler:addKeyword({'first wizard addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first wizard addon you need to give me a dragon scale mail, a pair of crown legs, a medusa shield and a ring of the sky. Do you have them with you?'})
nodewizard1:addChildKeyword({'yes'}, firstWizardAddon, {})
nodewizard1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodewizard2 = keywordHandler:addKeyword({'second wizard addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second wizard addon you need to give me 50 holy orchids. Do you have them with you?'})
nodewizard2:addChildKeyword({'yes'}, secondWizardAddon, {})
nodewizard2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeoriental1 = keywordHandler:addKeyword({'first oriental addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first oriental addon you need to give me a mermaid comb. Do you have it with you?'})
nodeoriental1:addChildKeyword({'yes'}, firstOrientalAddon, {})
nodeoriental1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeoriental2 = keywordHandler:addKeyword({'second oriental addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second oriental addon you need to give me 100 ape furs, 100 fish fins, 2 enchanted chicken wings and 100 blue pieces of cloth. Do you have them with you?'})
nodeoriental2:addChildKeyword({'yes'}, secondOrientalAddon, {})
nodeoriental2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodepirate1 = keywordHandler:addKeyword({'first pirate addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first pirate addon you need to give me 100 hooks, 100 peg legs and 100 eye patches. Do you have them with you?'})
nodepirate1:addChildKeyword({'yes'}, firstPirateAddon, {})
nodepirate1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodepirate2 = keywordHandler:addKeyword({'second pirate addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second pirate addon you need to give me brutus bloodbeard\'s hat, lethal lissy\'s shirt, ron the ripper\'s sabre and deadeye devious\' eye patch. Do you have them with you?'})
nodepirate2:addChildKeyword({'yes'}, secondPirateAddon, {})
nodepirate2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeassassin1 = keywordHandler:addKeyword({'first assassin addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first assassin addon you need to give me 50 blue piece of cloths, 50 green piece of cloths, 50 red piece of cloths, 50 brown piece of cloths, 50 yellow piece of cloths, 50 white piece of cloths and 10 spool of yarns. Do you have them with you?'})
nodeassassin1:addChildKeyword({'yes'}, firstAssassinAddon, {})
nodeassassin1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeassassin2 = keywordHandler:addKeyword({'second assassin addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second assassin addon you need to give me 1 nose ring and 1 behemoth claw. Do you have them with you?'})
nodeassassin2:addChildKeyword({'yes'}, secondAssassinAddon, {})
nodeassassin2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodebeggar1 = keywordHandler:addKeyword({'first beggar addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first beggar addon you need to give me 100 ape furs and 20,000 gold pieces. Do you have them with you?'})
nodebeggar1:addChildKeyword({'yes'}, firstBeggarAddon, {})
nodebeggar1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodebeggar2 = keywordHandler:addKeyword({'second beggar addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second beggar addon you need to give me simon the beggar\'s staff. Do you have it with you?'})
nodebeggar2:addChildKeyword({'yes'}, secondBeggarAddon, {})
nodebeggar2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeshaman1 = keywordHandler:addKeyword({'second shaman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first shaman addon you ned to give me 5 dworf voodoo dolls and a mandrake. Do you have them with you?'})
nodeshaman1:addChildKeyword({'yes'}, firstShamanAddon, {})
nodeshaman1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeshaman2 = keywordHandler:addKeyword({'first shaman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second shaman addon you need to give me 5 banana staffs and 5 tribal masks. Do you have them with you?'})
nodeshaman2:addChildKeyword({'yes'}, secondShamanAddon, {})
nodeshaman2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodenorseman1 = keywordHandler:addKeyword({'first norseman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first norseman addon you need to give me 5 shards. Do you have them with you?'})
nodenorseman1:addChildKeyword({'yes'}, firstNorsemanAddon, {})
nodenorseman1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodenorseman2 = keywordHandler:addKeyword({'second norseman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second norseman addon you need to give me 10 shards. Do you have them with you?'})
nodenorseman2:addChildKeyword({'yes'}, secondNorsemanAddon, {})
nodenorseman2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodenightmare1 = keywordHandler:addKeyword({'first nightmare addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first nightmare addon you need to give me 500 demonic essences. Do you have them with you?'})
nodenightmare1:addChildKeyword({'yes'}, firstNightmareAddon, {})
nodenightmare1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodenightmare2 = keywordHandler:addKeyword({'second nightmare addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second nightmare addon you need to give me 1000 demonic essences. Do you have them with you?'})
nodenightmare2:addChildKeyword({'yes'}, secondNightmareAddon, {})
nodenightmare2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodebrotherhood1 = keywordHandler:addKeyword({'first brotherhood addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first brotherhood addon you need to give me 500 demonic essences. Do you have them with you?'})
nodebrotherhood1:addChildKeyword({'yes'}, firstBrotherhoodAddon, {})
nodebrotherhood1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodebrotherhood2 = keywordHandler:addKeyword({'second brotherhood addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second brotherhood addon you need to give me 1000 demonic essences. Do you have them with you?'})
nodebrotherhood2:addChildKeyword({'yes'}, secondBrotherhoodAddon, {})
nodebrotherhood2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeyalaharian1 = keywordHandler:addKeyword({'first yalaharian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first yalaharian addon you need to give me a vampiric crest. Do you have them with you?'})
nodeyalaharian1:addChildKeyword({'yes'}, firstYalaharianAddon, {})
nodeyalaharian1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

nodeyalaharian2 = keywordHandler:addKeyword({'second yalaharian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second yalaharian addon you need to give me a vampiric crest. Do you have them with you?'})
nodeyalaharian2:addChildKeyword({'yes'}, secondYalaharianAddon, {})
nodeyalaharian2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())
