extends Node




func pause() -> void:
	pass
	
func resume() -> void:
	pass

func restart() -> void:
	
	pass




func _on_option_pressed() -> void:
	pause()
	$GameOptionDialog.visible = true
	pass # Replace with function body.


func _on_game_option_dialog_close() -> void:
	pass # Replace with function body.


func _on_game_option_dialog_restart() -> void:
	pass # Replace with function body.


func _on_game_option_dialog_resume() -> void:
	pass # Replace with function body.


func _on_game_over_dialog_restart() -> void:
	pass # Replace with function body.
