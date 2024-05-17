extends Area2D

signal death

func _process(delta):
	position.x -= delta * 300
	
func _on_body_entered(body):
	death.emit()
