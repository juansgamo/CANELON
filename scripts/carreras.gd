extends Node2D

var speed1 = 0
var speed2 = 0

func _input(event):
	if Input.is_action_pressed("ui_right"):
		speed1 += 1
		print("Speed2: ", speed1)  # Debug to view current speed
	if Input.is_action_pressed("ui_left"):
		speed2 += 1
		print("Speed2: ", speed2)  # Debug to view current speed

func _process(delta):
	if speed1 > 0:
		$Car1.position.x += speed1 * delta * 10  # Modify to adjust base speed
		if $Car1.position.x > get_viewport_rect().end.x:
			$Car1.position.x = 0  # Reset position when reaching the screen end
			speed1 = 0
	if speed2 > 0:
		$Car2.position.x += speed2 * delta * 10  # Modify to adjust base speed
		if $Car2.position.x > get_viewport_rect().end.x:
			$Car2.position.x = 0  # Reset position when reaching the screen end
			speed2 = 0
