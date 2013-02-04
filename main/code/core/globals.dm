atom
	proc
		Bumped(atom/movable/ref)

	movable
		Bump(atom/obstacle)
			obstacle.Bumped(src)
/*
		proc
			SteppedOn(atom/movable/ref)

turf
	Entered(atom/movable/ref)
		..()

		if(!istype(ref)) return

		for(var/atom/movable/o in src)
			if(o == ref) continue

			o.SteppedOn(ref)
*/
var
	Game/game

	list/huds