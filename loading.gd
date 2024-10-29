extends Control

var progress=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	setProgress(progress)
	progress+=1
	pass

func setProgress(percentage:float):
	#constrain b/w 0 to 300
	percentage=clamp(percentage,0,100)
	var max_size=$ProgressBar.size.x
	var width=max_size*percentage/100
	$ProgressBar/Bar.size.x=width
	
