extends Node
class_name GameWorld

var score = 0 setget set_score, get_score
var score_text = "Score = %s"

onready var scoreLabel := $Score

func get_score():
	return score

# no matter where we call score, it runs this function:
func set_score(value):
	score = value
	scoreLabel.text = score_text % score

func _on_Enemy_score_up():
	# Have to add self as it might confuse itself since the setter could go into an infinite loop
	self.score += 10


func _on_Ship_player_death():
	# Can quickly create a timer with the first argument
	# Will yield until the "timeout" signal is emitted from the timer
	yield(get_tree().create_timer(1), "timeout")
	# we want to wait a second pretty much instead of just jumping into the game over screen, we want to see the explosions!
	get_tree().change_scene("res://GameOverScreen.tscn")
