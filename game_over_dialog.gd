extends Panel


signal restart;



func _on_restart_pressed() -> void:
	restart.emit()
	#hidden before start by Game not by self


func _on_main_menu_pressed() -> void:
	Global.changeScene("res://main.tscn")

func _on_exit_pressed() -> void:
	Global.exit()