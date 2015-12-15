function onSay(player, words, param)
	local resultId = db.storeQuery("SELECT * FROM z_shop_offer WHERE offer_name = '" .. param .. "';")
	if resultId ~= false then
		local pontos = player:getPoints()
		local preco = tonumber(result.getDataInt(resultId, "points"))
		if pontos >= preco then
			local tipo = tostring(result.getDataString(resultId, "offer_type"))
			local oferta = tostring(result.getDataString(resultId, "offer_name"))
			local timeNow = os.time()
			if tipo == "item" or tipo == "decoração" then
				local item = ItemType(tonumber(result.getDataInt(resultId, "itemid1")))
				local qtd = tonumber(result.getDataInt(resultId, "count1"))
				local qtdTotal = (qtd > 0) and qtd or 1
				if player:getFreeCapacity() >= item:getWeight(qtdTotal) then
					if item:isStackable() then
						player:addItem(item:getId(), qtd)
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabens! Voce comprou " .. qtd .. "x " .. param .. " da nossa loja.")
					else
						player:addItem(item:getId())
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabens! Voce comprou um " .. param .. " da nossa loja.")
					end
					player:setPoints(pontos - preco)
					player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
					db.query("INSERT INTO `z_shop_history` VALUES ('', " .. player:getAccountId() .. ", '" .. tipo .. "', '" .. oferta .. "', '" .. player:getName() .. "', " .. preco .. ", " .. timeNow .. ")")
				else
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa de " .. (item:getWeight(qtdTotal) / 100) .. " de capacidade livre para comprar este item.")
				end
			elseif tipo == "mount" then
				local mount = tonumber(result.getDataInt(resultId, "itemid1"))
				if not player:hasMount(mount) then
					player:addMount(mount)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabens! Voce comprou a montaria " .. param .. " em nossa loja.")
					player:setPoints(pontos - preco)
					player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
					db.query("INSERT INTO `z_shop_history` VALUES ('', " .. player:getAccountId() .. ", '" .. tipo .. "', '" .. oferta .. "', '" .. player:getName() .. "', " .. preco .. ", " .. timeNow .. ")")
				else
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce ja possui esta montaria.")
				end
			elseif tipo == "addon" then
				local lookFemale = tonumber(result.getDataInt(resultId, "itemid1"))
				local lookMale = tonumber(result.getDataInt(resultId, "count1"))
				local addons = tonumber(result.getDataInt(resultId, "itemid2"))
				if not player:hasOutfit(lookFemale, addons) and not player:hasOutfit(lookMale, addons) then
					player:addOutfitAddon(lookFemale, addons)
					player:addOutfitAddon(lookMale, addons)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabens! Voce comprou um " .. param .. " outfit full em nossa loja.")
					player:setPoints(pontos - preco)
					player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
					db.query("INSERT INTO `z_shop_history` VALUES ('', " .. player:getAccountId() .. ", '" .. tipo .. "', '" .. oferta .. "', '" .. player:getName() .. "', " .. preco .. ", " .. timeNow .. ")")
				else
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce ja possui este outfit.")
				end
			end
		else
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Esta oferta custa " .. preco .. " coins e voce possui " .. pontos .. ".")
		end
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Oferta nao encontrada.")
	end
	return false
end
