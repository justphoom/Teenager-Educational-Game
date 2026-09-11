extends Control

@onready var line_edit: LineEdit = $Background/Container/NameBox/HBoxContainer2/LineEdit
@onready var name_text: Label = $Background/Container/ConfirmBox/NameLabel
@onready var naming_scene: Control = $"."

@onready var enter_button: Button = $"Background/Container/NameBox/HBoxContainer/Enter"

@onready var name_box = $Background/Container/NameBox
@onready var confirm_box = $Background/Container/ConfirmBox

var textLength: int = 0
var currText: String

func _ready() -> void:
	name_box.show()
	confirm_box.hide()
	line_edit.text_submitted.connect(_on_LineEdit_text_entered)
	line_edit.text_changed.connect(_on_change_textline)

func _on_LineEdit_text_entered(new_text: String) -> void:
	line_edit.clear()
	name_text.text = new_text
	show_confirmation()

func show_confirmation():
	name_box.hide()
	confirm_box.show()

func _on_yes_pressed() -> void:
	PlayerStatus.playerName = name_text.text
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-classroom-2.dialogue"))
	PlayerStatus.isOpenDialog = false
	naming_scene.queue_free()

func _on_no_pressed() -> void:
	name_text.text = ""
	name_box.show()
	confirm_box.hide()
	
func _physics_process(_delta: float) -> void:
	if textLength == 0:
		enter_button.hide()
	else:
		enter_button.show()
		
func _on_change_textline(text: String) -> void:
	currText = text
	textLength = currText.length()

func _on_enter_pressed() -> void:
	name_text.text = currText
	show_confirmation()
	line_edit.clear()
