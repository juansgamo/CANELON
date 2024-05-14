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
	this_wall.death.connect(self._on_wall_death)  # Conecta la señal de muerte
	add_child(this_wall)
	this_wall.position.y = randf_range(-500, 500)

func _on_wall_death():
	print("Muerte")
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


