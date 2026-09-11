extends Node2D

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day4/day4-summary.dialogue"))

func _on_button_pressed() -> void:
	Global.CURRENT_CYCLE = 0
	Global.CURRENT_DAY = 0
	Global.CURRENT_TIME = 0
	Global.ASSESSMENT_DATE = 0
	Tutorial.is_tutorial_state = false
	ScenceTransition.change_scene("res://main-game-scenes/bedroom.tscn")
