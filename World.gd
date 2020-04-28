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
