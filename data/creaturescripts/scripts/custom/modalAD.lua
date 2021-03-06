local config = {
	[1] = {name = "Citizen", female = 136, male = 128},
	[2] = {name = "Hunter", female = 137, male = 129},
	[3] = {name = "Mage", female = 141, male = 130},
	[4] = {name = "Knight", female = 139, male = 131},
	[5] = {name = "Noble", female = 140, male = 132},
	[6] = {name = "Summoner", female = 138, male = 133},
	[7] = {name = "Warrior", female = 142, male = 134},
	[8] = {name = "Barbarian", female = 147, male = 143},
	[9] = {name = "Druid", female = 148, male = 144},
	[10] = {name = "Wizard", female = 149, male = 145},
	[11] = {name = "Oriental", female = 150, male = 146},
	[12] = {name = "Pirate", female = 155, male = 151},
	[13] = {name = "Assassin", female = 156, male = 152},
	[14] = {name = "Beggar", female = 157, male = 153},
	[15] = {name = "Shaman", female = 158, male = 154},
	[16] = {name = "Norseman", female = 252, male = 251},
	[17] = {name = "Nightmare", female = 269, male = 268},
	[18] = {name = "Jester", female = 270, male = 273},
	[19] = {name = "Brotherhood", female = 279, male = 278},
	[20] = {name = "Demonhunter", female = 288, male = 289},
	[21] = {name = "Yalaharian", female = 324, male = 325},
	[22] = {name = "Warmaster", female = 336, male = 335},
	[23] = {name = "Wayfarer", female = 366, male = 367},
	[24] = {name = "Afflicted", female = 431, male = 430},
	[25] = {name = "Elementalist", female = 433, male = 432},
	[26] = {name = "Deepling", female = 464, male = 463},
	[27] = {name = "Insectoid", female = 466, male = 465},
	[28] = {name = "Entrepreneur", female = 471, male = 472},
	[29] = {name = "Crystal Warlord", female = 513, male = 512},
	[30] = {name = "Soil Guardian", female = 514, male = 516},
	[31] = {name = "Demon", female = 542, male = 541},
	[32] = {name = "Cave Explorer", female = 575, male = 574},
	[33] = {name = "Dream Warden", female = 578, male = 577},
	[34] = {name = "Glooth Engineer", female = 618, male = 610},
	[35] = {name = "Champion", female = 632, male = 633},
	[36] = {name = "Conjurer", female = 635, male = 634},
	[37] = {name = "Beastmaster", female = 636, male = 637},
	[38] = {name = "Chaos Acolyte", female = 664, male = 665},
	[39] = {name = "Death Herald", female = 666, male = 667},
	[40] = {name = "Ranger", female = 683, male = 684},
	[41] = {name = "Ceremonial Garb", female = 694, male = 695},
	[42] = {name = "Puppeteer", female = 696, male = 697},
	[43] = {name = "Spirit Caller", female = 698, male = 699},
	[44] = {name = "Evoker", female = 724, male = 725},
	[45] = {name = "Seaweaver", female = 732, male = 733},
	[46] = {name = "Recruiter", female = 745, male = 746},
	[47] = {name = "Sea Dog", female = 749, male = 750},
	[48] = {name = "Royal Pumpkin", female = 759, male = 760}
}

function onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("modalAD")

    if modalWindowId == 1000 then
        if buttonId == 100 then
            if choiceId == 0 then
				return false
            end

			if player:removeItem(8982, 1) then
				player:addOutfitAddon(config[choiceId].female, 3)
				player:addOutfitAddon(config[choiceId].male, 3)
				player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabens! Voce comprou " .. config[choiceId].name .. " Addons.")
			else
				return player:sendCancelMessage("Voce precisa ter um Addon Doll em sua Backpack!")
			end
        end
    end
end
