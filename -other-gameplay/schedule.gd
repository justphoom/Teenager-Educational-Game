extends CanvasLayer

func _ready() -> void:
	PlayerStatus.isOpenDialog = true

func _on_yes_pressed() -> void:
	PlayerStatus.isOpenDialog = false
	if Tutorial.is_tutorial_state:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-bedroom-3.dialogue"))
		Global.CURRENT_DAY = 0
		Global.CURRENT_TIME = 3
	self.queue_free()
	
