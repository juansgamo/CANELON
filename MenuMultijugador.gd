extends Control

# func _ready():
	# $menufondo.play()

func _on_volver_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://scenes/carreras.tscn")
