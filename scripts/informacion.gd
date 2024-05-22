extends Control


func _ready():
	$menufondo.play()



func _on_salir_pressed():
	$tap.play()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
