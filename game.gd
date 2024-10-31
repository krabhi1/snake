extends Node

signal pause;
signal resume;
signal restart;

@onready var scoreLabel=$UI/Header/HBoxContainer/score

func _set_score_label(score:int) -> void:
	scoreLabel.text = "score: "+str(score)
	pass

func _ready() -> void:
	_set_score_label(Global.score)

func _pause() -> void:
	pause.emit()
	$GameOptionDialog.visible = true
	pass
	
func _resume() -> void:
	resume.emit()
	$GameOptionDialog.visible = false
	pass

func _restart() -> void:
	restart.emit()
	$GameOptionDialog.visible = false
	$GameOverDialog.visible = false
	_set_score_label(0)
	pass

func _on_option_pressed() -> void:
	_pause()

func _on_game_option_dialog_close() -> void:
	_resume()

func _on_game_option_dialog_restart() -> void:
	_restart()

func _on_game_option_dialog_resume() -> void:
	_resume()

func _on_game_over_dialog_restart() -> void:
	_restart()

func _on_playground_gameover() -> void:
	$GameOverDialog.visible = true


func _on_playground_food_eaten() -> void:
	Global.increaseScore()
	print("score: ", Global.score)
	_set_score_label(Global.score)
