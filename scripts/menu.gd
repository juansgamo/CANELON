extends Control

@onready var menu_multijugador = preload("res://scenes/menu_multijugador.tscn") as PackedScene
func _ready():
	$menufondo.play()
	#habria que poner estas funciones en el kinematicBody para que funcione el sens del mouse
	#GlobalSettings.mouse_sens_updated.connect(self._on_mouse_sens_updated)
#
#func _on_mouse_sens_updated(value):
	#mouse_sensitivity = value

func _on_salir_pressed():
	get_tree().quit()

func _on_ajustes_pressed():
	$Ajustes.popup() 

#func _on_modo_multijugador_pressed():
	#var random_option = randi_range(0, 1)  # Genera un número aleatorio entre 0 y 1
#
	#if random_option == 0:
		#get_tree().change_scene_to_file("res://scenes/carreras.tscn")
	#elif random_option == 1:
		#get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_modo_multijugador_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
