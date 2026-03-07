extends Node2D

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day2/day2-summary.dialogue"))

func _on_button_pressed() -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-3/tutorial_day_3_bedroom_1.tscn")
