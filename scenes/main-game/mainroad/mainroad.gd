extends Node2D

@onready var arcade_spot = $Arcade/GlowingSpot_Arcade
@onready var sport_spot = $Sport/GlowingSpot_Sport

@onready var doorEffect = $ExitSound
var exitDelay : float = 0.15

@onready var bgmSound = $BGM
func playBGM():
	bgmSound.play()
func _on_bgm_finished():
	self.playBGM()
	
func _ready():
	self.playBGM()
	setPlayerPosition(PlayerStatus.PREV_SCENE)

func setPlayerPosition(place: String) -> void:
	var initPosition: Vector2
	self.set_minigame_availability()
	match place:
		'bedroom' :
			initPosition = Vector2(150, 900)
		'classroom' :
			initPosition = Vector2(450, 700)
		'cafe' :
			initPosition = Vector2(1660, 380)
		'cinema' :
			initPosition = Vector2(1520, 900)
		'arcade' :
			initPosition = Vector2(1000, 140)
		'sport' :
			initPosition = Vector2(1800, 930)
		_ :
			initPosition = Vector2(960, 540)
	$Player.set_position(initPosition)

func _on_bedroom_portal_body_entered(_body: Node2D) -> void:
	doorEffect.play()
	PlayerStatus.PREV_SCENE = "mainroad"
	await get_tree().create_timer(exitDelay).timeout 
	get_tree().change_scene_to_file("res://main-game-scenes/bedroom.tscn")

func _on_cinema_portal_body_entered(_body: Node2D) -> void:
	PlayerStatus.PREV_SCENE = 'cinema1'
	doorEffect.play()
	await get_tree().create_timer(exitDelay).timeout
	get_tree().change_scene_to_file("res://main-game-scenes/cinema.tscn")

func _on_cinema_portal_2_body_entered(_body: Node2D) -> void:
	PlayerStatus.PREV_SCENE = 'cinema2'
	doorEffect.play()
	await get_tree().create_timer(exitDelay).timeout
	get_tree().change_scene_to_file("res://main-game-scenes/cinema.tscn")

func _on_cafe_portal_body_entered(_body: Node2D) -> void:
	doorEffect.play()
	await get_tree().create_timer(exitDelay).timeout
	get_tree().change_scene_to_file("res://main-game-scenes/cafe.tscn")

func _on_classroom_portal_body_entered(_body: Node2D) -> void:
	doorEffect.play()
	await get_tree().create_timer(exitDelay).timeout
	get_tree().change_scene_to_file("res://main-game-scenes/classroom.tscn")

func _on_arcade_portal_body_entered(_body: Node2D) -> void:
	if Global.ASSESSMENT_DATE:
		DialogueManager.show_dialogue_balloon(load('res://dialogues/object-unavialable.dialogue'))
	else :
		if Global.CURRENT_TIME == Global.GAME_TIME_NIGHT :
			DialogueManager.show_dialogue_balloon(load('res://dialogues/sleep-time.dialogue'))
		else :
			doorEffect.play()
			await get_tree().create_timer(exitDelay).timeout
			ScenceTransition.change_scene("res://mini-game-arcade/arcade.tscn")

func _on_sport_portal_body_entered(_body: Node2D) -> void:
	if Global.ASSESSMENT_DATE:
		DialogueManager.show_dialogue_balloon(load('res://dialogues/object-unavialable.dialogue'))
	else :
		if Global.CURRENT_TIME == Global.GAME_TIME_NIGHT:
			DialogueManager.show_dialogue_balloon(load('res://dialogues/sleep-time.dialogue'))
		elif Global.CURRENT_TIME == Global.GAME_TIME_MORNING:
			DialogueManager.show_dialogue_balloon(load('res://dialogues/object-unavialable.dialogue'))
		else :
			doorEffect.play()
			await get_tree().create_timer(exitDelay).timeout
			ScenceTransition.change_scene("res://mini-game-sport/sport.tscn")

func set_minigame_availability():
	self.set_minigame_from_player_status()
	if Global.ASSESSMENT_DATE:
		arcade_spot.setType(0)
		sport_spot.setType(0)
	else:
		if Global.CURRENT_TIME == Global.GAME_TIME_NIGHT:
			arcade_spot.setType(0)
			sport_spot.setType(0)
		elif Global.CURRENT_TIME == Global.GAME_TIME_MORNING:
			sport_spot.setType(0)

func set_minigame_from_player_status():
	arcade_spot.setType(3)
	sport_spot.setType(3)
