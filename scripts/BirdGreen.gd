extends CharacterBody2D
var puntuacion_rojo = 0
var puntuacion_verde = 0
const GRAVITY = 700
var config_file: ConfigFile

func _ready():
	config_file = ConfigFile.new()  
	var error = config_file.load("C:/Users/Mario/AppData/Roaming/Godot/app_userdata/CANELON/game_result.cfg")
	if error != OK:
		print("Error loading score file:", error)
	else:
		puntuacion_rojo = config_file.get_value("game_data", "puntuacion_rojo", 0)
		puntuacion_verde = config_file.get_value("game_data", "puntuacion_verde", 0)


func _physics_process(delta): # physic process(siempre va a 60fps)
	# se llama cada vez por frame
	# Delta son los ms que pasan entre frames
	rotation = velocity.y / 1000
	velocity.y += GRAVITY * delta
	
	if position.y > 1160 or position.y < 520:
		puntuacion_rojo += 1
		actualizar_puntuacion()
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	move_and_slide()

func _input(event): 
	if event.is_action_pressed("ui_a") or event.is_action_pressed("ui_d"):
		print("Acabas de saltar")
		velocity.y = -300
		$"../AudioStreamPlayer2".play()
		
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
