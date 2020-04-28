extends Node
class_name GameWorld

var score = 0
var score_text = "Score = %s"
onready var scoreLabel := $Score

func _on_Enemy_score_up():
	score += 10
	scoreLabel.text = score_text % score
