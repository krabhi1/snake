extends Control

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$ProgressBar.value+=5
	Global.speed+=1
	print("Speed: ",Global.speed)
	pass

# func setProgress(percentage:float):
# 	#constrain b/w 0 to 300
# 	percentage=clamp(percentage,0,100)
# 	var max_size=$ProgressBar.size.x
# 	var width=max_size*percentage/100
# 	$ProgressBar/Bar.size.x=width
	


func _on_progress_bar_value_changed(value:float) -> void:
	print("Value changed to: ",value)
	if value==100:
		#TODO: wait for 1 sec
		#goto next scene
		Global.changeScene("res://main.tscn")
	pass # Replace with function body.
