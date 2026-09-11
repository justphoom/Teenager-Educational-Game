extends Node
class_name OBJECT_ACTION_COMPONENT

func _init() -> void:
	Signals.object_active.emit()

func _exit() -> void:
	ObjectiveAction.using_item = false
	Signals.object_finished.emit()
