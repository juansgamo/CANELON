extends Area2D

var velocidad = Vector2(500, 0)
var puntuacion_rojo = 0
var puntuacion_verde = 0
var label_rojo: Label
var label_verde: Label

var config_file: ConfigFile


func _process(delta):
	position += velocidad * delta

func _on_body_entered(body):
	if body.is_in_group("jugadores"):  # Asegúrate de que tus jugadores estén en el grupo "jugadores"
		velocidad *= 1.1
		$"../boing".play()
		# Añadir una rotación aleatoria para desviar un poco la dirección
		var desviacion_aleatoria = randf_range(-0.3, 0.3)  # Cambia el rango según necesites
		# Rotar la velocidad por un pequeño ángulo aleatorio
		velocidad = velocidad.rotated(desviacion_aleatoria)
		# Invertir la dirección en el eje x para simular el rebote
		velocidad.x = -velocidad.x
	elif body.is_in_group("rojo"):
		print("¡El jugador rojo ha ganado!")
		puntuacion_rojo += 1
		actualizar_puntuacion()
		# Salir al menú principal
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	elif body.is_in_group("verde"):
		print("¡El jugador verde ha ganado!")
		puntuacion_verde += 1
		actualizar_puntuacion()
		# Salir al menú principal
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	else:
		$"../boing".play()
		# Comportamiento por defecto para otras colisiones
		velocidad.y = -velocidad.y


func _ready():
	load_puntuacion()
	label_rojo = $"../Label"
	label_verde = $"../Label2"
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
	$"../Label".text = str(puntuacion_rojo)

func update_score_label2():
	$"../Label2".text = str(puntuacion_verde)
	
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

