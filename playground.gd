extends Node2D

var direction=Vector2(1,0)
var cellSize=25

var _timerCount=0.0
func _ready() -> void:
	pass


func _process(delta: float) -> void:
	update_direction()
	_timerCount+=delta
	if _timerCount>=1.0/Global.speed:
		_timerCount=0
		# update_position()
		
	pass


func update_position():
	$Snake/Head.position+=direction*cellSize

func update_direction():
	if Input.is_action_just_pressed("snake_left") and direction!=Vector2(1,0):
		direction=Vector2(-1,0)
	elif Input.is_action_just_pressed("snake_right") and direction!=Vector2(-1,0):
		direction=Vector2(1,0)
	elif Input.is_action_just_pressed("snake_up") and direction!=Vector2(0,1):
		direction=Vector2(0,-1)
	elif Input.is_action_just_pressed("snake_down") and direction!=Vector2(0,-1):
		direction=Vector2(0,1)

func update_tail():
	pass
	
func move_to_cell(node: Node,x: int,y: int):
	node.position=Vector2(x*cellSize,y*cellSize)
	pass
