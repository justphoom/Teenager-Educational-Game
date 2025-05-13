extends Node2D

var ballPreload = preload("res://mini-game-sport/sport_ball.tscn")
var ballObj

var totalAttempt : int
var currentAttemt : int
var currentScore : int

var hardMode : bool

func _ready() -> void:
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
	PlayerStatus.toMainroadFrom = "sport"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")

func showFinishButton():
	var moneyToEarn = 5 * self.currentScore
	if self.hardMode:
		moneyToEarn *= 2
	PlayerStatus.money += moneyToEarn
	$FinishButton.show()
