local mounts = {
	[1] = {name = "Widow Queen"},
	[2] = {name = "Racing Bird"},
	[3] = {name = "War Bear"},
	[4] = {name = "Black Sheep"},
	[5] = {name = "Midnight Panther"},
	[6] = {name = "Draptor"},
	[7] = {name = "Titanica"},
	[8] = {name = "Tin Lizzard"},
	[9] = {name = "Blazebringer"},
	[10] = {name = "Rapid Boar"},
	[11] = {name = "Stampor"},
	[12] = {name = "Undead Cavebear"},
	[13] = {name = "Donkey"},
	[14] = {name = "Tiger Slug"},
	[15] = {name = "Uniwheel"},
	[16] = {name = "Crystal Wolf"},
	[17] = {name = "War Horse"},
	[18] = {name = "Kingly Deer"},
	[19] = {name = "Tamed Panda"},
	[20] = {name = "Dromedary"},
	[21] = {name = "Scorpion King"},
	[22] = {name = "Rented Horse"},
	[23] = {name = "Armoured War Horse"},
	[24] = {name = "Shadow Draptor"},
	[25] = {name = "Rented Horse"},
	[26] = {name = "Rented Horse"},
	[27] = {name = "Lady Bug"},
	[28] = {name = "Manta Ray"},
	[29] = {name = "Ironblight"},
	[30] = {name = "Magma Crawler"},
	[31] = {name = "Dragonling"},
	[32] = {name = "Gnarlhound"},
	[33] = {name = "Crimson Ray"},
	[34] = {name = "Steelbeak"},
	[35] = {name = "Water Buffalo"},
	[36] = {name = "Armoured Scorpion"},
	[37] = {name = "Armoured Dragonling"},
	[38] = {name = "Ursagrodon"},
	[39] = {name = "Hellgrip"},
	[40] = {name = "Noble Lion"},
	[41] = {name = "Desert King"},
	[42] = {name = "Shock Head"},
	[43] = {name = "Walker"},
	[44] = {name = "Azudocus"},
	[45] = {name = "Carpacosaurus"},
	[46] = {name = "Death Crawler"},
	[47] = {name = "Flamesteed"},
	[48] = {name = "Jade Lion"},
	[49] = {name = "Jade Pincer"},
	[50] = {name = "Nethersteed"},
	[51] = {name = "Tempest"},
	[52] = {name = "Winter King"},
	[53] = {name = "Doombringer"},
	[54] = {name = "Woodland Prince"},
	[55] = {name = "Hailtorm Fury"},
	[56] = {name = "Siegebreaker"},
	[57] = {name = "Poisonbane"},
	[58] = {name = "Blackpelt"},
	[59] = {name = "Golden Dragonfly"},
	[60] = {name = "Steel Bee"},
	[61] = {name = "Copper Fly"},
	[62] = {name = "Tundra Rambler"},
	[63] = {name = "Highland Yak"},
	[64] = {name = "Glacier Vagabond"},
	[65] = {name = "Flying Divan"},
	[66] = {name = "Magic Carpet"},
	[67] = {name = "Floating Kashmir"},
	[68] = {name = "Ringtail Waccoon"},
	[69] = {name = "Night Waccoon"},
	[70] = {name = "Emerald Waccoon"},
	[71] = {name = "Glooth Glider"},
	[72] = {name = "Shadow Hart"},
	[73] = {name = "Black Stag"},
	[74] = {name = "Emperor Deer"},
	[75] = {name = "Flitterkatzen"},
	[76] = {name = "Venompaw"},
	[77] = {name = "Batcat"},
	[78] = {name = "Sea Devil"},
	[79] = {name = "Coralripper"},
	[80] = {name = "Plumfish"},
	[81] = {name = "Gorongra"},
	[82] = {name = "Noctungra"},
	[83] = {name = "Silverneck"},
	[84] = {name = "Slagsnare"},
	[85] = {name = "Nightstinger"},
	[86] = {name = "Razorcreep"}
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:registerEvent("mountDoll")

    local title = "Escolha a Montaria!"
    local message = "Voce ira receber a montaria em seu personagem!"

    local window = ModalWindow(1001, title, message)

    for i = 1, #mounts do
        local m = mounts[i].name
        if not player:hasMount(i) then
            window:addChoice(i, m)
        end
    end

	if player:getItemCount(13030) >= 1 and window:getChoiceCount() > 0 then
		window:addButton(100, "Confirmar")
		window:setDefaultEnterButton(100)
	else
		window:setDefaultEnterButton(101)
	end
    window:addButton(101, "Cancelar")
    window:setDefaultEscapeButton(101)

	if window:getChoiceCount() == 0 then
		window:setMessage("Parabens! Voce possui todos as mounts.")
		--add achievement
	end

	window:sendToPlayer(player)
	return true
end
