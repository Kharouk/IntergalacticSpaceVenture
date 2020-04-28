extends RigidBody2D

const HitEffect = preload("res://HitEffect.tscn")

onready var bulletSound = $BulletSound

func _ready():
	bulletSound.play()

func _on_Visibility_screen_exited():
	queue_free()

func create_hit_effect() -> void:
	var world = get_tree().current_scene
	var hit_effect = HitEffect.instance()
	world.add_child(hit_effect)
	hit_effect.global_position = global_position
