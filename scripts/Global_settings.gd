extends Node
signal fps_displayed(value)
signal brightness_updated(value)

#video
func change_display_mode(toggle):
	if toggle == 1:  # Modo pantalla completa
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif toggle == 0:  # Modo ventana
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func toggle_fps_display(toggle):
	emit_signal("fps_displayed",toggle)

func set_max_fps(value: int) -> void:
	if value < 500:
		Engine.time_scale = 1.0 / value
	else:
		Engine.time_scale = 0.0

func update_brightness(value):
	emit_signal("brightness_updated",value)

#AUDIO
#
#func update_master_vol(bus_idx: int, vol: float) -> void:
	#if vol > -50.0:
		#AudioServer.set_bus_volume_db(bus_idx, vol)
	#else:
		#AudioServer.set_bus_mute(bus_idx, true)
#
	#match bus_idx:
		#0
			#Save.game_data.master_vol = vol
			#Save.save_data()
		#1
			#Save.game_data.music_vol = vol
			#Save.save_data()
		#2
			#Save.game_data.sfx_vol = vol
			#Save.save_data()
#
#func update_mouse_sens(value: float) -> void:
	#emit_signal("mouse_sens_updated", value)
	#Save.game_data.mouse_sens = value
	#Save.save_data()


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
