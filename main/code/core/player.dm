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

			startTime = 0
			endTime = 0

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

				endTime = world.timeofday

				client.hideHUD("inventory")

				client.clearText("current-orb-count")
				client.clearText("total-orb-count")

				client.showHUD("win")

				client.drawText(" clear time: " + time2text((endTime - startTime), "mm:ss"), 1, 1, 16, 32)
				client.drawText("death count: " + num2text(deathCount), 1, 1, 16, 22, "death-count")

			updateInventory()
				for(var/obj/item/item in client.screen)
					item.updateScreenLoc(src)

			initializeOrbCounter()
				client.drawText("*   /" + num2text(game.orbTotal), 1, 1, 208, 0, "total-orb-count")

				updateOrbCounter()

			updateOrbCounter()
				client.clearText("current-orb-count")

				var/count = num2text(orbCount)

				if(length(count) == 2)
					count = "0" + count

				else if(length(count) == 1)
					count = "00" + count

				client.drawText(count, 1, 1, 216, 0, "current-orb-count")

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

			client.showHUD("inventory")

			initializeOrbCounter()

			startTime = world.timeofday

		Move(newLoc)
			var/d = get_dir(loc, newLoc)

			if(d & (d - 1)) return

			if(!canMove) return

			return ..()

		Crossed(atom/movable/ref)
			if(istype(ref, /obj/trap/blade))
				die()