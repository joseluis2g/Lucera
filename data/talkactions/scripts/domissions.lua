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
	[11] = {str = Storage.InServiceofYalahar.Mission010, value = 2},
	[12] = {str = Storage.InServiceofYalahar.DoorToAzerus, value = 1},
	[13] = {str = Storage.InServiceofYalahar.DoorToLastFight, value = 1},
	[14] = {str = Storage.InServiceofYalahar.MatrixReward, value = 1}
}

function onSay(player, words, param)

	for _, cfg in pairs(inServiceOfYalaharQst) do
		if player:getStorageValue(cfg.str) <= 0 then
			player:setStorageValue(cfg.str, cfg.value)
		end
	end
	player:setStorageValue(theNewFrontierStr, 1)
	return false
end
