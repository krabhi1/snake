extends Node2D
#signal

signal gameover
signal food_eaten

#other
enum GameState {STANDING,RUNNING,PAUSED,GAMEOVER}
var direction=Vector2i(1,0)
var cellSize=25
var gameState=GameState.STANDING
var snake_segments: Array[Vector2i] =[]
var food_pos=Vector2i(0,0)
var ate_food=false
#node
@onready var SnakeNode=$Snake
#prefab
@onready var SnakeHeadScene=preload("res://prefab/snake_head.tscn")
@onready var SnakeSegmentScene=preload("res://prefab/snake_segment.tscn")
#extra
var _timerCount=0.0
func _ready() -> void:
	start()
	pass

func clear():
	#clear the snake segments
	snake_segments.clear()

	#remove all snake node
	for child in SnakeNode.get_children():
		child.queue_free()

func start():
	gameState=GameState.STANDING
	Global.setScore(0)
	clear()
	#food
	spawn_food()
	#random cell for snake
	var cell=Vector2i(randi_range(5,15),randi_range(5,15))
	snake_segments.append(cell)
	add_head(cell)
	#direction
	direction=Vector2i(1,0)

func _pause():
	gameState=GameState.PAUSED

func _resume():
	gameState=GameState.STANDING

func _restart():
	start()

func add_head(cell):
	var head=SnakeHeadScene.instantiate()
	head.position=cell*cellSize
	print(cell,head.position)
	SnakeNode.add_child(head)

func add_segment(cell):
	var segment=SnakeSegmentScene.instantiate()
	segment.position=cell*cellSize
	SnakeNode.add_child(segment)




func _process(delta: float) -> void:
	var isDirectionChanged=update_direction()
	if gameState==GameState.STANDING:
		standing()
		if isDirectionChanged:
			gameState=GameState.RUNNING

	elif gameState==GameState.RUNNING:
		running(delta)
		pass


func on_gameover():
	gameover.emit()
	pass

func standing():
	# $Snake/Head.position=direction*cellSize
	pass


func running(delta: float):
	_timerCount+=delta
	if _timerCount>=1.0/Global.speed:
		_timerCount=0
		update_snake()

func update_snake():
	var newHead=snake_segments[0]+direction

	#collision check
	if check_collision(newHead):
		gameState=GameState.GAMEOVER
		on_gameover()
		return

	var last_segment=snake_segments[snake_segments.size()-1]
	#update the segments
	for i in range(snake_segments.size()-1,0,-1):
		snake_segments[i]=snake_segments[i-1]
	#update the head
	snake_segments[0]=newHead
	#grow the snake
	if ate_food:
		snake_segments.append(last_segment)
		add_segment(last_segment)
		ate_food=false
	#update the node
	for i in range(snake_segments.size()):
		move_to_cell(SnakeNode.get_child(i),snake_segments[i].x,snake_segments[i].y)

	#handle eating food
	if newHead==food_pos:
		spawn_food()
		ate_food=true
		food_eaten.emit()

func spawn_food():
	food_pos=Vector2i(randi_range(0,19),randi_range(0,19))
	$Food.position=food_pos*cellSize

func check_collision(newHeadCell: Vector2i) -> bool:
	var  pos=newHeadCell*cellSize
	const width=500
	const height=500
	#with boundary
	if pos.x<0 or pos.x>=width or pos.y<0 or pos.y>=height:
		return true
	#with snake
	for i in range(1,snake_segments.size()):
		if snake_segments[i]==newHeadCell:
			return true
	return false

func update_direction() -> bool:
	if Input.is_action_just_pressed("snake_left") and direction!=Vector2i(1,0):
		direction=Vector2i(-1,0)
		return true
	elif Input.is_action_just_pressed("snake_right") and direction!=Vector2i(-1,0):
		direction=Vector2i(1,0)
		return true
	elif Input.is_action_just_pressed("snake_up") and direction!=Vector2i(0,1):
		direction=Vector2i(0,-1)
		return true
	elif Input.is_action_just_pressed("snake_down") and direction!=Vector2i(0,-1):
		direction=Vector2i(0,1)
		return true
	return false

func update_tail():
	pass

func move_to_cell(node: Node,x: int,y: int):
	node.position=Vector2(x*cellSize,y*cellSize)
	pass


func _on_game_pause() -> void:
	_pause()


func _on_game_restart() -> void:
	_restart()
	pass # Replace with function body.


func _on_game_resume() -> void:
	_resume()
	pass # Replace with function body.
