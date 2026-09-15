extends Node2D

var object_action_component : OBJECT_ACTION_COMPONENT

func _ready() -> void:
	object_action_component = OBJECT_ACTION_COMPONENT.new()
	object_action_component._exit()
	DialogueManager.show_dialogue_balloon(load(DIALOGUE_PATH.temp_friend_dialogue))
