extends CanvasLayer

func _ready() -> void:
	PlayerStatus.isOpenDialog = true

func _on_button_pressed() -> void:
	if Tutorial.is_tutorial_state:
		Global.CURRENT_TIME = 3
		Tutorial.day2_after_cinema()
	PlayerStatus.isOpenDialog = false
	self.queue_free()
