mob
	player
		icon = 'player.dmi'

		pixel_y = 4

		speed = 2

		var
			isDead = FALSE
			canMove = TRUE

			orbCount = 0
			orbTotal = 0
			deathCount = 0

			obj/hud/text
				hundredsCount
				tensCount
				onesCount
				hundredsTotal
				tensTotal
				onesTotal

			list/orbCounters

			turf/checkpoint/checkpoint

		proc
			die()
				spawn(1)
					if(isDead) return

					isDead = TRUE
					canMove = FALSE

					deathCount++

					flick("die", src)

					icon_state = "dead"

					src << 'die.wav'

					sleep(10)

					respawn()

			respawn()
				if(!isDead) return

				isDead = FALSE
				canMove = TRUE

				icon_state = initial(icon_state)

				loc = checkpoint

			win()
				canMove = FALSE

				client.clearScreen("CLEAR_ALL")

				client.showHUD("win")

				getDeathCount()

			updateInventory()
				for(var/obj/item/item in client.screen)
					item.updateScreenLoc(src)

			// Everything about this is awful but I am on a time limit.
			initializeOrbCounter()
				hundredsCount = new
				tensCount = new
				onesCount = new
				hundredsTotal = new
				tensTotal = new
				onesTotal = new
				orbCounters = list(hundredsCount, tensCount, onesCount, hundredsTotal, tensTotal, onesTotal)

				var/i = 0

				for(var/obj/hud/text/text in orbCounters)
					text.icon_state = "0"

					var/offset = (i >= 3 ? ((i * 8) + 8) : (i * 8))

					text.screen_loc = "1:[216 + offset], 1:4"

					i++

				var/count = num2text(game.orbTotal)

				if(length(count) == 2)
					count = "0" + count

				else if(length(count) == 1)
					count = "00" + count

				hundredsTotal.icon_state = copytext(count, 1, 2)
				tensTotal.icon_state = copytext(count, 2, 3)
				onesTotal.icon_state = copytext(count, 3, 4)

				client.screen += orbCounters

				updateOrbCounter()

			updateOrbCounter()
				if(orbCount >= 999) return

				var/count = num2text(orbCount)

				if(length(count) == 2)
					count = "0" + count

				else if(length(count) == 1)
					count = "00" + count

				hundredsCount.icon_state = copytext(count, 1, 2)
				tensCount.icon_state = copytext(count, 2, 3)
				onesCount.icon_state = copytext(count, 3, 4)

			getDeathCount()
				var/count = num2text(deathCount)

				for(var/i = 0; i <= length(count); i++)
					var/obj/hud/text/text = new

					text.icon_state = copytext(count, i, i + 1)
					text.screen_loc = "1:[166 + (i * 8)], 1:8"

					client.screen += text

		Login()
			// Manually set the first checkpoint so that it won't play a sound effect.
			var/turf/checkpoint/start/start = locate()

			if(!start)
				CRASH("Starting position not found. Something has gone horribly wrong.")

			checkpoint = start

			start.icon_state = "checkpoint-active"

			loc = checkpoint

			game = new

			game.player = src

			client.showHUD("inventory", "orb-sprite", "counter-separator")

			initializeOrbCounter()

//			src << 'Grey Sector v0_85.ogg'

		Move(newLoc)
			var/d = get_dir(loc, newLoc)

			if(d & (d - 1)) return

			if(!canMove) return

			return ..()

		Crossed(atom/movable/ref)
			if(istype(ref, /obj/trap/blade))
				die()