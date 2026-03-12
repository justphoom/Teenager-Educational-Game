extends Control

@onready var select_state = $HBoxContainer/VBoxContainer/SelectState
@onready var buy_state = $HBoxContainer/VBoxContainer/BuyState

@onready var name_label : Label = $HBoxContainer/VBoxContainer/ItemName
@onready var description_label : Label = $HBoxContainer/VBoxContainer/ItemDescription
@onready var image : TextureRect = $HBoxContainer/TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	select_state.set_visible(true)
	buy_state.set_visible(false)
# 	TODO: Show item on the panel
	pass # Replace with function body.

func _on_select_button_button_down() -> void:
	#To select this item
	select_state.set_visible(false)
	buy_state.set_visible(true)

func _on_cancel_button_button_down() -> void:
	#To calcel selection
	select_state.set_visible(true)
	buy_state.set_visible(false)

func _on_buy_button_button_down() -> void:
	self.on_purchase()
	Global.ON_BUYING_CAFE_ITEM()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/temp.dialogue"))

func set_item_name(name : String) -> void:
	name_label.text = name

func set_description(description : String) -> void:
	description_label.text = description

func set_image(path : String) -> void:
	var loaded_img = load(path)
	image.texture = loaded_img

func on_purchase() -> void:
#	TODO (calculate the system)
	pass
