local blesses = {1, 2, 3, 4, 5}
local price = 50000

function onSay(player, words, param)
	for i = 1, 5 do
		if player:hasBlessing(i) then
			player:sendCancelMessage("Voce ja possui as blesses.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end
	end

	if player:removeMoney(price) then
		for i = 1, #blesses do
			player:addBlessing(blesses[i])
		end
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce comprou todas as blesses.")
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
	else
		player:sendCancelMessage("Voce precisa de " .. (math.ceil(price / 1000)) .. "k para comprar as blesses.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return false
end