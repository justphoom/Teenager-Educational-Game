extends Node2D

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day3/day3-summary.dialogue"))

func _on_button_pressed() -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-4/tutorial_day_4_bedroom_1.tscn")
