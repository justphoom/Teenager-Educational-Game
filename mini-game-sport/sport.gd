extends Node2D

func _ready() -> void:
	$Mode1.hide()
	$Mode2.hide()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			PlayerStatus.toMainroadFrom = "sport"
			get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")

func _on_start_pressed() -> void:
	$Mode1.show()
	$Mode2.show()
	$Start.hide()
	$Exit.hide()

func _on_exit_pressed() -> void:
	PlayerStatus.toMainroadFrom = "sport"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")

func _on_mode_1_pressed() -> void:
	MiniGameController.isHardMode = false
	get_tree().change_scene_to_file("res://mini-game-sport/sport_game.tscn")

func _on_mode_2_pressed() -> void:
	MiniGameController.isHardMode = true
	get_tree().change_scene_to_file("res://mini-game-sport/sport_game.tscn")

func _on_how_to_play_pressed() -> void:
	pass # Replace with function body.
