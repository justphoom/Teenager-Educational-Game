extends Node2D

func _ready() -> void:
	Global.set_friend_name()
	#DialogueManager.show_dialogue_balloon(load(DIALOGUE_PATH.temp_dialog))
