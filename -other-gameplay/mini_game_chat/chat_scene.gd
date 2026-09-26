extends CanvasLayer

var _chat_log_path : String
var chat_log_list

var chat_message = preload("res://features/objects/desktop/mini_game_chat/chat_message.tscn")
var chat_message_obj

var interator : int
var chat_log_json

@onready var chat_screen : VBoxContainer = $Panel/ScrollContainer/VBoxContainer
@onready var next_button : Button = $Next
@onready var done_button : Button = $Done

func _ready() -> void:
	#PlayerStatus.isOpenDialog = true
	interator = 0
	done_button.hide()
	self._get_chat_log_path()
	self._get_chat_log(_chat_log_path)

func _get_chat_log_path() -> void:
	_chat_log_path = "res://chat-logs/chat-log-tutorial.json"
	
func _get_chat_log(path : String):
	var json_as_text = FileAccess.get_file_as_string(path)
	var json_as_dict = JSON.parse_string(json_as_text)
	chat_log_json = json_as_dict
	print(json_as_dict[0])
	print(json_as_dict.size())

func _on_next_pressed() -> void:
	var chat_name : String
	var isPlayer : bool = chat_log_json[interator]["isPlayer"]
	if isPlayer:
		chat_name = "Player"
	else:
		chat_name = "NPC"
	self.add_message(chat_name, chat_log_json[interator]["data"])
	interator += 1
	
	if interator == chat_log_json.size():
		next_button.queue_free()
		done_button.show()

func add_message(chat_name : String, message : String):
	chat_message_obj = chat_message.instantiate()
	chat_screen.add_child(chat_message_obj)
	chat_message_obj._setName(chat_name)
	chat_message_obj._setMessage(message)

func _on_done_pressed() -> void:
	PlayerStatus.isOpenDialog = false
	self.queue_free()
	#if Tutorial.is_tutorial_state:
		#Global.CURRENT_TIME = 3
		#Tutorial.after_chatting()
		##DialogueManager.show_dialogue_balloon(load("res://dialogues/tutorial-object-desktop-1.dialogue"))
		##Tutorial.after_finish_tutorial_chatting()
