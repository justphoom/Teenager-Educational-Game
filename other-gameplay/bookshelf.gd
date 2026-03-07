extends CanvasLayer

func _ready() -> void:
	PlayerStatus.isOpenDialog = true

func _on_button_pressed() -> void:
	if Tutorial.is_tutorial_state:
		Global.CURRENT_TIME = 1
		Tutorial.day2_after_bookshelf()
	PlayerStatus.isOpenDialog = false
	self.queue_free()
