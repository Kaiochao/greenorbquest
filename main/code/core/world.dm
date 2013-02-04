/*
	Green Orb Quest is based on Sean "Squidi" Howard's Pellet Quest concept.
	Three Hundred Mechanics (http://www.squidi.net/three/)
	#21 Pellet Quest (http://www.squidi.net/three/entry.php?id=21)

	Sound effects generated using DrPetter's sfxr tool.
	sfxr (http://www.drpetter.se/project_sfxr.html)

	Music by FoxSynergy (http://opengameart.org/content/grey-sector-8-bit)

	Programming and artwork, unless otherwise noted is mine (Robert "Lordovos" Holman's).
*/
world
	name = "Green Orb Quest"

	hub = "LordAndrew.GreenOrbQuest"

	version = 4

	icon_size = 16

	fps = 40

	area = /area/map
	turf = /turf/floor
	mob = /mob/temporary

	view = "17x13"

	New()
		huds = list()

		huds["title"] = new /obj/hud/slide/title
		huds["help-slide"] = new /obj/hud/slide/help
		huds["credits-slide"] = new /obj/hud/slide/credits
		huds["begin"] = new /obj/hud/button/begin
		huds["help-button"] = new /obj/hud/button/help
		huds["credits-button"] = new /obj/hud/button/credits
		huds["inventory"] = new /obj/hud/inventory
		huds["win"] = new /obj/hud/slide/win
		huds["orb-sprite"] = new /obj/hud/text/orb
		huds["counter-separator"] = new /obj/hud/text/separator

	OpenPort()
		return 0