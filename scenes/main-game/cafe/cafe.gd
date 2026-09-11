extends Node2D

#object
@onready var cafeObject = $cafeObject

@onready var doorEffect = $ExitSound
var exitDelay : float = 0.15

@onready var bgmSound = $BGM
func playBGM():
	bgmSound.play()
func _on_bgm_finished():
	self.playBGM()
	
func _ready() -> void:
	self.playBGM()

func _on_exit_body_entered(_body: Node2D) -> void:
	doorEffect.play()
	await get_tree().create_timer(exitDelay).timeout
	PlayerStatus.PREV_SCENE = "cafe"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")
