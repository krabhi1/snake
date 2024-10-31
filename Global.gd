extends  Node

var speed=6; # 5 cells per second
var score=0;
var highscore=0;
const SCORE_CONST=10;


func changeScene(path: String) -> void:
	get_tree().change_scene_to_file(path)


#exit the game
func exit() -> void:
	get_tree().quit()
	

func setScore(newScore: int) -> void:
	score = newScore
	if score > highscore:
		highscore = score
		

func increaseScore() -> void:
	score += SCORE_CONST
	if score > highscore:
		highscore = score