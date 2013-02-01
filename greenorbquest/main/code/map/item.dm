obj
	item
		icon = 'items.dmi'

		proc
			get(mob/player/player)
				if(Move(player))
					player << 'get-item.wav'

					layer = FLY_LAYER

					screen_loc = "[player.contents.len], 1"

					player.client.screen += src

			updateScreenLoc(mob/player/player)
				screen_loc = "[player.contents.Find(src)], 1"

		SteppedOn(atom/movable/ref)
			if(ismob(ref))
				var/mob/player/player = ref

				get(player)

		snorkel
			icon_state = "snorkel"

			desc = "A swimming apparatus that allows you to breathe underwater."

		talaria
			icon_state = "talaria"

			desc = "A pair of shoes that let you walk on air."

		key
			desc = "A coloured key that goes to a corresponding door."

			red
				icon_state = "key-red"

			blue
				icon_state = "key-blue"

			green
				icon_state = "key-green"

			yellow
				icon_state = "key-yellow"

		orb
			icon_state = "orb"

			desc = "A mystical green orb that resonates with an unknown power."

			SteppedOn(atom/movable/ref)
				if(ismob(ref))
					var/mob/player/player = ref

					player.orbCount++
					player.orbTotal++

					player.updateOrbCounter()

					player << sound('get-orb.wav', volume = 25)

//					player << 'get-orb.wav'

					del src

		orb_red
			icon_state = "orb-red"

			desc = "A strange red orb. What does it do?"