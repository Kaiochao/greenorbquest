area
	map
		proc
			getOrbTotal()
				. = 0

				for(var/obj/item/orb/orb in src)
					.++

			getTraps()
				. = list()

				for(var/obj/trap/trap in src)
					. += trap

		water
			Enter(mob/player/player)
				if(!ismob(player)) return

				var/obj/item/snorkel/snorkel = locate() in player

				if(snorkel) return ..()

				return

			Entered(mob/player/player)
				if(!ismob(player)) return

				player.icon_state = "swim"

			Exited(mob/player/player)
				if(!ismob(player)) return

				player.icon_state = initial(player.icon_state)

		pit
			Entered(mob/player/player)
				if(!ismob(player)) return

				var/obj/item/talaria/talaria = locate() in player

				if(talaria)
					player.icon_state = "float"

				else
					player.die()

			Exited(mob/player/player)
				if(!ismob(player)) return

				player.icon_state = initial(player.icon_state)