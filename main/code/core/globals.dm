atom
	proc
		Bumped(atom/movable/ref)

	movable
		Bump(atom/obstacle)
			obstacle.Bumped(src)

var
	Game/game

	list/huds

	const/CHAR_WIDTH = 8