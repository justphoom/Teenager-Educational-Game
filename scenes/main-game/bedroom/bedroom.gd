extends Node2D

#objects
@onready var bedroom_object = $bedroomObject
@onready var desktop_object = $desktopObject
@onready var tutorial_object = $tutorialObject

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
		'sleeping' :
			initPosition = Vector2(560, 480)
		'mainroad' :
			initPosition = Vector2(1380, 700)
		_ :
			initPosition = Vector2(650, 680)
	$Player.set_position(initPosition)

func _on_exit_body_entered(_body: Node2D) -> void:
	doorEffect.play()
	await get_tree().create_timer(exitDelay).timeout
	PlayerStatus.PREV_SCENE = "bedroom"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")

func update_avialability() -> void:
	bedroom_object.update_avialability()
	desktop_object.update_avialability()
	tutorial_object.update_avialability()
