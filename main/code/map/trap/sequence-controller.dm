/*
	Written by DarkCampainger (http://www.byond.com/members/darkcampainger)
	On February 3rd, 2013

	To use the sequence controller, place exactly one of them on
	either end of a chain of traps. Make sure to disable the trap's
	cycle() procedure, or else bad things will happen.
*/
obj
	sequence_controller
		var
			sequenceIndex = 1

			list
				traps
				sequences

		proc
			connectToTraps()
				var/obj/trap/trap = locate() in loc

				traps += trap

				var
					lastDir = 0
					turf/lastTurf = loc

				while(trap)
					for(var/d in list(NORTH, SOUTH, EAST, WEST))
						if(d == lastDir) continue

						var/turf/t = get_step(lastTurf, d)

						trap = locate() in t

						if(t)
							traps += trap

							trap.setController(src)

							lastTurf = t

							lastDir = turn(d, 180)

							break

			runSequence()
				while(src)
					var
						layout = sequences[sequenceIndex]
						position = 1

					for(var/obj/trap/trap in traps)
						if(lowertext(copytext(layout, position, position + 1)) == "x")
							trap.activate()

						else
							trap.deactivate()

						if(++position > length(layout))
							position = 1

					var/delay = sequences[++sequenceIndex]

					sleep(delay)

					if(++sequenceIndex > sequences.len)
						sequenceIndex = 1

		New()
			traps = list()

			spawn(1)
				connectToTraps()

				runSequence()