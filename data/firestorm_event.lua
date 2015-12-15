-- firestorm Variables
fsJoinedCountGlobalStorage = 18900 --Player joined event count / recuento de players.
fsJoinStorage = 18901 --player join storage / storage del jugador a unirse.
fsMinPlayers = 2 --min players needed when time runout / minimo de players necesarios para comenzar el evento.
fsMaxPlayers = 20 --max players to join / maximo de players.
fsTrophy = 2157 --trophy itemid / itemid del premio(que no sea stackable).
fsTrophyCount = 5
fsEventCountGlobalStorage = 18902 --firestorm Count (no move/no moverle).

fsWaitMinutes = 1 --when event has opened, how long until it starts? / cuantos minutos tarde el evento en empezar.
fsWaitingRoomPos = Position(31460, 32316, 8) --middle of waiting room / punto medio de el cuarto de espera.
fsArena = Position(31456, 32305, 7) --when even start where should player be teleported in the arena? / punto donde seran transportados los players.
fsArenaFromPosition = Position(31453, 32294, 7) --pos of top left corner / posicion de esquina superior izquierda.
fsArenaToPosition = Position(31496, 32313, 7) --pos of bottom right corner /posicion de esquina inferior derecha.
fsMiddleEventArena = Position(31475, 32304, 7) --Middle pos of the arena / punto medio de la arena
fsWaitingRoomRadiusX = 8 --depends how big the waiting room is 20sqm to x / depende de lo grande la sala de espera en x
fsWaitingRoomRadiusY = 8 --depends how big the waiting room is 20sqm to y / depende de lo grande la sala de espera en y
fsEventArenaRadiusX = 15 --Depends how big the firestorm arena is 50sqm to x / depende de lo grande de la arena en x
fsEventArenaRadiusY = 15 --Depends how big the firestorm arena is 50sqm to y / depende de lo grande de la arena en y
fsStartedGlobalStorage = 18903 -- Value: 0 == false, 1 == true, 2 == started --State of the event
fsCreateTeleportPosition = Position(32341, 32213, 7) --Where should the teleport be created? / posicion donde sera creado el teleport?

_Fire_Event_Days = {
	["Monday"] = {
		["12:00"] = {},
		["20:00"] = {}
	},
	--["Wednesday"] = {
		--["22:24"] = {}
	--},
	["Saturday"] = {
		["17:00"] = {},
		["22:00"] = {}
	},
	["Sunday"] = {
		["10:00"] = {},
		["15:00"] = {},
		["20:00"] = {}
	}
}

function startfirestorm()
    local specs = Game.getSpectators(fsWaitingRoomPos, false, true, 0, fsWaitingRoomRadiusX, 0, fsWaitingRoomRadiusY)
	if Game.getStorageValue(fsJoinedCountGlobalStorage) < fsMinPlayers then
		for i = 1, #specs do
			specs[i]:teleportTo(specs[i]:getTown():getTemplePosition(), false)
			specs[i]:setStorageValue(fsJoinStorage, 0)
		end

		resetfsVariables()
		removeFireEventTp()
		Game.broadcastMessage('[Firestorm] O evento nao foi iniciado porque nao atingiu o numero minimo de participantes!', MESSAGE_STATUS_WARNING)
		return true
	end

	for i = 1, #specs do
		local rX, rY, rZ
		rX = math.random(fsArenaFromPosition.x, fsArenaToPosition.x)
        rY = math.random(fsArenaFromPosition.y, fsArenaToPosition.y)
        rZ = math.random(fsArenaFromPosition.z, fsArenaToPosition.z)
		specs[i]:teleportTo(Position(rX, rY, rZ))
	end

	removeFireEventTp()
	Game.broadcastMessage("[Firestorm] O evento foi iniciado, boa sorte a todos os participantes.", MESSAGE_STATUS_WARNING)
	Game.setStorageValue(fsStartedGlobalStorage, 2)
	doStartfirestorm()
end

function doStartfirestorm()
	if Game.getStorageValue(fsStartedGlobalStorage) == 2 then
		local spectators = Game.getSpectators(fsArena, false, true, 0, fsEventArenaRadiusX, 0, fsEventArenaRadiusY)
		for i = 1, #spectators do
			local randX, randY, randZ
			randX = math.random(fsArenaFromPosition.x, fsArenaToPosition.x)
			randY = math.random(fsArenaFromPosition.y, fsArenaToPosition.y)
			randZ = math.random(fsArenaFromPosition.z, fsArenaToPosition.z)
			local randfire = Position(randX, randY, randZ)
			local creature, players = nil, Game.getPlayers()
			for i = 1, #players do
				creature = players[i]
				doSendDistanceShoot(fsArenaFromPosition, randfire, 4)
				doSendDistanceShoot(fsArenaToPosition, randfire, 4)
				doAreaCombatHealth(creature.uid, COMBAT_FIREDAMAGE, randfire, 0, -999999, -999999, CONST_ME_FIREAREA)
			end
			--randfire:sendMagicEffect(CONST_ME_FIREAREA)
			--if creaturePos == randfire then
				--creature:addHealth(-creature:getMaxHealth())
			--end
		end
		addEvent(doStartfirestorm, 500)
	end
end

function resetfsVariables()
	Game.setStorageValue(fsEventCountGlobalStorage, 0)
	Game.setStorageValue(fsJoinedCountGlobalStorage, 0)
	Game.setStorageValue(fsStartedGlobalStorage, 0)
end

function removeFireEventTp()
	local t = getTileItemById(fsCreateTeleportPosition, 1387).uid
	return t > 0 and doRemoveItem(t) and doSendMagicEffect(fsCreateTeleportPosition, CONST_ME_POFF)
end
