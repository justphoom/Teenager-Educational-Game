extends Node2D

@onready var bedroomObject = $bedroomObject
@onready var tutorialObject = $tutorialObject

func _ready() -> void:
	bedroomObject.hide()
	bedroomObject.inactive_mode()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-bedroom-2.dialogue"))

func show_schedule() -> void:
	tutorialObject.show_schedule()

func show_bed():
	bedroomObject.show()
	bedroomObject.standing_by()
