extends Area2D

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
	
	
