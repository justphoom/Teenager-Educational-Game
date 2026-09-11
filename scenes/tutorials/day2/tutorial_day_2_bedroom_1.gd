extends Node2D

@onready var tutorialObject = $tutorialObject
@onready var bedroomObject = $bedroomObject

@onready var exit_glowspot = $Exit/GlowingSpot_Exit

func _ready() -> void:
	tutorialObject.inactive_mode()
	bedroomObject.inactive_mode()
	exit_glowspot.setType(3)
	Global.CURRENT_DAY = 1
	Global.CURRENT_DAY = 0
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day2/day2-bedroom-1.dialogue"))

func _on_exit_body_entered(_body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_mainroad_1.tscn")
