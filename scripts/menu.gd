extends Control

func _ready():
	$menufondo.play()

func _on_salir_pressed():
	get_tree().quit()

func _on_ajustes_pressed():
	get_tree().change_scene_to_file("res://ajustes.tscn")

func _on_modo_individual_pressed():
	pass # Replace with function body.

func _on_modo_multijugador_pressed():
	pass # Replace with function body.
