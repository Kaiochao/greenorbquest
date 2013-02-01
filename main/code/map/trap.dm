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
				flick("spike-activating", src)

				icon_state = "spike-on"

				isActive = TRUE

				for(var/mob/player/player in loc)
					spawn(1)
						player.die()

			deactivate()
				flick("spike-deactivating", src)

				icon_state = initial(icon_state)

				isActive = FALSE

			SteppedOn(atom/movable/ref)
				if(!isActive) return

				if(ismob(ref))
					var/mob/player/player = ref

					player.die()

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

		blade
			icon_state = "blade"

			delay = 1

			speed = 2

			cycle()
				while(src)
					var/obj/trap/blade_trail/bladeTrail = locate() in get_step(src, dir)

					if(bladeTrail)
						Move(bladeTrail.loc, dir)

					else
						sleep(world.tick_lag * 10)

						dir = turn(dir, 180)

					sleep(delay)

			SteppedOn(atom/movable/ref)
				if(ismob(ref))
					var/mob/player/player = ref

					player.die()

		blade_trail
			icon_state = "blade-trail"

			New()
				icon_state = null