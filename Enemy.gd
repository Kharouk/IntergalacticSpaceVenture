extends Area2D

const ExplosionEffect = preload("res://ExplosionEffect.tscn")

export(int) var SPEED = 20
export(int) var HEALTH = 3
var world = null
signal score_up

func _ready():
	world = get_tree().current_scene 
	if world.is_in_group("GameWorld"): # could also search based on classname or using load()
		connect("score_up", world, "_on_Enemy_score_up")

func _process(delta):
	if world.get_score() >= 50:
		position.x -= (SPEED * 2) * delta
	position.x -= SPEED * delta

func _on_Enemy_body_entered(body):
	body.queue_free()
	HEALTH -= 1
	if HEALTH <= 0:
		emit_signal("score_up")
		queue_free()

func _on_Visibiity_screen_exited():
	queue_free()

# This built in function runs when enemy node leaves the scene
func _exit_tree():
	# Gets main node:
	var main = get_tree().current_scene
	var explosion_effect = ExplosionEffect.instance()
	main.add_child(explosion_effect)
	# set the position of the explosion to the global position of the Enemy
	explosion_effect.global_position = global_position
	
