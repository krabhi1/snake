extends Node2D

var direction=Vector2(1,0)
var cellSize=25

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$head.position+=direction*delta*cellSize
	
	
	pass


func _on_timer_timeout() -> void:


	pass # Replace with function body.
