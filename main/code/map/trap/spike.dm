obj
	trap
		spike
			icon_state = "spike-off"

			delayOn = 30
			delayOff = 30

			cycle()
				while(src)
					activate()

					sleep(delayOn)

					deactivate()

					sleep(delayOff)

			activate()
				if(isActive) return

				flick("spike-activating", src)

				icon_state = "spike-on"

				isActive = TRUE

				for(var/mob/player/player in loc)
					player.die()

			deactivate()
				if(!isActive) return

				flick("spike-deactivating", src)

				icon_state = initial(icon_state)

				isActive = FALSE

			Crossed(atom/movable/ref)
				if(!isActive) return

				if(ismob(ref))
					var/mob/player/player = ref

					player.die()