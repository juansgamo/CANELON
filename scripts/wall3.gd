extends Area2D

signal death
signal scored

func _process(delta):
	position.x -= delta * 300
	
func _on_body_entered(body):
	death.emit()

func _ready():
	$CollisionShape2D5/Kame.play("default")
	$CollisionShape2D6/Kame1.play("default")

func _on_scored_area_body_entered(body):
	scored.emit()
	$ScoredArea2/Esfera.hide()
	

