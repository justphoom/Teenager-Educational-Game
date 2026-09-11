extends Node2D

var ballPreload = preload("res://mini-game-sport/sport_ball.tscn")
var ballObj

var totalAttempt : int
var currentAttemt : int
var currentScore : int

var hardMode : bool

@onready var bgmSound = $BGM
func playBGM():
	bgmSound.play()
func _on_bgm_finished():
	self.playBGM()

func _ready() -> void:
	self.playBGM()
	PlayerStatus.doSportActivity()
	PlayerStatus.doActivity()
	$FinishButton.hide()
	hardMode = MiniGameController.isHardMode
	currentAttemt = 0
	currentScore = 0
	totalAttempt = 5
	self.initNextBall()
	
func _process(delta: float) -> void:
	pass

func initNextBall():
	ballObj = ballPreload.instantiate()
	add_child(ballObj)

func _on_interact_button_pressed() -> void:
	if Tutorial.is_tutorial_state:
		PlayerStatus.PREV_SCENE = "sport"
		ScenceTransition.change_scene("res://tutorial-scenes/day-3/tutorial_day_3_mainroad_3.tscn")
	else:
		Global.day_time_update()
		PlayerStatus.PREV_SCENE = "sport"
		ScenceTransition.change_scene("res://main-game-scenes/mainroad.tscn")

func showFinishButton():
	var moneyToEarn = 5 * self.currentScore
	if self.hardMode:
		moneyToEarn *= 2
	PlayerStatus.money += moneyToEarn
	$FinishButton.show()
