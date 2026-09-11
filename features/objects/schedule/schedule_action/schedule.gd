extends CanvasLayer

var object_action_component : OBJECT_ACTION_COMPONENT

func _ready() -> void:
	object_action_component = OBJECT_ACTION_COMPONENT.new()

func _exit_tree() -> void:
	object_action_component._exit()

func _on_button_pressed() -> void:
	self.queue_free()
