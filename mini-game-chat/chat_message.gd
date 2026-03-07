extends Node

@onready var chat_name : Label = $HBoxContainer/Name
@onready var message_text : Label = $HBoxContainer/Message

func _setName(chatName : String):
	chat_name.text = chatName + " : "

func _setMessage(message : String):
	message_text.text = message
