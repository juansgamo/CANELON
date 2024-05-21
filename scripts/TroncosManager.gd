extends Node2D

const WALL = preload("res://scenes/troncos.tscn")
var points = 0

func _ready():
	spawn_wall()

func _on_timer_timeout():
	spawn_wall()

func spawn_wall():
	var this_wall = WALL.instantiate()
	this_wall.death.connect(death)
	this_wall.scored.connect(score)
	add_child(this_wall)
	this_wall.position.y = randf_range(-150, 150)

func death():
	print("Muerte")
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
func score():
	$"../AudioStreamPlayer".play()
	points += 1
	update_score_label()
	print("score")

func update_score_label():
	$"../scoreLabel".text = str(points)
