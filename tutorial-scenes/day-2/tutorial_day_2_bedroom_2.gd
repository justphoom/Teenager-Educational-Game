extends Node2D

@onready var tutorialObject = $tutorialObject

func _ready() -> void:
	Global.CURRENT_DAY = 1
	Global.CURRENT_TIME = 3
	tutorialObject.inactive_mode()
