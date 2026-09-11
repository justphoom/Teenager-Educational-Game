extends Node2D

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-summary.dialogue"))

func _on_button_pressed() -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_bedroom_1.tscn")
