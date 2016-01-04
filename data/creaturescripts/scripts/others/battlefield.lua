function onLogin(player)
	if player:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 or player:getStorageValue(_Lib_Battle_Info.TeamTwo.storage) >= 1 then
		player:setStorageValue(_Lib_Battle_Info.TeamOne.storage, -1)
		player:setStorageValue(_Lib_Battle_Info.TeamTwo.storage, -1)
		player:teleportTo(player:getTown():getTemplePosition())
	end
	return true
end

function onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
	if creature:isPlayer() and creature:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 or creature:getStorageValue(_Lib_Battle_Info.TeamTwo.storage) >= 1 then
		local team = creature:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 and _Lib_Battle_Info.TeamOne.name or _Lib_Battle_Info.TeamTwo.name
		local MyTeam = creature:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 and _Lib_Battle_Info.TeamOne.storage or _Lib_Battle_Info.TeamTwo.storage
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "[BattleField Information] You are dead.")
		creature:setStorageValue(MyTeam, -1)
		creature:removeCondition(CONDITION_OUTFIT)
		doBroadCastBattle(23, "[BattleField Information] The fighter " .. creature:getName() .. " from team " .. team .. " has been defeated.")
	end
	return true
end
