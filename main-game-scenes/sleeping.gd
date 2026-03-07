extends Node2D

func _on_button_pressed() -> void:
	if Global.CURRENT_CYCLE != Global.MAX_CYCLE:
		self.calculate_game_date()
		PlayerStatus.PREV_SCENE = "sleeping"
		ScenceTransition.change_scene("res://main-game-scenes/bedroom.tscn")
	else:
		ScenceTransition.change_scene("res://main-game-scenes/ending.tscn")

func calculate_game_date() -> void:
	if !Global.ASSESSMENT_DATE:
		Global.day_update()
	else:
		Global.cycle_update()
