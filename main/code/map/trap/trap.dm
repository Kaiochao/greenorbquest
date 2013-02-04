obj
	trap
		icon = 'tileset.dmi'

		var
			isActive = FALSE

			delay = 0
			delayOn = 0
			delayOff = 0

		proc
			cycle()

			activate()

			deactivate()

			setController(obj/sequence_controller/sequenceController)