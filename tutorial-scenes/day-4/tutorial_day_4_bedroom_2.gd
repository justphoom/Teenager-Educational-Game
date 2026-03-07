extends Node2D

@onready var bedroomObject = $bedroomObject
@onready var desktopObject = $desktopObject
@onready var tutorialObject= $tutorialObject

func _ready() -> void:
	Global.CURRENT_DAY = 3
	Global.CURRENT_TIME = 3
	Global.ASSESSMENT_DATE = true
	
	bedroomObject.standing_by()
	desktopObject.inactive_mode()
	tutorialObject.inactive_mode()
