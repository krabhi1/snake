extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/HSlider.value=remap(Global.speed,2,10,0,100)
	pass # Replace with function body.




func _on_button_pressed() -> void:
	#hide
	visible = false
	pass # Replace with function body.


func _on_h_slider_value_changed(value:float) -> void:
	#value [0,100]
	var _speed=remap(value,0,100,2,10)
	Global.speed=_speed
	print("speed:",Global.speed)
	pass # Replace with function body.
