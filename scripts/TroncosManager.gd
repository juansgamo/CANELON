extends Node2D

const WALL = preload("res://scenes/troncos.tscn")

var puntuacion_rojo = 0
var puntuacion_verde = 0
var config_file: ConfigFile

func _ready():
	spawn_wall()
	config_file = ConfigFile.new()  
	var error = config_file.load("C:/Users/Mario/AppData/Roaming/Godot/app_userdata/CANELON/game_result.cfg")
	if error != OK:
		print("Error loading score file:", error)
	else:
		puntuacion_rojo = config_file.get_value("game_data", "puntuacion_rojo", 0)
		puntuacion_verde = config_file.get_value("game_data", "puntuacion_verde", 0)

func _on_timer_timeout():
	spawn_wall()

func spawn_wall():
	var this_wall = WALL.instantiate()
	this_wall.scored.connect(score)
	add_child(this_wall)
	this_wall.position.y = randf_range(-150, 150)
	this_wall.body_entered.connect(self._on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("rojo"):  # Asegúrate de que tus jugadores estén en el grupo "rojo"
		print("Meteorito rojo colisionó")
		puntuacion_rojo += 1
		actualizar_puntuacion()
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	elif body.is_in_group("verde"):  # Asegúrate de que tus jugadores estén en el grupo "verde"
		print("Meteorito verde colisionó")
		puntuacion_verde += 1
		actualizar_puntuacion()
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

func actualizar_puntuacion():
	# Actualizar el archivo de configuración con la puntuación actual
	var config = ConfigFile.new()
	config.set_value("game_data", "puntuacion_rojo", puntuacion_rojo)
	config.set_value("game_data", "puntuacion_verde", puntuacion_verde)
	config.save("user://game_result.cfg")

func load_puntuacion():
	# Cargar la puntuación desde el archivo de configuración
	var config = ConfigFile.new()
	if config.load("user://game_result.cfg") == OK:
		puntuacion_rojo = config.get_value("game_data", "puntuacion_rojo", 0)
		puntuacion_verde = config.get_value("game_data", "puntuacion_verde", 0)

func score():
	$"../AudioStreamPlayer".play()
	print("score")
