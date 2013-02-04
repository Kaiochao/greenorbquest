obj
	trap
		hole
			icon_state = "hole-off"

			activate()
				if(isActive) return

				flick("hole-activating", src)

				icon_state = "hole-on"

				isActive = TRUE

				for(var/mob/player/player in loc)
					player.die()

			deactivate()
				if(!isActive) return

				flick("hole-deactivating", src)

				icon_state = initial(icon_state)

				isActive = FALSE

			Crossed(atom/movable/ref)
				if(!isActive) return

				if(ismob(ref))
					var/mob/player/player = ref

					player.die()