extends Node2D

#object
@onready var cinemaObject = $cinemaObject

@onready var doorEffect = $ExitSound
var exitDelay : float = 0.15

@onready var bgmSound = $BGM
func playBGM():
	bgmSound.play()
func _on_bgm_finished():
	self.playBGM()
	
func _ready() -> void:
	self.playBGM()
	setPlayerPosition(PlayerStatus.PREV_SCENE)
	
func setPlayerPosition(place: String) -> void:
	var initPosition: Vector2
	match place:
		'cinema1' :
			initPosition = Vector2(1720, 720)
		'cinema2' :
			initPosition = Vector2(200, 720)
		_ :
			initPosition = Vector2(200, 720)
	$Player.set_position(initPosition)

func _on_exit_body_entered(_body: Node2D) -> void:
	doorEffect.play()
	await get_tree().create_timer(exitDelay).timeout
	PlayerStatus.PREV_SCENE = "cinema"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")

func _on_exit_2_body_entered(_body: Node2D) -> void:
	doorEffect.play()
	await get_tree().create_timer(exitDelay).timeout
	PlayerStatus.PREV_SCENE = "cinema"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")
