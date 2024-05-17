extends CharacterBody2D

var velocidad = 1000.0
var direccion = Vector2.ZERO

func _physics_process(delta):
	direccion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var movimiento = direccion * velocidad * delta
	move_and_collide(movimiento)
