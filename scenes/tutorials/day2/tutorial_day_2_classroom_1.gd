extends Node2D

@onready var bookshelfObject = $bookshelfObject
@onready var classroomObject = $classroomObject
@onready var friendObject = $friendObject

var isClosedBookshelf : bool = false
@onready var exit_glow = $GlowingSpot_Exit

func _ready() -> void:
	Global.CURRENT_DAY = 1
	#DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day2/day2-classroom-1.dialogue"))
	classroomObject.inactive_mode()
	friendObject.inactive_mode()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/knowledge-present.dialogue"))

func show_bookshelf() -> void:
	bookshelfObject.show_object()

func after_bookshelf():
	self.isClosedBookshelf = true
	exit_glow.setType(3)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day2/day2-classroom-2.dialogue"))

func _on_exit_body_entered(_body: Node2D) -> void:
	if isClosedBookshelf:
		ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_mainroad_2.tscn")
