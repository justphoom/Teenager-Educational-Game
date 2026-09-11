extends Node2D

@onready var how_to_play_button = $"HowToPlay"
@onready var how_to_play_glow = $"HowToPlay/GlowingSpot"

@onready var start_button = $Start
@onready var exit_button = $Exit

@onready var bgmSound = $BGM
func playBGM():
	bgmSound.play()
func _on_bgm_finished():
	self.playBGM()

func _ready() -> void:
	if Tutorial.is_tutorial_state:
		first_time_landing()
		how_to_play_glow.setType(2)
		start_button.hide()
		exit_button.hide()
	else:
		how_to_play_glow.queue_free()
	self.playBGM()
	$Mode1.hide()
	$Mode2.hide()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			PlayerStatus.toMainroadFrom = "arcade"
			get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")

func _on_start_pressed() -> void:
	$Mode1.show()
	$Mode2.show()
	$Start.hide()
	$Exit.hide()

func _on_exit_pressed() -> void:
	if Tutorial.is_tutorial_state:
		PlayerStatus.PREV_SCENE = "arcade"
		get_tree().change_scene_to_file("res://tutorial-scenes/tutorial-mainroad.tscn")
	else:	
		PlayerStatus.PREV_SCENE = "arcade"
		get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")

func _on_mode_1_pressed() -> void:
	MiniGameController.isHardMode = false
	get_tree().change_scene_to_file("res://mini-game-arcade/arcade_game.tscn")
	
func _on_mode_2_pressed() -> void:
	MiniGameController.isHardMode = true
	get_tree().change_scene_to_file("res://mini-game-arcade/arcade_game.tscn")

func _on_how_to_play_pressed() -> void:
	DialogueManager.show_dialogue_balloon(load("res://dialogues/minigame_arcade_tutorial.dialogue"))
	how_to_play_glow.hide()
	how_to_play_button.hide()

func first_time_landing():
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-minigame.dialogue"))
