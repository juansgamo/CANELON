extends Control

@onready var menu_multijugador = preload("res://scenes/menu_multijugador.tscn") as PackedScene
func _ready():
	$menufondo.play()

func _on_salir_pressed():
	get_tree().quit()

func _on_ajustes_pressed():
	$Ajustes.popup() 

func _on_modo_individual_pressed():
	pass # Replace with function body.

func _on_modo_multijugador_pressed():
	get_tree().change_scene_to_packed(menu_multijugador)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
