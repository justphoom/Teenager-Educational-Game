extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var move_speed : float = 400
@export var starting_direction : Vector2
@onready var parent = $".."

var img1  = preload("res://assets/MiniGame-Arcade/alcohol.png")
var img2  = preload("res://assets/MiniGame-Arcade/ciggarettes.png")
var img3  = preload("res://assets/MiniGame-Arcade/drugs.png")

func _ready():
	if parent.hardMode:
		move_speed = 580
	else:
		move_speed = 400
	var rng = RandomNumberGenerator.new()
	var imgNum = rng.randi_range(1, 3)
	match imgNum:
		1:
			$EnemyChar1.texture = img1
		2:
			$EnemyChar1.texture = img2
		3:
			$EnemyChar1.texture = img3
	generate_spawn_position()
	calculate_moving_direction()

func _physics_process(delta: float) -> void:
	velocity = starting_direction * move_speed
	var enemyMove =  move_and_collide(velocity*delta)
	if enemyMove:
		if enemyMove.get_collider().name == 'Player' :
			self.collideWithPlayer()
		else:
			self.calculate_moving_direction()
	if parent.isFinishGame:
		self.queue_free()

func calculate_moving_direction():
	var enemyPos : Vector2 = self.position
	var playerPos : Vector2 = parent.playerPosition	
	var dist = sqrt(pow((playerPos.x - enemyPos.x), 2) + pow((playerPos.y - enemyPos.y), 2))
	starting_direction = (playerPos - enemyPos)/dist
	
func generate_spawn_position():
	var unSpawnedRange : int = 300
	var playerPos : Vector2 = parent.playerPosition	
	var init_x : float = 0 
	var init_y : float = 0
	var rng = RandomNumberGenerator.new()
	## to be randomized
	# posible x value = 100 -> 1180
	# spawn range x : 100 -> Global.arcadeCharacterPos.x - unSpawnedRange | Global.arcadeCharacterPos.x + unSpawnedRange -> 1180
	if playerPos.x - unSpawnedRange < 100 :
		init_x = rng.randf_range(playerPos.x + unSpawnedRange, 1860)
	elif playerPos.x + unSpawnedRange > 1860 :
		init_x = rng.randf_range(100, playerPos.x - unSpawnedRange)
	else :
		if rng.randi_range(0, 1) == 1:
			init_x = rng.randf_range(playerPos.x + unSpawnedRange, 1860)
		else:
			init_x = rng.randf_range(100, playerPos.x - unSpawnedRange)
	# posibla y value = 80 - 640
	# spawn range x : 80 -> Global.arcadeCharacterPos.y - unSpawnedRange | Global.arcadeCharacterPos.y + unSpawnedRange + 300 -> 640
	if playerPos.y - unSpawnedRange < 80 : #left up
		init_y = rng.randf_range(playerPos.x + unSpawnedRange, 900)
	elif playerPos.x + unSpawnedRange > 900: #right down
		init_y = rng.randf_range(80, playerPos.x - unSpawnedRange)
	else : 
		if rng.randi_range(0, 1) == 1:
			init_y = rng.randf_range(playerPos.x + unSpawnedRange, 900)
		else:
			init_y = rng.randf_range(80, playerPos.x - unSpawnedRange)
	var initPosition = Vector2(init_x, init_y)
	self.set_position(initPosition)	
	
func collideWithPlayer():
	parent.playerHealth -= 1
	if parent.playerHealth == 0:
		parent.gameIsDone = true
	self.queue_free()
