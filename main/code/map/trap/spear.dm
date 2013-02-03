obj
	trap
		spear
			icon_state = "spear-off"

			activate()
				flick("spear-activating", src)

				icon_state = "spear-on"

				isActive = TRUE

			deactivate()
				flick("spear-deactivating", src)

				icon_state = initial(icon_state)

				isActive = FALSE

			SteppedOn(atom/movable/ref)
				if(ismob(ref))
					var/mob/player/player = ref

					activate()

					player.die()

					deactivate()