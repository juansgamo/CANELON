extends Popup

#Ajustes de video
@onready var display_options = $TabContainer/Video/MarginContainer/ResolutionSettings/BtnPantalla
@onready var display_fps_btn = $TabContainer/Video/MarginContainer/ResolutionSettings/BtnFPS
@onready var max_fps_slider = $TabContainer/Video/MarginContainer/ResolutionSettings/MaxFPScontainer/FPSSlider
@onready var max_fps_val = $TabContainer/Video/MarginContainer/ResolutionSettings/MaxFPScontainer/cantidadFPS
@onready var brightnes = $TabContainer/Video/MarginContainer/ResolutionSettings/BrilloContainer/BrSlider

#Ajustes de audio
@onready var master_slider = $TabContainer/Audio/MarginContainer/ResolutionSettings/MasterVolumeContainer/MasterSlider
@onready var music_slider = $TabContainer/Audio/MarginContainer/ResolutionSettings/MusicVolumeContainer/MusicSlider
@onready var sfx_slider = $TabContainer/Audio/MarginContainer/ResolutionSettings/SFXVolumeContainer/SFXSlider

#Ajustes del gameplay
@onready var mouse_slider = $TabContainer/Juego/MarginContainer/ResolutionSettings/MouseSensitivitycONTAINER/SenSlider
@onready var mouse_sens_amount = $TabContainer/Juego/MarginContainer/ResolutionSettings/MouseSensitivitycONTAINER/cantidadSensibilidad

func _ready():
	pass

#boton para salir
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

#funciones de video
func _on_btn_pantalla_item_selected(index):
	GlobalSettings.change_display_mode(index)

func _on_btn_fps_toggled(toggled_on):
	pass # Replace with function body.

func _on_fps_slider_value_changed(value):
	pass # Replace with function body.

func _on_br_slider_value_changed(value):
	pass # Replace with function body.


func _on_master_slider_value_changed(value):
	pass # Replace with function body.

func _on_music_slider_value_changed(value):
	pass # Replace with function body.

func _on_sfx_slider_value_changed(value):
	pass # Replace with function body.


func _on_sen_slider_value_changed(value):
	pass # Replace with function body.
