extends Area2D

signal death
signal scored

func _process(delta):
	position.x -= delta * 300
	
func _on_body_entered(_body):
	death.emit()

	
