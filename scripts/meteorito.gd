extends Area2D

signal meteorito_colisiona

var speed = 150  # Velocidad de caída del meteorito

func _physics_process(delta):
	position.y += speed * delta  # Mover hacia abajo verticalmente

func _ready():
	$CollisionShape2D/AnimatedSprite2D.play("default")

func _on_body_entered(_body):
	meteorito_colisiona.emit()
	print("Meteorito colisionó")
