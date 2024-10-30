extends Panel

signal resume;
signal restart;
signal dialog_close;


func _on_main_menu_pressed() -> void:
	Global.changeScene("res://main.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	Global.exit()
	pass # Replace with function body.


func _on_close_pressed() -> void:
	dialog_close.emit()
	hide()
	pass # Replace with function body.


func _on_resume_pressed() -> void:
	resume.emit()
	hide()


func _on_restart_pressed() -> void:
	restart.emit()
	hide()
