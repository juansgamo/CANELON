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
	hide()

#funciones de video
func _on_btn_pantalla_item_selected(index):
	GlobalSettings.change_display_mode(index)

func _on_btn_fps_toggled(toggled_on):
	GlobalSettings.toggle_fps_display(toggled_on)

func _on_btn_vsync_toggled(toggled_on):
	GlobalSettings.change_vsync_mode(toggled_on)

func _on_fps_slider_value_changed(value):
	GlobalSettings.set_max_fps(value)
	max_fps_val.text = str(value) if value < max_fps_slider.max_value else "Max"

func _on_br_slider_value_changed(value):
	GlobalSettings.update_brightness(value)
#para subir o bajar el brillo hay que crear un worldEnviroment y añadir lo siguiente
#func _ready():
	#GlobalSettings.brightness_updated.connect(self._on_brightness_updated)
#func _on_brightness_updated(value):
	#Environment.adjustment_brightness = value

func _on_master_slider_value_changed(value):
	GlobalSettings.update_master_vol(0, value)

func _on_music_slider_value_changed(value):
	GlobalSettings.update_master_vol(1, value)

func _on_sfx_slider_value_changed(value):
	GlobalSettings.update_master_vol(2, value)


func _on_sen_slider_value_changed(value):
	GlobalSettings.update_mouse_sens(value)
	mouse_sens_amount.text = value as String



