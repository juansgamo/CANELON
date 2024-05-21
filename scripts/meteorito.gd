extends Area2D
var puntuacion_rojo = 0
var puntuacion_verde = 0
var config_file: ConfigFile
var speed = 100  # Velocidad de caída del meteorito

func _physics_process(delta):
	position.y += speed * delta  # Mover hacia abajo verticalmente

func _ready():
	$CollisionShape2D/AnimatedSprite2D.play("default")
	config_file = ConfigFile.new()  
	var error = config_file.load("C:/Users/Mario/AppData/Roaming/Godot/app_userdata/CANELON/game_result.cfg")
	if error != OK:
		print("Error loading score file:", error)
	else:
		puntuacion_rojo = config_file.get_value("game_data", "puntuacion_rojo", 0)
		puntuacion_verde = config_file.get_value("game_data", "puntuacion_verde", 0)

func _on_body_entered(body):
	if body.is_in_group("rojo"):  # Asegúrate de que tus jugadores estén en el grupo "jugadores"
		print("Meteorito rojo colisionó")
		puntuacion_verde += 1
		actualizar_puntuacion()
		# Salir al menú principal
		salir()
	else:
		body.is_in_group("verde")
		print("Meteorito verde colisionó")
		puntuacion_rojo += 1
		actualizar_puntuacion()
		# Salir al menú principal
		salir()


func salir():
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


func _on_timer_timeout():
	speed += 200
	print("Velocidad incrementada a: ", speed)
