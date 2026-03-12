extends CanvasLayer

func _ready() -> void:
	PlayerStatus.isOpenDialog = true
	
#	TODO delete this later
	Tutorial.is_tutorial_state = false

func _on_button_pressed() -> void:
	if Tutorial.is_tutorial_state:
		Global.CURRENT_TIME = 1
		Tutorial.day2_after_bookshelf()
	PlayerStatus.isOpenDialog = false
	self.queue_free()
