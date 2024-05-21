extends Node

const SAVEFILE = "user://SAVEFILE.save"

var game_data = {}

func _ready() -> void:
	load_data()

func load_data() -> void:
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if not file:
		game_data = {
			"full_screen_on": false,
			"vsync_on": false,
			"display_fps": false,
			"max_fps": 0,
			"master_vol": -10,
			"music_vol": -10,
			"sfx_vol": -10,
		}
		save_data()
	else:
		game_data = file.get_var()
		file.close()

func save_data() -> void:
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	if file:
		file.store_var(game_data)
		file.close()
