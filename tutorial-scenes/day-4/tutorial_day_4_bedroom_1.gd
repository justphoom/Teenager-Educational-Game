extends Node2D

@onready var exit_glowspot = $Exit/GlowingSpot_Exit

@onready var bedroomObject = $bedroomObject
@onready var desktopObject = $desktopObject
@onready var tutorialObject= $tutorialObject

func _ready() -> void:
	Global.CURRENT_DAY = 3
	Global.CURRENT_TIME = 0
	Global.ASSESSMENT_DATE = true
	bedroomObject.inactive_mode()
	desktopObject.inactive_mode()
	tutorialObject.inactive_mode()
	exit_glowspot.setType(3)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day4/day4-bedroom-1.dialogue"))

func show_exit():
	exit_glowspot.setType(3)

func _on_exit_body_entered(body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-4/tutorial_day_4_mainroad_1.tscn")
