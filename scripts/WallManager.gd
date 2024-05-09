extends Node2D

const WALL = preload("res://scenes/wall.tscn")
var spawning_wall = true

func _ready():
	if spawning_wall:
		spawn_wall()

func _on_timer_timeout():
	if spawning_wall:
		spawn_wall()

func spawn_wall():
	var this_wall = WALL.instantiate()
	this_wall.death.connect(death)
	add_child(this_wall)
	this_wall.position.y = randf_range(100,800)

func death():
	print("Muerte")
	get_tree().call_deferred("reload_current_scene")
	get_tree().change_scene_to_file("res://scenes/menu_multijugador.tscn")
