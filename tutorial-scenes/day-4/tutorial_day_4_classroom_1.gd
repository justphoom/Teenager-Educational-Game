extends Node2D

@onready var bookshelfObject = $bookshelfObject
@onready var classroomObject = $classroomObject
@onready var friendObject = $friendObject

var isPassTheTest : bool = false

@onready var exit_spot = $GlowingSpot_Exit

func _ready() -> void:
	Global.CURRENT_DAY = 3
	Global.CURRENT_TIME = 0
	Global.ASSESSMENT_DATE = true
	bookshelfObject.inactive_mode()
	friendObject.inactive_mode()
	classroomObject.standing_by()
	exit_spot.hide()

func show_exit() -> void:
	Global.CURRENT_TIME = 3
	isPassTheTest = true
	exit_spot.setType(3)
	exit_spot.show()

func _on_exit_body_entered(_body: Node2D) -> void:
	if isPassTheTest:
		ScenceTransition.change_scene("res://tutorial-scenes/day-4/tutorial_day_4_mainroad_2.tscn")
