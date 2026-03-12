extends CanvasLayer

var cinema_item = preload("res://other-gameplay/cinema_item.tscn")
var cinema_item_obj
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
		Global.CURRENT_TIME = 3
		Tutorial.day2_after_cinema()
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
					"path" : "res://assets/Cinema/Film - resized.png",
					"name" : "Test Item",
					"description" : "This is a test item."
				}
			)

func generate_item(item_list : Array):
	for item in item_list:
		cinema_item_obj = cinema_item.instantiate()
		item_container.add_child(cinema_item_obj)
		cinema_item_obj.set_image(item["path"])
		cinema_item_obj.set_item_name(item["name"])
		cinema_item_obj.set_description(item["description"])
