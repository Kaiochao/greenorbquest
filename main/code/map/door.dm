obj
	door
		icon_state = "door"

		density = TRUE

		var
			obj/item/key/requiredKey

		Bumped(atom/movable/ref)
			if(ismob(ref))
				var
					mob/player/player = ref

					obj/item/key/key = locate(requiredKey) in player

				if(key)
					del key

					player << 'door-open.wav'

					player.updateInventory()

//					del src

					loc = null

				else
					player.die()

		red
			icon_state = "door-red"

			requiredKey = /obj/item/key/red

		blue
			icon_state = "door-blue"

			requiredKey = /obj/item/key/blue

		green
			icon_state = "door-green"

			requiredKey = /obj/item/key/green

		yellow
			icon_state = "door-yellow"

			requiredKey = /obj/item/key/yellow