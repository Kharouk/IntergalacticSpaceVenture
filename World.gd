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

func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)

func _on_Enemy_score_up():
	# Have to add self as it might confuse itself since the setter could go into an infinite loop
	self.score += 10


func _on_Ship_player_death():
	update_save_data()
	# Can quickly create a timer with the first argument
	# Will yield until the "timeout" signal is emitted from the timer
	yield(get_tree().create_timer(1), "timeout") # will break here to wait (like in other programming languages) -> waits a sec, oh got the timeout return, continue.
	# we want to wait a second pretty much instead of just jumping into the game over screen, we want to see the explosions!
	get_tree().change_scene("res://GameOverScreen.tscn")
