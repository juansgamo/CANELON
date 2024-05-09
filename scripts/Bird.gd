extends CharacterBody2D

const GRAVITY = 1000.0

func _ready():
	$AnimatedSprite2D.play("default")
	$"../fondo".play()
	
func _physics_process(delta):
	rotation = velocity.y/2000
	velocity.y += GRAVITY * delta

	if position.y > 1000 or position.y < -100:
		get_tree().call_deferred("reload_current_scene")
		get_tree().change_scene_to_file("res://muerte.tscn")
	move_and_slide()
	
func _input(event):
	if event.is_action_pressed("jump"):
		$"../JumpSound".play()
		velocity.y = -500   
	
	
