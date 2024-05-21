extends Control

@onready var menu_multijugador = preload("res://scenes/menu_multijugador.tscn") as PackedScene
func _ready():
	$menufondo.play()

func _on_salir_pressed():
	get_tree().quit()

func _on_ajustes_pressed():
	$Ajustes.popup() 

#func _on_modo_multijugador_pressed():
	#var random_option = randi_range(0, 3)  # Genera un número aleatorio entre 0 y 1
#
	#if random_option == 0:
		#get_tree().change_scene_to_file("res://scenes/carreras.tscn")
	#elif random_option == 1:
		#get_tree().change_scene_to_file("res://scenes/world.tscn")
	#elif random_option == 1:
		#get_tree().change_scene_to_file("res://scenes/naves.tscn")
	#elif random_option == 1:
		#get_tree().change_scene_to_file("res://scenes/pong.tscn")
		

func _on_modo_multijugador_pressed():
	get_tree().change_scene_to_file("res://scenes/pong.tscn")
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
