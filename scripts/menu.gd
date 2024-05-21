extends Control

var puntuacion_rojo = 0  
var puntuacion_verde = 0

var label_rojo: Label
var label_verde: Label


@onready var menu_multijugador = preload("res://scenes/menu_multijugador.tscn") as PackedScene
var config_file: ConfigFile

func _ready():
	load_puntuacion()
	$menufondo.play()
	label_rojo = $Label2
	label_verde = $Label3
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
	$Label2.text = str(puntuacion_rojo)

func update_score_label2():
	$Label3.text = str(puntuacion_verde)

func _on_salir_pressed():
	get_tree().quit()

func _on_ajustes_pressed():
	$Ajustes.popup() 

#func _on_modo_multijugador_pressed():
	#var random_option = randi_range(0, 3)  # Genera un número aleatorio entre 0 y 1
#
	#if random_option == 0:
		#get_tree().change_scene_to_file("res://scenes/carreras.tscn")
	#elif random_option == 1:
		#get_tree().change_scene_to_file("res://scenes/world.tscn")
	#elif random_option == 1:
		#get_tree().change_scene_to_file("res://scenes/naves.tscn")
	#elif random_option == 1:
		#get_tree().change_scene_to_file("res://scenes/pong.tscn")
		

func _on_modo_multijugador_pressed():
	get_tree().change_scene_to_file("res://scenes/carreras.tscn")
	
func _on_button_pressed():
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

func _on_reinicar_pun_pressed():
	puntuacion_rojo = 0
	puntuacion_verde = 0
	actualizar_puntuacion()
	update_score_label1()
	update_score_label2()
	print("reiniciar")
