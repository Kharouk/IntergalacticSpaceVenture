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
		# to use the setter all we need to do is:
		# world.score += 10
		# we can remove the signal connect afterwards

func _process(delta):
	if world.get_score() >= 100:
		position.x -= (SPEED * 1.7) * delta
	if world.get_score() >= 50:
		position.x -= (SPEED * 1.5) * delta
	position.x -= SPEED * delta

func _on_Enemy_body_entered(body):
	body.create_hit_effect()
	body.queue_free()
	HEALTH -= 1

	if HEALTH <= 0:
		emit_signal("score_up")
		create_explosion()
		queue_free()

func _on_Visibiity_screen_exited():
	queue_free()
	
func create_explosion():
	# Gets main node:
	var main = get_tree().current_scene
	var explosion_effect = ExplosionEffect.instance()
	main.add_child(explosion_effect)
	# set the position of the explosion to the global position of the Enemy
	explosion_effect.global_position = global_position
	
