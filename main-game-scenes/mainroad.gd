extends Node2D

func _ready():
	setPlayerPosition(PlayerStatus.toMainroadFrom)

func setPlayerPosition(place: String) -> void:
	var initPosition: Vector2
	match place:
		'bedroom' :
			initPosition = Vector2(150, 900)
		'classroom' :
			initPosition = Vector2(450, 700)
		'cafe' :
			initPosition = Vector2(1660, 380)
		'cinema' :
			initPosition = Vector2(1380, 900)
		'arcade' :
			initPosition = Vector2(1000, 140)
		'sport' :
			initPosition = Vector2(1800, 930)			
		_ :
			initPosition = Vector2(960, 540)
	$Player.set_position(initPosition)

func _on_bedroom_portal_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://main-game-scenes/bedroom.tscn")

func _on_cinema_portal_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://main-game-scenes/cinema.tscn")

func _on_cinema_portal_2_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://main-game-scenes/cinema.tscn")

func _on_cafe_portal_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://main-game-scenes/cafe.tscn")

func _on_classroom_portal_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://main-game-scenes/classroom.tscn")

func _on_arcade_portal_body_entered(body: Node2D) -> void:
	if PlayerStatus.gameDate == Global.maxDatePerCycle:
		DialogueManager.show_dialogue_balloon(load('res://dialogues/testDateDialog.dialogue'))
	elif PlayerStatus.gameTime == Global.GAME_TIME_AFTERNOON or PlayerStatus.gameTime == Global.GAME_TIME_EVENING :
		get_tree().change_scene_to_file("res://mini-game-arcade/arcade.tscn")
	else:
		DialogueManager.show_dialogue_balloon(load('res://dialogues/OutOfTime.dialogue'))

func _on_sport_portal_body_entered(body: Node2D) -> void:
	if PlayerStatus.gameDate == Global.maxDatePerCycle:
		DialogueManager.show_dialogue_balloon(load('res://dialogues/testDateDialog.dialogue'))
	elif PlayerStatus.gameTime == Global.GAME_TIME_AFTERNOON or PlayerStatus.gameTime == Global.GAME_TIME_EVENING :
		get_tree().change_scene_to_file("res://mini-game-sport/sport.tscn")
	else:
		DialogueManager.show_dialogue_balloon(load('res://dialogues/OutOfTime.dialogue'))
