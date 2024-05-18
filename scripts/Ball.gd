extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _draw() -> void:
	draw_circle(Vector2(0,0),5,Color(1,1,1,))

var isColliding = false
var direction = 1
var velocidad = 300

func _ready() -> void:
	linear_velocity.x = velocidad*direction
	
func _physics_process(delta: float)-> void:
	linear_velocity.x = velocidad*direction
	isColliding = false


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("PlayerPong") and not isColliding:
		print("entro")
		direction.x *= -1  # Invertir la dirección horizontal
		linear_velocity = direction * velocidad
		isColliding = true

