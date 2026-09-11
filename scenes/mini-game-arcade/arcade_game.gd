extends Node2D

var enemyPrefab = preload("res://mini-game-arcade/arcade_enemy.tscn")
var playerPosition : Vector2
var enemyObj
var isFinishGame : bool
var INTERVEAL = 20
var spawnTimer = 0.0

var playerHealth : int
var hardMode : bool
var gameIsDone : bool

var score : int

var changeToYellow : bool
var changeToRed : bool
var changeToBlack : bool

@onready var bgmSound = $BGM
func playBGM():
	bgmSound.play()
func _on_bgm_finished():
	self.playBGM()

func _ready() -> void:
	self.playBGM()
	changeToYellow = true
	changeToRed = true
	changeToBlack = true
	PlayerStatus.doArcadeActivity()
	PlayerStatus.doActivity()
	$FinishButton.hide()
	#$Player/Joystick/Interact.hide()
	$Player/Joystick/Stats.hide()
	$Player/GlowingSpot_Player.setType(3)
	$Player.setGlowingOn()
	isFinishGame = false
	playerHealth = 5
	self.score = 0
	gameIsDone = false
	hardMode = MiniGameController.isHardMode
	enemyObj = enemyPrefab.instantiate()
	add_child(enemyObj)

func _process(delta):
	playerPosition = $Player.position
	if playerHealth == 3 and changeToYellow:
		changeToYellow = false
		$Player/GlowingSpot_Player.setType(2)
	if playerHealth == 1 and changeToRed:
		changeToRed = false
		$Player/GlowingSpot_Player.setType(1)
	if playerHealth == 0 and gameIsDone and changeToBlack:
		changeToBlack = false
		$Player/GlowingSpot_Player.setType(0)
		isFinishGame = true
		self.showFinishButton()
		gameIsDone = false
	if 	!isFinishGame:
		spawnTimer += delta*10
		while spawnTimer >= INTERVEAL:
			spawnTimer -= INTERVEAL
			enemyObj = enemyPrefab.instantiate()
			add_child(enemyObj)
			self.score += 1

func _on_interact_button_pressed() -> void:
	if Tutorial.is_tutorial_state:
		PlayerStatus.PREV_SCENE = "arcade"
		ScenceTransition.change_scene("res://tutorial-scenes/day-3/tutorial_day_3_mainroad_2.tscn")
	else:
		Global.day_time_update()
		PlayerStatus.PREV_SCENE = "arcade"
		ScenceTransition.change_scene("res://main-game-scenes/mainroad.tscn")

func showFinishButton():
	print('score : '+str(self.score))
	var moneyToEarn = self.score
	if self.hardMode:
		moneyToEarn *= 2
	if moneyToEarn > 50:
		moneyToEarn = 50
	PlayerStatus.money += moneyToEarn
	$FinishButton.show()
