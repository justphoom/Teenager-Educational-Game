extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var object : Node = self.get_parent()
	Signals.object_entered.emit(object.name)

func _on_body_exited(body: Node2D) -> void:
	Signals.object_exited.emit()
