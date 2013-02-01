obj
	hud
		icon = 'hud.dmi'

		layer = FLY_LAYER

		inventory
			screen_loc = "1, 1 to 17, 1"

		slide
			icon = 'hud-slide.dmi'

			screen_loc = "1, 1"

			title
				icon_state = "title"

			help
				icon_state = "help"

				Click()
					usr << 'select.wav'

					usr.client.showHUD("title", "begin", "help-button", "credits-button")

					usr.client.clearScreen("help-slide")

			credits
				icon_state = "credits"

				Click()
					usr << 'select.wav'

					usr.client.showHUD("title", "begin", "help-button", "credits-button")

					usr.client.clearScreen("credits-slide")

			win
				icon_state = "win"

		button
			icon = 'hud-button.dmi'

			begin
				icon_state = "begin"

				screen_loc = "1:8, 1:8"

				Click()
					var/mob/player/player = new

					usr.client.mob = player

					player << 'begin.ogg'

					player.client.clearScreen("title", "begin", "help-button", "credits-button")

			help
				icon_state = "help"

				screen_loc = "1:100, 1:8"

				Click()
					usr << 'select.wav'

					usr.client.showHUD("help-slide")

					usr.client.clearScreen("title", "begin", "help-button", "credits-button")

			credits
				icon_state = "credits"

				screen_loc = "1:190, 1:8"

				Click()
					usr << 'select.wav'

					usr.client.showHUD("credits-slide")

					usr.client.clearScreen("title", "begin", "help-button", "credits-button")

		text
			icon = 'text.dmi'

			layer = FLY_LAYER + 1

			orb
				icon_state = "orb"

				screen_loc = "1:208, 1:4"

			separator
				icon_state = "/"

				screen_loc = "1:240, 1:4"