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

func _ready() -> void:
	PlayerStatus.doArcadeActivity()
	PlayerStatus.doActivity()
	$FinishButton.hide()
	$Player/Joystick/Interact.hide()
	$Player/Joystick/Stats.hide()
	isFinishGame = false
	playerHealth = 5
	self.score = 0
	gameIsDone = false
	hardMode = MiniGameController.isHardMode
	enemyObj = enemyPrefab.instantiate()
	add_child(enemyObj)

func _process(delta):
	playerPosition = $Player.position
	if playerHealth == 0 and gameIsDone:
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
	PlayerStatus.toMainroadFrom = "arcade"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")

func showFinishButton():
	print('score : '+str(self.score))
	var moneyToEarn = self.score
	if self.hardMode:
		moneyToEarn *= 2
	if moneyToEarn > 50:
		moneyToEarn = 50
	PlayerStatus.money += moneyToEarn
	$FinishButton.show()
