extends Control

func _ready() -> void:
	print("Speed in Main",Global.speed)

func _on_play_pressed() -> void:
	Global.changeScene("res://game.tscn")

func _on_difficulty_pressed() -> void:
	$DifficultyDialog.visible = true

func _on_exit_pressed() -> void:
	Global.exit()
