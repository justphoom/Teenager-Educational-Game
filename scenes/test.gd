extends Node2D

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load(DIALOGUE_PATH.temp_dialog))
	pass
