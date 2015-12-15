local config = {
	refuel = 42,
	full = 40
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    local stamina = player:getStamina() / 60

    if stamina >= config.full then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Voce so pode usar este item com stamina abaixo de 40h.\nSua stamina agora esta " .. stamina .. "h.")
    else
        player:setStamina(config.refuel * 60)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Sua stamina foi recarregada com sucesso.")
        item:remove(1)
    end
    return true
end
