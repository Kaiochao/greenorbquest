client
	control_freak = CONTROL_FREAK_ALL

	pixel_y = -8

	proc
		drawText(string, screenX = 1, screenY = 1, screenXOffset = 0, screenYOffset = 0, id)
			var/stringLength = length(string)

			for(var/i = 0; i <= stringLength; i++)
				var/obj/text/char = new

				char.icon_state = copytext(lowertext(string), i, i + 1)

				var/hangingOffset = ((char.icon_state in list("g", "j", "p", "q", "y", ",")) ? 2 : 4)

				char.screen_loc = "[screenX]:[screenXOffset + ((i * CHAR_WIDTH) - CHAR_WIDTH)], [screenY]:[screenYOffset + hangingOffset]"

				char.id = id

				screen += char

		clearText(id)
			for(var/obj/text/char in screen)
				if(char.id != id) continue

				screen -= char

				char.loc = null

		showHUD()
			var/element

			if(!args.len)
				CRASH("No arguments supplied to showHUD().")

			for(element in args)
				if(!(element in huds)) continue

				screen += huds[element]

		hideHUD()
			var/element

			if(!args.len)
				CRASH("No arguments supplied to hideHUD().")

			for(element in args)
				if(!(element in huds)) continue

				screen -= huds[element]

	verb
		resize(mode as num)
			set
				name = ".resize"
				hidden = TRUE

			switch(mode)
				if(1)
					winset(src, "default", "is-maximized=false;size=272x208")

				if(2)
					winset(src, "default", "is-maximized=false;size=544x416")

				if(3)
					winset(src, "default", "is-maximized=false;size=816x624")