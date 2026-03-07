extends Node2D

#objects variables
@onready var bedroom_portal_object = $BedroomPortal
@onready var bedroom_portal_object_glow = $GlowingSpot_Home
var isBedroomHide : bool

@onready var classroom_portal_object = $ClassroomPortal
@onready var classroom_portal_object_glow = $GlowingSpot_Classroom
var isClassroomHide : bool

@onready var cafe_portal_object = $CafePortal
@onready var cafe_portal_object_glow = $GlowingSpot_Cafe
var isCafeHide : bool

@onready var cinema_portal_object_1 = $CinemaPortal
@onready var cinema_portal_object_glow_1 = $GlowingSpot_Cinema1
var isCinemaHide_1 : bool
@onready var cinema_portal_object_2 = $CinemaPortal2
@onready var cinema_portal_object_glow_2 = $GlowingSpot_Cinema2
var isCinemaHide_2 : bool

@onready var arcade_portal_object = $ArcadePortal
@onready var arcade_portal_object_glow = $GlowingSpot_Arcade
var isArcadeHide : bool

@onready var sport_portal_object = $SportPortal
@onready var sport_portal_object_glow = $GlowingSpot_Sport
var isSportHide : bool

@onready var doorEffect = $ExitSound
var exitDelay : float = 0.15

func _ready() -> void:
	#self.playBGM()
	setPlayerPosition(PlayerStatus.toMainroadFrom)
	match Tutorial.tutorial_mainroad_state:
		0 : #first day guide to the school
			tutorial_mainroad_state_1()
		1: #first day after school -> home
			tutorial_mainroad_state_2()
		2: #second day to school
			tutorial_mainroad_state_3()
		3: #second day to cafe
			tutorial_mainroad_state_4()
		4: #second day to cinema
			tutorial_mainroad_state_5()
		5: #second day to home
			tutorial_mainroad_state_6()
		6: #third day to arcade
			tutorial_mainroad_state_7()
		7: #third day to sport
			tutorial_mainroad_state_8()
		8: #third day to home
			tutorial_mainroad_state_9()
		9: #fourth day to school for the test
			tutorial_mainroad_state_10()
		10: #fourth day after test to home
			tutorial_mainroad_state_11()
		_ :
			Tutorial.error_state()

func setPlayerPosition(place: String) -> void:
	var initPosition: Vector2
	match place:
		'tutorial_bedroom' :
			initPosition = Vector2(150, 900)
		'tutorial_classroom' :
			initPosition = Vector2(450, 700)
		'tutorial_cafe' :
			initPosition = Vector2(1660, 380)
		'tutorial_cinema' :
			initPosition = Vector2(1520, 900)
		'tutorial_arcade' :
			initPosition = Vector2(1000, 140)
		'tutorial_sport' :
			initPosition = Vector2(1800, 930)
		'arcade' :
			initPosition = Vector2(1000, 140)
		'sport' :
			initPosition = Vector2(1800, 930)
		_ :
			initPosition = Vector2(960, 540)
	$Player.set_position(initPosition)
	
func _on_bedroom_portal_body_entered(body: Node2D) -> void:
	if !isBedroomHide:
		PlayerStatus.toMainroadFrom = 'tutorial_bedroom'
		doorEffect.play()
		await get_tree().create_timer(exitDelay).timeout
		get_tree().change_scene_to_file("res://tutorial-scenes/tutorial-bedroom.tscn")

func _on_cinema_portal_body_entered(body: Node2D) -> void:
	if !isCinemaHide_1:
		PlayerStatus.toMainroadFrom = 'tutorial_cinema1'
		doorEffect.play()
		await get_tree().create_timer(exitDelay).timeout
		get_tree().change_scene_to_file("res://tutorial-scenes/tutorial-cinema.tscn")

func _on_cinema_portal_2_body_entered(body: Node2D) -> void:
	if !isCinemaHide_2:
		PlayerStatus.toMainroadFrom = 'tutorial_cinema2'
		doorEffect.play()
		await get_tree().create_timer(exitDelay).timeout
		get_tree().change_scene_to_file("res://tutorial-scenes/tutorial-cinema.tscn")

func _on_cafe_portal_body_entered(body: Node2D) -> void:
	if !isCafeHide:
		doorEffect.play()
		await get_tree().create_timer(exitDelay).timeout
		get_tree().change_scene_to_file("res://tutorial-scenes/tutorial-cafe.tscn")

func _on_classroom_portal_body_entered(body: Node2D) -> void:
	if !isClassroomHide:
		doorEffect.play()
		await get_tree().create_timer(exitDelay).timeout
		get_tree().change_scene_to_file("res://tutorial-scenes/tutorial-classroom.tscn")

func _on_arcade_portal_body_entered(body: Node2D) -> void:
	if !isArcadeHide:
		doorEffect.play()
		await get_tree().create_timer(exitDelay).timeout
		get_tree().change_scene_to_file("res://mini-game-arcade/arcade.tscn")

func _on_sport_portal_body_entered(body: Node2D) -> void:
	if !isSportHide:
		doorEffect.play()
		await get_tree().create_timer(exitDelay).timeout
		get_tree().change_scene_to_file("res://mini-game-sport/sport.tscn")

func show_bedroom_portal():
	bedroom_portal_object.show()
	bedroom_portal_object_glow.show()
	isBedroomHide = false
func hide_bedroom_portal():
	classroom_portal_object.hide()
	bedroom_portal_object_glow.hide()
	isBedroomHide = true

func show_classroom_portal():
	bedroom_portal_object.show()
	classroom_portal_object_glow.show()
	isClassroomHide = false
