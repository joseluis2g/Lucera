function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local p = Player(param)
	if not p then
		return false
	end

	p:removeCondition(CONDITION_OUTFIT)
	return false
end
