extends Popup

#Ajustes de video
@onready var display_options = $TabContainer/Video/MarginContainer/ResolutionSettings/BtnPantalla
@onready var display_fps_btn = $TabContainer/Video/MarginContainer/ResolutionSettings/BtnFPS

#Ajustes de audio
@onready var master_slider = $TabContainer/Audio/MarginContainer/ResolutionSettings/MasterVolumeContainer/MasterSlider
@onready var music_slider = $TabContainer/Audio/MarginContainer/ResolutionSettings/MusicVolumeContainer/MusicSlider
@onready var sfx_slider = $TabContainer/Audio/MarginContainer/ResolutionSettings/SFXVolumeContainer/SFXSlider



func _ready():
	pass

#boton para salir
func _on_button_pressed():
	hide()

#funciones de video
func _on_btn_pantalla_item_selected(index):
	GlobalSettings.change_display_mode(index)

func _on_btn_fps_toggled(toggled_on):
	GlobalSettings.toggle_fps_display(toggled_on)

func _on_btn_vsync_toggled(toggled_on):
	GlobalSettings.change_vsync_mode(toggled_on)

func _on_master_slider_value_changed(value):
	GlobalSettings.update_master_vol(0, value)

func _on_music_slider_value_changed(value):
	GlobalSettings.update_master_vol(1, value)

func _on_sfx_slider_value_changed(value):
	GlobalSettings.update_master_vol(2, value)




