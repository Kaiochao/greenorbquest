client
	control_freak = CONTROL_FREAK_ALL

	pixel_y = -8

	proc
		/*
			The two procedures below use some pretty hacky stuff
			but I'm too pressed for time to bother setting up a
			proper screen handler.
		*/
		clearScreen()
			var/this

			if(args[1] == "CLEAR_ALL")
				for(this in screen)
					del this

			else
				for(this in args)
					screen -= huds[this]

		showHUD()
			for(var/this in args)
				screen += huds[this]

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