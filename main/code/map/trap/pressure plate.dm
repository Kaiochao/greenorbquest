obj
	pressure_plate_wire
		icon = 'tileset.dmi'
		icon_state = "pressure-plate-wire"
		invisibility = 1

		proc/isValidTrap(obj/trap/trap)
			if(istype(trap, /obj/trap/pressure_plate)) return TRUE
			if(istype(trap, /obj/trap/arrow_shooter)) return TRUE
			if(istype(trap, /obj/trap/boulder)) return TRUE

		New()
			..()
			spawn if(loc)
				var traps[0]
				var nodes[0]
				var new_nodes[] = list(src)

				while(new_nodes.len)
					for(var/obj/pressure_plate_wire/node in new_nodes.Copy())
						for(var/obj/pressure_plate_wire/other in orange(1, node))
							if(other in new_nodes) continue
							if(other in nodes) continue
							new_nodes += other
						new_nodes -= node
						nodes += node

						for(var/obj/trap/trap in node.loc)
							if(isValidTrap(trap))
								traps += trap

				for(var/obj/pressure_plate_wire/wire in nodes)
					wire.loc = null

				var non_plates[] = traps.Copy()
				for(var/obj/trap/trap in non_plates)
					if(istype(trap, /obj/trap/pressure_plate))
						non_plates -= trap

				for(var/obj/trap/pressure_plate/plate in traps)
					plate.attachedTraps = non_plates

obj
	projectile
		icon = 'projectiles.dmi'
		var step_lag = 1

		New(loc, dir)
			src.dir = dir
			walk(src, dir, step_lag)

		Crossed(mob/player/player)
			if(istype(player))
				hit(player)

		proc/hit(mob/player/player)
			player.die()
			loc = null

		Move(turf/wall/wall)
			if(istype(wall))
				loc = null
			else return ..()

		/mob/player/Crossed(obj/projectile/p)
			if(!istype(p)) return ..()
			p.hit(src)

		arrow
			icon_state = "arrow"

		boulder
			icon_state = "boulder"

obj
	trap
		arrow_shooter
			icon_state = "arrow-shooter"
			layer = OBJ_LAYER + 0.1
			activate()
				new /obj/projectile/arrow (loc, dir)

		boulder
			icon_state = "boulder"
			activate()
				new /obj/projectile/boulder (loc, dir)

		pressure_plate
			icon_state = "pressure-plate-off"

			var attachedTraps[0]

			delayOff = 30

			var deactivating
			cycle()
				if(deactivating) return

				deactivating = TRUE
				sleep delayOff
				deactivating = FALSE

				deactivate()

			activate()
				if(isActive) return

				icon_state = "pressure-plate-on"

				isActive = TRUE

				for(var/obj/trap/trap in attachedTraps)
					trap.activate()

			deactivate()
				if(!isActive) return

				icon_state = "pressure-plate-off"

				isActive = FALSE

				if(locate(/mob/player) in loc)
					activate()

			Crossed(mob/player/player)
				if(istype(player))
					activate()

			Uncrossed(mob/player/player)
				if(istype(player) && isActive)
					spawn cycle()