turf
	icon = 'tileset.dmi'

	floor
		icon_state = "floor"

	wall
		icon_state = "wall"

		density = TRUE

	pit
		icon_state = "pit"

	water
		icon_state = "water"

	checkpoint
		icon_state = "checkpoint"

		Entered(mob/player/player)
			if(!istype(player)) return

			if(player.checkpoint)
				if(player.checkpoint == src) return

				player.checkpoint.icon_state = initial(player.checkpoint.icon_state)

				player.checkpoint = src

				icon_state = "checkpoint-active"

				player << 'checkpoint.wav'

		start

		blue_zone

		green_zone

		red_zone

		yellow_zone

	flag
		icon_state = "flag"

		Entered(mob/player/player)
			if(!istype(player)) return

			var/obj/item/orb/orb = locate()

			if(orb)
				player.die()

			else if(player.orbCount < game.orbTotal)
				player.die()

			else
				player.win()