extends CharacterBody2D

const GRAVITY = 700

func _physics_process(delta): # physic process(siempre va a 60fps)
	# se llama cada vez por frame
	# Delta son los ms que pasan entre frames
	rotation = velocity.y / 1000
	velocity.y += GRAVITY * delta
	
	if position.y > 560 or position.y < -100:
		get_tree().call_deferred("reload_current_scene")
	move_and_slide()

func _input(event): 
	if event.is_action_pressed("ui_right"):
		print("Acabas de saltar")
		velocity.y = -300
