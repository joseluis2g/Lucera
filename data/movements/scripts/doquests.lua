local inServiceOfYalaharQst = {
	[1] = {str = Storage.InServiceofYalahar.Questline, value = 51},
	[2] = {str = Storage.InServiceofYalahar.Mission01, value = 6},
	[3] = {str = Storage.InServiceofYalahar.Mission02, value = 8},
	[4] = {str = Storage.InServiceofYalahar.Mission03, value = 6},
	[5] = {str = Storage.InServiceofYalahar.Mission04, value = 6},
	[6] = {str = Storage.InServiceofYalahar.Mission05, value = 8},
	[7] = {str = Storage.InServiceofYalahar.Mission06, value = 5},
	[8] = {str = Storage.InServiceofYalahar.Mission07, value = 5},
	[9] = {str = Storage.InServiceofYalahar.Mission08, value = 4},
	[10] = {str = Storage.InServiceofYalahar.Mission09, value = 2},
	[11] = {str = 12250, value = 2},
	[12] = {str = Storage.InServiceofYalahar.DoorToAzerus, value = 1},
	[13] = {str = Storage.InServiceofYalahar.DoorToLastFight, value = 1},
	[14] = {str = Storage.InServiceofYalahar.MatrixReward, value = 1}
}

local theNewFrontierQst = {
	[1] = {str = Storage.TheNewFrontier.Questline, value = 28},
	[2] = {str = Storage.TheNewFrontier.Mission01, value = 3},
	[3] = {str = Storage.TheNewFrontier.Mission02, value = 6},
	[4] = {str = Storage.TheNewFrontier.Mission03, value = 3},
	[5] = {str = Storage.TheNewFrontier.Mission04, value = 2},
	[6] = {str = Storage.TheNewFrontier.Mission05, value = 7},
	[7] = {str = Storage.TheNewFrontier.Mission06, value = 3},
	[8] = {str = Storage.TheNewFrontier.Mission07, value = 3},
	[9] = {str = Storage.TheNewFrontier.Mission08, value = 2},
	[10] = {str = Storage.TheNewFrontier.Mission09, value = 3},
	[11] = {str = Storage.TheNewFrontier.Mission10, value = 1},
	[12] = {str = Storage.TheNewFrontier.TomeofKnowledge, value = 13},
	[13] = {str = Storage.TheNewFrontier.Beaver1, value = 1},
	[14] = {str = Storage.TheNewFrontier.Beaver2, value = 1},
	[15] = {str = Storage.TheNewFrontier.Beaver3, value = 1},
	[16] = {str = Storage.TheNewFrontier.BribeKing, value = 1},
	[17] = {str = Storage.TheNewFrontier.BribeLeeland, value = 1},
	[18] = {str = Storage.TheNewFrontier.BribeExplorerSociety, value = 1},
	[19] = {str = Storage.TheNewFrontier.BribeWydrin, value = 1},
	[20] = {str = Storage.TheNewFrontier.BribeTelas, value = 1},
	[21] = {str = Storage.TheNewFrontier.BribeHumgolf, value = 1}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if item.actionid == 52000 then
		if player:getStorageValue(51997) <= 0 then
			for _, cfg in pairs(inServiceOfYalaharQst) do
				player:setStorageValue(cfg.str, cfg.value)
			end
			player:setStorageValue(51997, 1)
			return true
		end
	elseif item.actionid == 52001 then
		if player:getStorageValue(item.actionid) <= 0 then
			for _, cfg in pairs(theNewFrontierQst) do
				if player:getStorageValue(cfg.str) <= 0 then
					player:setStorageValue(cfg.str, cfg.value)
				end
			end
			player:setStorageValue(item.actionid, 1)
			return true
		end
	end
	return true
end
