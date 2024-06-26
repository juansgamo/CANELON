extends Node
signal fps_displayed(value)

#video
func change_display_mode(toggle):
	if toggle == 1:  # Modo pantalla completa
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif toggle == 0:  # Modo ventana
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func change_vsync_mode(toggle):
	if toggle == true:  
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	elif toggle == false:  
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func toggle_fps_display(toggle):
	emit_signal("fps_displayed",toggle)


#AUDIO

func update_master_vol(bus_idx: int, vol: float) -> void:
	if vol > -150.0:
		AudioServer.set_bus_volume_db(bus_idx, vol)
	else:
		AudioServer.set_bus_mute(bus_idx, true)

	match bus_idx:
		0:
			Save.game_data.master_vol = vol
			Save.save_data()
		1:
			Save.game_data.music_vol = vol
			Save.save_data()
		2:
			Save.game_data.sfx_vol = vol
			Save.save_data()


