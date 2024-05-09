extends Control

# func _ready():
	# $menufondo.play()

func _on_volver_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_jugar_pressed():
	var random_option = randi_range(0, 1)  # Genera un número aleatorio entre 0 y 1

	if random_option == 0:
		get_tree().change_scene_to_file("res://scenes/carreras.tscn")
	elif random_option == 1:
		get_tree().change_scene_to_file("res://scenes/world.tscn")

#func _on_jugar_pressed():
	#get_tree().change_scene_to_file("res://scenes/world.tscn")
