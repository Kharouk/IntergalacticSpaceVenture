extends Area2D

const Bullet = preload("res://Bullet.tscn")
const ExplosionEffect = preload("res://ExplosionEffect.tscn")

export(int) var SPEED = 100
onready var sprite := $Sprite

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_just_pressed("ui_shoot"):
		fire_bullet()
	
func fire_bullet():
	var iBullet = Bullet.instance()
	
	# To get the main root node (World):
	var main = get_tree().current_scene
	main.add_child(iBullet)
	
	# so that it's below the ship:
	iBullet.z_index = 0
	
	# setting the bullet's position (globally just in case it's attached to another scene) to the ship's global position 
	var ship_position = global_position
	iBullet.global_position = ship_position

func _exit_tree():
	var main = get_tree().current_scene
	var explosition_effect = ExplosionEffect.instance()
	main.add_child(explosition_effect)
	explosition_effect.global_position = global_position

func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()
