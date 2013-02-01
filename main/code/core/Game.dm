Game
	var
		area/map/map
		mob/player/player

		orbTotal = 0

		list/traps

	proc
		setPlayer(mob/player/player)
			src.player = player

	New()
		map = locate(/area/map)

		if(!map)
			CRASH("The map could not be located and the game has failed to initailize. Something broke, basically.")

		orbTotal = map.getOrbTotal()

		traps = map.getTraps()

		for(var/obj/trap/trap in traps)
			spawn(1)
				trap.cycle()