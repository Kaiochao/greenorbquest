obj
	trap
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

			Crossed(atom/movable/ref)
				if(ismob(ref))
					var/mob/player/player = ref

					player.die()

		blade_trail
			icon_state = "blade-trail"

			New()
				icon_state = null