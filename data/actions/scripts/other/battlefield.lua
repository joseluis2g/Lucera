function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local team = player:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 and _Lib_Battle_Info.TeamOne.storage or _Lib_Battle_Info.TeamTwo.storage
	if (item.actionid == 52961 and player:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1) or (item.actionid == 52960 and player:getStorageValue(_Lib_Battle_Info.TeamTwo.storage) >= 1) then
		getWinnersBattle(team)
	end
	return true
end
