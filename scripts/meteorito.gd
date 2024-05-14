extends Area2D

var speed = 100  # Velocidad de caída del meteorito

func _physics_process(delta):
	position.y += speed * delta  # Mover hacia abajo verticalmente

func _on_Meteorito_body_entered(body):
	# Aquí puedes agregar la lógica para manejar colisiones con otros objetos
	# Por ejemplo, si el meteorito colisiona con el jugador, puedes restarle vida
	# Si colisiona con el suelo, puede causar algún efecto de impacto
	# En este ejemplo, simplemente eliminamos el meteorito al colisionar con cualquier objeto
	queue_free()

func _ready():
	$AnimatedSprite2D.play("default")
