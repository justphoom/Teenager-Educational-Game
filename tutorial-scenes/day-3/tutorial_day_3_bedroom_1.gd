extends Node2D

@onready var bedroomObject = $bedroomObject
@onready var tutorialObject= $tutorialObject

@onready var exit_glowspot = $Exit/GlowingSpot_Exit

func _ready() -> void:
	exit_glowspot.setType(3)
	Global.CURRENT_DAY = 2
	Global.CURRENT_TIME = 0
	bedroomObject.inactive_mode()
	tutorialObject.inactive_mode()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day3/day3-bedroom-1.dialogue"))

func _on_exit_body_entered(_body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-3/tutorial_day_3_mainroad_1.tscn")
