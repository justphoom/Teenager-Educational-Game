extends CanvasLayer

func _on_button_pressed() -> void:
	self.queue_free()

func _ready() -> void:
	Signals.object_active.emit()

func _exit_tree() -> void:
	ObjectiveAction.using_item = false
	Signals.object_finished.emit()
