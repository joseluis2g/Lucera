local price = 10000

function onSay(player, words, param)
	if player:removeMoney(price) then
		player:getPosition():sendMagicEffect(CONST_ME_YELLOWENERGY)
		player:addItem(2173, 1)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("Voce nao tem dinheiro para compar o AOL.")
	end
	return false
end