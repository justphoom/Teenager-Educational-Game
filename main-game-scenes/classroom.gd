extends Node2D

#objects
@onready var bookshelfObject = $bookshelfObject
@onready var classroomObject = $classroomObject
@onready var friendObject = $friendObject

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
	PlayerStatus.PREV_SCENE = "classroom"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")
	
func update_avialability() -> void:
	bookshelfObject.update_avialability()
	classroomObject.update_avialability()
	friendObject.update_avialability()
