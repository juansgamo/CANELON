extends Area2D

signal death
signal scored

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * 300

func _on_body_entered(body):
	print("Accidente")
	death.emit() # Señal de muerte

func _on_scored_area_body_entered(body):
	scored.emit()
	pass # Replace with function body.
