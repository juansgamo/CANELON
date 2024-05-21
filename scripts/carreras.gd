extends Node2D

var speedRojo = 0
var speedVerde = 0
var acceleration = 10  # Ajusta esto según sea necesario
var car1_score = 0  # Contador para el primer auto
var car2_score = 0  # Contador para el segundo auto
var label1: Label
var label2: Label
var puntuacion_rojo = 0
var puntuacion_verde = 0


var config_file: ConfigFile

func _ready():
	# Obtener las referencias a los labels
	load_puntuacion()
	label1 = $Label1
	label2 = $Label2
	config_file = ConfigFile.new()  
	var error = config_file.load("C:/Users/Mario/AppData/Roaming/Godot/app_userdata/CANELON/game_result.cfg")
	if error != OK:
		print("Error loading score file:", error)
	else:
		puntuacion_rojo = config_file.get_value("game_data", "puntuacion_rojo", 0)
		puntuacion_verde = config_file.get_value("game_data", "puntuacion_verde", 0)

		update_score_label1()
		update_score_label2()

func update_score_label1():
	$Label1.text = str(puntuacion_rojo)

func update_score_label2():
	$Label2.text = str(puntuacion_verde)

func _input(event):
	if event.is_action_pressed("ui_right"):
		speedRojo += acceleration
		print("speedRojo: ", speedRojo)  # Debug para ver la velocidad actual de Car1
	if event.is_action_pressed("ui_left"):
		speedVerde += acceleration
		print("speedVerde: ", speedVerde)  # Debug para ver la velocidad actual de Car2

func _process(delta):
	if speedRojo > 0:
		$CAR1.position.x += speedRojo * delta  # Modifica para ajustar la velocidad base
		if $CAR1.position.x > get_viewport_rect().end.x:
			$CAR1.position.x = 0
			car1_score += 1
			$Label1.text = "Rojo:  " + str(car1_score)
			if car1_score >= 5:
				puntuacion_rojo += 1
				actualizar_puntuacion()
				# Salir al menú principal
				get_tree().change_scene_to_file("res://scenes/menu.tscn")
	if speedVerde > 0:
		$CAR2.position.x += speedVerde * delta  # Modifica para ajustar la velocidad base
		if $CAR2.position.x > get_viewport_rect().end.x:
			$CAR2.position.x = 0
			car2_score += 1
			$Label2.text = "Verde: " + str(car2_score)
			if car2_score >= 5:
				puntuacion_verde += 1
				actualizar_puntuacion()
				# Salir al menú principal
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
