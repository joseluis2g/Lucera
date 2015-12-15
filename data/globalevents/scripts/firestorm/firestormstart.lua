dofile('data/firestorm_event.lua')
function onStartup()
	Game.setStorageValue(fsJoinedCountGlobalStorage, 0)
	Game.setStorageValue(fsJoinStorage, 0)
	Game.setStorageValue(fsEventCountGlobalStorage, 0)
	Game.setStorageValue(fsStartedGlobalStorage, 0)
	return true
end
