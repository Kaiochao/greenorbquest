mob
	temporary
		Login()
			client.showHUD("title", "begin", "help-button", "credits-button")

			client.drawText("Version 1.[world.version - 1]", 1, 1, 184, 0, "version")

		Logout()
			loc = null