extends Area2D

var velocidad = Vector2(500, 0)

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
		# Salir al menú si toca el área roja
		print("¡Has perdido! Volviendo al menú...")
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	elif body.is_in_group("verde"):
		# Salir al menú si toca el área verde
		print("¡Has perdido! Volviendo al menú...")
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	else:
		$"../boing".play()
		# Comportamiento por defecto para otras colisiones
		velocidad.y = -velocidad.y
