obj
	trap
		spear
			icon_state = "spear-off"

			activate()
				if(isActive) return

				flick("spear-activating", src)

				icon_state = "spear-on"

				isActive = TRUE

			deactivate()
				if(!isActive) return

				flick("spear-deactivating", src)

				icon_state = initial(icon_state)

				isActive = FALSE

			Crossed(atom/movable/ref)
				if(ismob(ref))
					var/mob/player/player = ref

					activate()

					player.die()

					deactivate()