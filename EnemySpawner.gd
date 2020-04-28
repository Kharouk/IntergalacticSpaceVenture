extends Node2D

const Enemy = preload("res://Enemy.tscn")

onready var spawnPoints = $SpawnPoints

func _ready():
	get_spawn_position()

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
	var main = get_tree().current_scene
	print(main)
	main.add_child(enemy)
	enemy.global_position = spawn_position
	

func _on_Timer_timeout():
	spawn_enemy()
	
