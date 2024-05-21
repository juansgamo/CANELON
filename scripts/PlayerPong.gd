extends CharacterBody2D

var velocidad = 1000.0
var direccion = Vector2.ZERO

func _physics_process(delta):
	direccion.y = Input.get_action_strength("ui_d") - Input.get_action_strength("ui_a")
	var movimiento = direccion * velocidad * delta
	move_and_collide(movimiento)


func _on_rigid_body_2d_body_entered(_body):
	pass # Replace with function body.
	print("Colisión con jugador")

