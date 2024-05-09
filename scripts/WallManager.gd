extends Node2D

const WALL = preload("res://wall.tscn")
const WALL2 = preload("res://wall2.tscn")
const WALL3 = preload("res://wall3.tscn")

var current_score = 0
var max_score=0
var max_scores = []
var max_score_count = 9
var spawning_wall = true
var spawning_wall2 = false
var spawning_wall3 = false

func _ready():
	var config = ConfigFile.new()
	var error = config.load("user://game_config.cfg")
	
	if error == OK:
		max_score = config.get_value("game_data", "max_score", 0)
		for i in range(max_score_count):
			var score = config.get_value("game_data", "max_score" + str(i), 0)
			max_scores.append(score)
	else:
		max_score = 0

	
	if max_score > 0:
		update_score_label2()

		
	if spawning_wall:
		spawn_wall()
	elif spawning_wall2:
		spawn_wall2()
	elif spawning_wall3:
		spawn_wall3()
		
func _on_timer_timeout():
	if spawning_wall:
		spawn_wall()
	elif spawning_wall2:
		spawn_wall2()
	elif spawning_wall3:
		spawn_wall3()

func spawn_wall():
	var this_wall = WALL.instantiate()
	this_wall.death.connect(death)
	this_wall.scored.connect(scored)
	add_child(this_wall)
	this_wall.position.y = randf_range(500,800)
	
func spawn_wall2():
	var this_wall = WALL2.instantiate()
	this_wall.death.connect(death)
	this_wall.scored.connect(scored)
	add_child(this_wall)
	this_wall.position.y = randf_range(500, 800)
	
func spawn_wall3():
	var this_wall = WALL3.instantiate()
	this_wall.death.connect(death)
	this_wall.scored.connect(scored)
	add_child(this_wall)
	this_wall.position.y = randf_range(500, 800)
	
func death():
	get_tree().call_deferred("reload_current_scene")
	get_tree().change_scene_to_file("res://muerte.tscn")
	
func scored():
	current_score += 1
	update_score_label()
	$"../PointSound".play()
	max_scored()
	
func update_score_label():
	$"../ScoreLabel".text = str(current_score)

func max_scored():
	if current_score > max_score:	
		max_score = current_score
		update_score_label2()

	# Actualizar las puntuaciones máximas si es necesario


	# Guardar las puntuaciones en el archivo de configuración
	var config = ConfigFile.new()
	config.set_value("game_data", "max_score", max_score)

	# Guardar solo los anteriores récords
	for i in range(1, max_score_count):
		config.set_value("game_data", "max_score" + str(i - 1), max_scores[i - 1])

	config.save("user://game_config.cfg")


func update_score_label2():
	$"../ScoreLabel2".text = str(max_score)

func update_max_scores():
	for i in range(1, max_score_count):
		if max_scores[i - 1] > max_scores[i]:
			var temp = max_scores[i]
			max_scores[i] = max_scores[i - 1]
			max_scores[i - 1] = temp

func _on_timer_2_timeout():
	spawning_wall = false
	spawning_wall2 = true
	spawning_wall3 = false

func _on_timer_3_timeout():
	# Cambia al spawn de wall3
	spawning_wall = false
	spawning_wall2 = false
	spawning_wall3 = true
