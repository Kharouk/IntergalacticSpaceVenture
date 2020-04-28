extends Area2D

const ExplosionEffect = preload("res://ExplosionEffect.tscn")

export(int) var SPEED = 20
export(int) var HEALTH = 3

func _process(delta):
	position.x -= SPEED * delta


func _on_Enemy_body_entered(body):
	body.queue_free()
	HEALTH -= 1
	if HEALTH <= 0:
		queue_free()

func _on_Visibiity_screen_exited():
	queue_free()
