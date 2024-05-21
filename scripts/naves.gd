extends Node2D

func _ready():
	$"../fondo".play()
var speed1 = 200
var speed2 = 200

var o1_score = 0  # Contador para la nave roja
var o2_score = 0  # Contador para la nave verde

var is_o1_stopped = false
var is_o2_stopped = false

var last_speed1 = 200  # Para almacenar la última velocidad antes de detenerse
var last_speed2 = -200

var meteorito_scene = preload("res://scenes/meteorito.tscn")
var meteorito_spawn_timer = 0
var meteorito_spawn_interval = 2  # Intervalo de tiempo entre la aparición de meteoritos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Mover las naves horizontalmente
	$"../o_rojo".position.x += speed1 * delta
	$"../o_verde".position.x += speed2 * delta

	# Detener y cambiar dirección de la nave roja cuando llegue al borde izquierdo
	if $"../o_rojo".position.x <= 0:
		speed1 = abs(last_speed1)  # Cambiar dirección
		is_o1_stopped = false

	# Detener y cambiar dirección de la nave verde cuando llegue al borde derecho
	if $"../o_verde".position.x >= get_viewport_rect().size.x:
		speed2 = -abs(last_speed2)  # Cambiar dirección
		is_o2_stopped = false

	# Detener la nave roja cuando llegue a la mitad de la pantalla
	if $"../o_rojo".position.x >= get_viewport_rect().size.x / 2:
		speed1 = speed1 * -1

	# Detener la nave verde cuando llegue a la mitad de la pantalla
	if $"../o_verde".position.x <= get_viewport_rect().size.x / 2:
		speed2 = speed2 * -1

	# Cambiar la dirección de la nave roja cuando esté detenida
	if is_o1_stopped:
		is_o1_stopped = false

	# Cambiar la dirección de la nave verde cuando esté detenida
	if is_o2_stopped:
		is_o2_stopped = false

	# Generar meteoritos
	_generate_meteoritos(delta)

func _generate_meteoritos(delta):
	# Actualizar el temporizador para la aparición de meteoritos
	meteorito_spawn_timer += delta
	if meteorito_spawn_timer >= meteorito_spawn_interval:
		# Instanciar un nuevo meteorito
		var meteorito_instance = meteorito_scene.instantiate()
		
		# Configurar la posición inicial del meteorito
		meteorito_instance.position.x = randf_range(0, get_viewport_rect().size.x)
		meteorito_instance.position.y = 0
		
		# Agregar el meteorito a la escena
		add_child(meteorito_instance)
		
		# Reiniciar el temporizador de aparición
		meteorito_spawn_timer = 0

func _input(event):
	if event.is_action_pressed("ui_a") :
		last_speed1 = speed1
		speed1 = 0
		print("Speed1: ", speed1)  # Debug para ver la velocidad actual de la nave roja
		is_o1_stopped = true
	elif event.is_action_released("ui_a"):  # Captura el evento de liberación de tecla
		speed1 = -last_speed1    # Restaura la velocidad original de la nave roja

	if event.is_action_pressed("ui_left"):
		last_speed2 = speed2
		speed2 = 0
		print("Speed2: ", speed2)  # Debug para ver la velocidad actual de la nave verde
		is_o2_stopped = true
	elif event.is_action_released("ui_left"):  # Captura el evento de liberación de tecla
		speed2 = -last_speed2    # Restaura la velocidad original de la nave verde




func _on_timer_timeout():
	if meteorito_spawn_interval > 0.25 :
		meteorito_spawn_interval = meteorito_spawn_interval - 0.25
	
	
