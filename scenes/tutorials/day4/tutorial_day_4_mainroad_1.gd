extends Node2D

@onready var classroom_spot = $GlowingSpot_Classroom

func _ready() -> void:
	Global.CURRENT_DAY = 3
	Global.CURRENT_TIME = 0
	Global.ASSESSMENT_DATE = true
	classroom_spot.setType(3)	

func _on_classroom_portal_body_entered(body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-4/tutorial_day_4_classroom_1.tscn")
