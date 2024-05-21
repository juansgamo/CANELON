extends RigidBody2D

var velocidad = 500
var direction = Vector2(1, 0)  # Dirección inicial hacia la derecha
var isColliding = false

# Factor de aumento de velocidad
var aumento_de_velocidad = 2

func _ready() -> void:
	linear_velocity = direction * velocidad

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("PlayerPong") and not isColliding:
		print("Colisión con jugador")
		direction.x *= -1  # Invertir la dirección horizontal
		velocidad *= aumento_de_velocidad  # Aumentar la velocidad
		linear_velocity = direction * velocidad
		isColliding = true
	elif not body.is_in_group("PlayerPong"):
		isColliding = false
