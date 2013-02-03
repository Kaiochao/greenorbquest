obj
	icon = 'tileset.dmi'

	trap
		var
			isActive = FALSE

			delay = 0
			delayOn = 0
			delayOff = 0

		proc
			cycle()

			activate()

			deactivate()