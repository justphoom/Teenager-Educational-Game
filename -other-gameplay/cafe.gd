extends CanvasLayer

var cafe_item = preload("res://other-gameplay/cafe_item.tscn")
var cafe_item_obj
var item_list = []
@onready var item_container = $Background/Panel/VBoxContainer

func _ready() -> void:
	PlayerStatus.isOpenDialog = true
#	TODO -> calculate To Show items depneds on the player status
	Tutorial.is_tutorial_state = false
	self.get_item_list(self.calculate_score())
	self.generate_item(self.item_list)

func _on_button_pressed() -> void:
	if Tutorial.is_tutorial_state:
		Global.CURRENT_TIME = 2
		Tutorial.day2_after_cafe()
	PlayerStatus.isOpenDialog = false
	self.queue_free()

func closed_window():
	self.queue_free()

func calculate_score() -> int:
#	TODO - design level system for cafe item
	return 0

func get_item_list(score : int) -> void:
#	TODO change the matcing
	match score:
		_ :
			item_list.append(
				{
					"path" : "res://assets/Cafe/Bubble milk tea 2 brothers - resized.png",
					"name" : "Test Item",
					"description" : "This is a test item."
				}
			)

func generate_item(item_list : Array):
	for item in item_list:
		cafe_item_obj = cafe_item.instantiate()
		item_container.add_child(cafe_item_obj)
		cafe_item_obj.set_image(item["path"])
		cafe_item_obj.set_item_name(item["name"])
		cafe_item_obj.set_description(item["description"])
