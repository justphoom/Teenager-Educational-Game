extends Node2D

#objects
@onready var bookshelfObject = $bookshelfObject
@onready var classroomObject = $classroomObject
@onready var friendObject = $friendObject

#Exit
@onready var exit_object = $Exit
@onready var exit_object_glow = $GlowingSpot_Exit
var isExitHide : bool

@onready var doorEffect = $ExitSound
var exitDelay : float = 0.15

@onready var naming_scene = $naming

func _ready() -> void:
	naming_scene.hide()
	match Tutorial.tutorial_classroom_state:
		0 : #first day to school go see friend and attend the class
			tutorial_classroom_state_1()
		1 : #second day to school go to book shelf
			tutorial_classroom_state_2()
		2 : #fourth day to the test
			tutorial_classroom_state_3()
		_ :
			Tutorial.error_state()

func _on_exit_body_entered(body: Node2D) -> void:
	if !isExitHide :
		doorEffect.play()
		await get_tree().create_timer(exitDelay).timeout
		PlayerStatus.toMainroadFrom = "tutorial_classroom"
		get_tree().change_scene_to_file("res://tutorial-scenes/tutorial-mainroad.tscn")

func hide_exit():
	exit_object.hide()
	exit_object_glow.hide()
	isExitHide = true
func show_exit():
	exit_object.show()
	exit_object_glow.show()
	isExitHide = false

func hide_bookshelf():
	bookshelfObject.hide()
	Tutorial.is_hide_bookshelf = true
func show_bookshelf():
	bookshelfObject.show()
	Tutorial.is_hide_bookshelf = false
	
func hide_friend():
	friendObject.hide()
	Tutorial.is_hide_friend = true
func show_friend():
	friendObject.show()
	Tutorial.is_hide_friend = false

func hide_classroom():
	classroomObject.hide()
	Tutorial.is_hide_classroom = true
func show_classroom():
	classroomObject.show()
	Tutorial.is_hide_classroom = false

func show_naming_scene():
	naming_scene.show()
func hide_naming_scene():
	naming_scene.hide()

func tutorial_classroom_state_1():
	#first day to school go see friend and attend the class
	hide_exit()
	hide_bookshelf()
	hide_friend()
	hide_classroom()
	friendObject.set_glow_type(2) 
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-classroom-state-1.dialogue"))
	Tutorial.tutorial_classroom_state += 1

func tutorial_classroom_state_2():
	#second day to school go to book shelf
	hide_exit()
	hide_bookshelf()
	show_friend()
	show_classroom()
	bookshelfObject.set_glow_type(2)
	classroomObject.inactive_mode()
	friendObject.inactive_mode()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-classroom-state-2.dialogue"))
	Tutorial.tutorial_classroom_state += 1

func tutorial_classroom_state_3():
	#fourth day to the test
	hide_exit()
	show_bookshelf()
	show_friend()
	show_classroom()
	bookshelfObject.inactive_mode()
	classroomObject.inactive_mode()
	friendObject.inactive_mode()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-classroom-state-3.dialogue"))
	Tutorial.tutorial_classroom_state += 1