func hide_classroom_portal():
	bedroom_portal_object.hide()
	classroom_portal_object_glow.hide()
	isClassroomHide = true

func show_cinema_portal():
	cinema_portal_object_1.show()
	cinema_portal_object_glow_1.show()
	cinema_portal_object_2.show()
	cinema_portal_object_glow_2.show()
	isCinemaHide_1 = false
	isCinemaHide_2 = false
func hide_cinema_portal():
	cinema_portal_object_1.hide()
	cinema_portal_object_glow_1.hide()
	cinema_portal_object_2.hide()
	cinema_portal_object_glow_2.hide()
	isCinemaHide_1 = true
	isCinemaHide_2 = true

func show_cafe_portal():
	cafe_portal_object.show()
	cafe_portal_object_glow.show()
	isCafeHide = false
func hide_cafe_portal():
	cafe_portal_object.hide()
	cafe_portal_object_glow.hide()
	isCafeHide = true

func show_arcade_portal():
	arcade_portal_object.show()
	arcade_portal_object_glow.show()
	isArcadeHide = false
func hide_arcade_portal():
	arcade_portal_object.hide()
	arcade_portal_object_glow.hide()
	isArcadeHide = true

func show_sport_portal():
	sport_portal_object.show()
	sport_portal_object_glow.show()
	isSportHide = false
func hide_sport_portal():
	sport_portal_object.hide()
	sport_portal_object_glow.hide()
	isSportHide = true

func tutorial_mainroad_state_1():
	#first day guide to the school
	hide_bedroom_portal()
	hide_classroom_portal()
	hide_cinema_portal()
	hide_cafe_portal()
	hide_arcade_portal()
	hide_sport_portal()
	classroom_portal_object_glow.setType(2)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-mainroad-state-1.dialogue"))
	Tutorial.tutorial_mainroad_state += 1

func tutorial_mainroad_state_2():
	#first day after school -> home
	show_bedroom_portal()
	hide_classroom_portal()
	hide_cinema_portal()
	hide_cafe_portal()
	hide_arcade_portal()
	hide_sport_portal()
	bedroom_portal_object_glow.setType(2)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-after-school-1.dialogue"))
	Tutorial.tutorial_mainroad_state += 1

func tutorial_mainroad_state_3():
	#second day to school
	hide_bedroom_portal()
	show_classroom_portal()
	hide_cinema_portal()
	hide_cafe_portal()
	hide_arcade_portal()
	hide_sport_portal()
	classroom_portal_object_glow.setType(2)
	Tutorial.tutorial_mainroad_state += 1

func tutorial_mainroad_state_4():
	#second day to cafe
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-day2-after-classroom.dialogue"))
	hide_bedroom_portal()
	hide_classroom_portal()
	hide_cinema_portal()
	show_cafe_portal()
	hide_arcade_portal()
	hide_sport_portal()
	cafe_portal_object_glow.setType(2)
	Tutorial.tutorial_mainroad_state += 1

func tutorial_mainroad_state_5():
	#second day to cinema
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-day2-after-cafe.dialogue"))
	hide_bedroom_portal()
	hide_classroom_portal()
	show_cinema_portal()
	hide_cafe_portal()
	hide_arcade_portal()
	hide_sport_portal()
	cinema_portal_object_glow_1.setType(2)
	cinema_portal_object_glow_2.setType(2)
	Tutorial.tutorial_mainroad_state += 1

func tutorial_mainroad_state_6():
	#second day to home
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-day2-after-cinema.dialogue"))
	show_bedroom_portal()
	hide_classroom_portal()
	hide_cinema_portal()
	hide_cafe_portal()
	hide_arcade_portal()
	hide_sport_portal()
	bedroom_portal_object_glow.setType(2)
	Tutorial.tutorial_mainroad_state += 1

func tutorial_mainroad_state_7():
	#third day to arcade
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-day3-to-arcade.dialogue"))
	hide_bedroom_portal()
	hide_classroom_portal()
	hide_cinema_portal()
	hide_cafe_portal()
	show_arcade_portal()
	hide_sport_portal()
	arcade_portal_object_glow.setType(2)
	Tutorial.tutorial_mainroad_state += 1

func tutorial_mainroad_state_8():
	#third day to sport
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-day3-to-sport.dialogue"))
	hide_bedroom_portal()
	hide_classroom_portal()
	hide_cinema_portal()
	hide_cafe_portal()
	hide_arcade_portal()
	show_sport_portal()
	sport_portal_object_glow.setType(2)
	Tutorial.tutorial_mainroad_state += 1

func tutorial_mainroad_state_9():
	#third day to home
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-day3-to-home.dialogue"))
	show_bedroom_portal()
	hide_classroom_portal()
	hide_cinema_portal()
	hide_cafe_portal()
	hide_arcade_portal()
	hide_sport_portal()
	bedroom_portal_object_glow.setType(2)
	Tutorial.tutorial_mainroad_state += 1

func tutorial_mainroad_state_10():
	#fourth day to school for the test
	hide_bedroom_portal()
	show_classroom_portal()
	hide_cinema_portal()
	hide_cafe_portal()
	hide_arcade_portal()
	hide_sport_portal()
	classroom_portal_object_glow.setType(2)
	Tutorial.tutorial_mainroad_state += 1
	
func tutorial_mainroad_state_11():
	#fourth day after test to home
	show_bedroom_portal()
	hide_classroom_portal()
	hide_cinema_portal()
	hide_cafe_portal()
	hide_arcade_portal()
	hide_sport_portal()
	bedroom_portal_object_glow.setType(2)
	Tutorial.tutorial_mainroad_state += 1
