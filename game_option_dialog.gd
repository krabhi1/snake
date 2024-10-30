extends Panel

signal resume;
signal restart;
signal close;


func _on_main_menu_pressed() -> void:
	Global.changeScene("res://main.tscn")

func _on_exit_pressed() -> void:
	Global.exit()

func _on_close_pressed() -> void:
	close.emit()

func _on_resume_pressed() -> void:
	resume.emit()

func _on_restart_pressed() -> void:
	restart.emit()