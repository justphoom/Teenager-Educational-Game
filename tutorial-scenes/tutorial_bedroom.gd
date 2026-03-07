extends Node2D

#objects
@onready var bedroom_object = $bedroomObject
@onready var desktop_object = $desktopObject
@onready var tutorial_object = $tutorialObject

#exit
@onready var exit_object = $Exit
@onready var exit_object_glow = $GlowingSpot_Exit
var isExitHide : bool

@onready var schedule = $Schedule

@onready var doorEffect = $ExitSound
var exitDelay : float = 0.15

func _ready() -> void:
	#self.playBGM()
	# show tutorial for first landing
	schedule.hide()
	setPlayerPosition(PlayerStatus.toMainroadFrom)
	match Tutorial.tutorial_bedroom_state:
		0 : #first game landing 
			tutorial_bedroom_state_1()
		1: #see tutorial book and go to bed. after that, guide to the school again
			tutorial_bedroom_state_2()
		2: #second day start go to school
			tutorial_bedroom_state_3()
		3: #just sleep on second day. after that, guide to the arcade
			tutorial_bedroom_state_4()
		4: #thrid day start go to arcade
			tutorial_bedroom_state_5()
		5: #see the chat on desktop. after that, guide to the school again for the test
			tutorial_bedroom_state_6()
		6: #start day-4 to the school for test
			tutorial_bedroom_state_7()
		7: #to the bed for ending tutorial
			tutorial_bedroom_state_8()
		_ :
			Tutorial.error_state()

func setPlayerPosition(place: String) -> void:
	var initPosition: Vector2
	match place:
		'tutorial_bedroom' :
			initPosition = Vector2(1320, 720)
		'start_day' :
			initPosition = Vector2(580, 480)
		_ :
			initPosition = Vector2(660, 640)
	$Player.set_position(initPosition)

func _on_exit_body_entered(body: Node2D) -> void:
	if !isExitHide:
		doorEffect.play()
		await get_tree().create_timer(exitDelay).timeout
		PlayerStatus.toMainroadFrom = "tutorial_bedroom"
		get_tree().change_scene_to_file("res://tutorial-scenes/tutorial-mainroad.tscn")

func hide_exit_glow():
	exit_object.hide()
	exit_object_glow.hide()
	isExitHide = true
func show_exit_glow():
	exit_object.show()
	exit_object_glow.show()
	isExitHide = false

func hide_bedroom():
	bedroom_object.hide()
	Tutorial.is_hide_bedroom = true
func show_bedroom():
	bedroom_object.show()
	Tutorial.is_hide_bedroom = false

func hide_desktop():
	desktop_object.hide()
	Tutorial.is_hide_desktop = true
func show_desktop():
	desktop_object.show()
	Tutorial.is_hide_desktop = false

func hide_tutorial():
	tutorial_object.hide()
	Tutorial.is_hide_tutorial = true
func show_tutorial():
	tutorial_object.show()
	Tutorial.is_hide_tutorial = false

func tutorial_bedroom_state_1():
	#first game landing
	hide_exit_glow()
	hide_bedroom()
	hide_desktop()
	hide_tutorial()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-bedroom-state-1.dialogue"))
	exit_object_glow.setType(2)
	Tutorial.tutorial_bedroom_state += 1

func tutorial_bedroom_state_2():
	#see tutorial book and go to bed. after that, guide to the school again
	hide_exit_glow()
	hide_bedroom()
	hide_desktop()
	hide_tutorial()
	print('show tutorial book & guide to sleep')
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-bedroom-state-2.dialogue"))
	Tutorial.tutorial_bedroom_state += 1

func tutorial_bedroom_state_3():
	#second day start go to school
	print('start day 2')
	hide_exit_glow()
	show_bedroom()
	bedroom_object.inactive_mode()
	show_tutorial()
	tutorial_object.inactive_mode()
	hide_desktop()
	exit_object_glow.setType(2)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-bedroom-state-3.dialogue"))
	Tutorial.tutorial_bedroom_state += 1

func tutorial_bedroom_state_4():
	#just sleep on second day. after that, guide to the arcade
	hide_desktop()
	tutorial_object.inactive_mode()
	bedroom_object.set_glow_type(2)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-bedroom-state-4.dialogue"))
	Tutorial.tutorial_bedroom_state += 1
	pass

func tutorial_bedroom_state_5():
	#thrid day start go to arcade
	print('start day 2')
	hide_exit_glow()
	show_bedroom()
	bedroom_object.inactive_mode()
	show_tutorial()
	tutorial_object.inactive_mode()
	hide_desktop()
	exit_object_glow.setType(2)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-bedroom-state-5.dialogue"))
	Tutorial.tutorial_bedroom_state += 1
	pass

func tutorial_bedroom_state_6():
	#see the chat on desktop. after that, guide to the school again for the test
	hide_exit_glow()
	show_bedroom()
	bedroom_object.inactive_mode()
	show_tutorial()
	tutorial_object.inactive_mode()
	hide_desktop()
	desktop_object.set_glow_type(2)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-bedroom-state-6.dialogue"))
	Tutorial.tutorial_bedroom_state += 1

func tutorial_bedroom_state_7():
	#start day-4 to the school for test
	print('start day 4 - test day')
	hide_exit_glow()
	show_bedroom()
	bedroom_object.inactive_mode()
	show_tutorial()
	tutorial_object.inactive_mode()
	show_desktop()
	desktop_object.inactive_mode()
	exit_object_glow.setType(2)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-bedroom-state-7.dialogue"))
	Tutorial.tutorial_bedroom_state += 1

func tutorial_bedroom_state_8():
	hide_exit_glow()
	show_bedroom()
	bedroom_object.inactive_mode()
	show_tutorial()
	tutorial_object.inactive_mode()
	show_desktop()
	desktop_object.inactive_mode()
	Tutorial.is_tutorial_state = false
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-bedroom-state-8.dialogue"))
	Tutorial.tutorial_bedroom_state += 1
