extends Node2D

var speed1 = 0
var speed2 = 0
var acceleration = 10  # Ajusta esto según sea necesario
var car1_score = 0  # Contador para el primer auto
var car2_score = 0  # Contador para el segundo auto
var label1: Label
var label2: Label

func _ready():
	# Obtener las referencias a los labels
	label1 = $Label1
	label2 = $Label2

func finish():
	print("Game Over")
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _input(event):
	if event.is_action_pressed("ui_right"):
		speed1 += acceleration
		print("Speed1: ", speed1)  # Debug para ver la velocidad actual de Car1
	if event.is_action_pressed("ui_left"):
		speed2 += acceleration
		print("Speed2: ", speed2)  # Debug para ver la velocidad actual de Car2

func _process(delta):
	if speed1 > 0:
		$CAR1.position.x += speed1 * delta  # Modifica para ajustar la velocidad base
		if $CAR1.position.x > get_viewport_rect().end.x:
			$CAR1.position.x = 0
			car1_score += 1
			$Label1.text = "Rojo:  " + str(car1_score)
			if car1_score >= 5:
				finish()
	if speed2 > 0:
		$CAR2.position.x += speed2 * delta  # Modifica para ajustar la velocidad base
		if $CAR2.position.x > get_viewport_rect().end.x:
			$CAR2.position.x = 0
			car2_score += 1
			$Label2.text = "Verde: " + str(car2_score)
			if car2_score >= 5:
				finish()
