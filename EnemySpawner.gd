extends Node2D

const Enemy = preload("res://Enemy.tscn")

onready var spawnPoints = $SpawnPoints
onready var timer = $Timer
var world = null

func get_spawn_position():
	var points = spawnPoints.get_children()
	# shuffles up the SPAWN POINTS: 
	points.shuffle()
	# returns a random spawn point's position globally (rather than in scene)
	return points[0].global_position
	
func spawn_enemy():
	var spawn_position = get_spawn_position()
	var enemy = Enemy.instance()
	# Our "World scene":
	world = get_tree().current_scene
	world.add_child(enemy)
	enemy.global_position = spawn_position

func _on_Timer_timeout():
	world = get_tree().current_scene
	
	if world.is_in_group("GameWorld"):
		if world.get_score() >= 150:
			timer.wait_time = 0.4
		elif world.get_score() >= 100:
			timer.wait_time = 1
	spawn_enemy()
	
