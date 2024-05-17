extends Area2D

signal meteorito_colisiona

var speed = 150  # Velocidad de caída del meteorito

func _physics_process(delta):
	position.y += speed * delta  # Mover hacia abajo verticalmente

func _ready():
	$AnimatedSprite2D.play("default")

func _on_body_entered(body):
	if body.name == "o_rojo" or body.name == "o_verde":
		meteorito_colisiona.emit() # Emite la señal con el objeto colisionado
	queue_free()
