extends Area2D

const Bullet = preload("res://Bullet.tscn")

export(int) var SPEED = 100
onready var sprite := $Sprite

func _ready():
	pass

func _process(delta):
#	if Input.is_action_pressed("ui_left"):
#		sprite.flip_h = true
#		position.x -= SPEED * delta
#	if Input.is_action_pressed("ui_right"):
#		sprite.flip_h = false
#		position.x += SPEED * delta
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
	iBullet.z_index = 0
	# setting the bullet's position (globally just in case it's attached to another scene) to the ship's global position 
	var ship_position = global_position
	iBullet.global_position = ship_position
