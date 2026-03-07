extends Node2D

#@onready var exit_glowspot = $Exit/GlowingSpot_Exit

@onready var bedroomObject = $bedroomObject
@onready var desktopObject = $desktopObject
@onready var tutorialObject= $tutorialObject

func _ready() -> void:
	#exit_glowspot.setType(3)
	bedroomObject.inactive_mode()
	tutorialObject.inactive_mode()
	Global.CURRENT_DAY = 2
	Global.CURRENT_TIME = 2
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day3/day3-bedroom-2.dialogue"))

func show_bed():
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day3/day3-bedroom-3.dialogue"))
	bedroomObject.standing_by()
