extends CanvasLayer

@onready var img = $TextureRect/VBoxContainer/TextureRect
@onready var text = $TextureRect/VBoxContainer/Label

@onready var backBtn = $TextureRect/VBoxContainer2/HBoxContainer/VBoxContainer/HBoxContainer/Back
@onready var nextBtn = $TextureRect/VBoxContainer2/HBoxContainer/VBoxContainer2/HBoxContainer/Next

var knowledge_list = []
var knowledge_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	TODO asjust a proper path later
	var knowledge_path 
	knowledge_path = "res://assets/Bookshelf/Presentation1/Presentation1.JSON"
	knowledge_path = "res://assets/Bookshelf/Presentation2/Presentation2.JSON"
	knowledge_path = "res://assets/Bookshelf/Presentation3/Presentation3.JSON"
	
	self.load_knowledge(knowledge_path)
	self.present(knowledge_index)
	self.isFirstPage()
	self.isLastPage()

func load_knowledge(path: String) -> void:
	var json_as_text = FileAccess.get_file_as_string(path)
	var json_as_dict = JSON.parse_string(json_as_text)
	var content_lsit = json_as_dict["contents"]
	for content in content_lsit:
		for txt in content.texts:
			knowledge_list.append(
				{
					"img_path": content.img_path,
					"text": txt
				}
			)

func present(index: int) -> void:
	self.img.texture = load(knowledge_list[index].img_path)
	self.text.text = knowledge_list[index].text

func _on_back_pressed() -> void:
	self.knowledge_index -= 1
	self.present(knowledge_index)
	self.isFirstPage()
	self.isLastPage()

func _on_next_pressed() -> void:
	if self.knowledge_index == len(self.knowledge_list) - 1:
		self.queue_free()
		return

	self.knowledge_index += 1
	self.present(knowledge_index)
	self.isFirstPage()
	self.isLastPage()

func isFirstPage() -> void:
	if self.knowledge_index == 0:
		backBtn.hide()
	else:
		backBtn.show()

func isLastPage() -> void:
	if self.knowledge_index == len(self.knowledge_list) - 1:
		nextBtn.text = "Done"
	else:
		nextBtn.text = "Next"
