-- ordered as in creaturescripts.xml
local quests = {116, 125, 8819, 12359, 12356, 12358, 12359, 12354, 12209, 12461}

function onLogin(player)
	-- Quests
	for i = 1, #quests do
		if player:getStorageValue(quests[i]) < 1 then
			player:setStorageValue(quests[i], 1)
		end
	end
	return true
end