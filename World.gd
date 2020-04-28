extends Node
class_name GameWorld

var score = 0 setget set_score
var score_text = "Score = %s"

onready var scoreLabel := $Score

# no matter where we call score, it runs this function:
func set_score(value):
	score = value
	scoreLabel.text = score_text % score

func _on_Enemy_score_up():
	self.score += 10
