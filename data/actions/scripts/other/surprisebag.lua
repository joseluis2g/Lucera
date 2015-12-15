local presents = {
	[6570] = { -- bluePresent
		{2687, 10}, {6394, 3}, 6280, 6574, 6578, 6575, 6577, 6569, 6576, 6572, 2114
	},
	[6571] = { -- redPresent
		{2152, 10}, {2152, 10}, {2152, 10}, 2153, 5944, 2112, 6568, 6566, 2492, 2520, 2195, 2114, 2114, 2114, 6394, 6394, 6576, 6576, 6578, 6578, 6574, 6574
	},
	[9108] = { -- surpriseBag
		{2148, 10}, 7487, 2114, 8072, 7735, 8110, 6574, 6394, 7377, 2667, 9693
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local present = presents[item.itemid]
	if not present then
		return false
	end

	local count = 1
	local targetItem = presents[item.itemid]
	if not targetItem then
		return true
	end

	local gift = targetItem[math.random(#targetItem)]
	if type(gift) == "table" then
		gift = gift[1]
		count = gift[2]
	end

	player:addItem(gift, count)
	item:remove(1)
	fromPosition:sendMagicEffect(CONST_ME_GIFT_WRAPS)
	return true
end
