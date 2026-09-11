extends Node

var temp_obj_path = "res://features/objects/temp_object_action.tscn"

var objective_src: Dictionary = {
	"Bedroom" : "",
	"Bookshelf" : "",
	"Cafe" : "",
	"Cinema" : "",
	"Classroom" : "",
	"Desktop" : "",
	"Friend" : "",
	"Schedule" : "res://features/objects/schedule/schedule_action/schedule.tscn"
}

var selected_object : String
var using_item : bool

func _ready() -> void:
	Signals.object_entered.connect(_on_object_entered, 1)
	Signals.object_exited.connect(_on_object_exited)
	DialogueManager.dialogue_ended.connect(start_objective, 1)

func start_objective(resource : DialogueResource) -> void:
	if not selected_object :
		return
	if not self.using_item:
		return
	var objective_name = self.selected_object
	Utilities.load_component(objective_src.get(objective_name))

func _on_object_entered(name: String) -> void:
	self.selected_object = name

func _on_object_exited() -> void:
	self.selected_object = String()

func _set_using_item() -> void :
	self.using_item = true
