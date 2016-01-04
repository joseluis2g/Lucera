local config = {
	["normal"] = {2745, 5796, 5929, 2072, 2666, 2560, 1990, 2114, 2223, 2657, 2111, 7735},
	["semirare"] = {22606, 22396, 22605, 22604},
	["rare"] = {22609, 22607, 7459, 2121},
	["veryrare"] = {13537, 2355}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local chance = math.random(100)

	if chance <= 70 then
		local tabela = config["normal"]
		local item = tabela[math.random(#tabela)]
		player:addItem(item, 1)
	elseif chance > 70 and chance < 85 then
		local tabela = config["semirare"]
		local item = tabela[math.random(#tabela)]
		player:addItem(item, 1)
	elseif chance >= 85 and chance < 95 then
		local tabela = config["rare"]
		local item = tabela[math.random(#tabela)]
		player:addItem(item, 1)
	else
		local tabela = config["veryrare"]
		local item = tabela[math.random(#tabela)]
		player:addItem(item, 1)
	end
	item:remove(1)
	return true
end