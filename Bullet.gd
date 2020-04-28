extends RigidBody2D

func _ready():
	var world = get_tree().current_scene
	pass


func _on_Visibility_screen_exited():
	queue_free()
