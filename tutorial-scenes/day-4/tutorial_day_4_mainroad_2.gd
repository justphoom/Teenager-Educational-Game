extends Node2D

@onready var bedroom_spot = $GlowingSpot_Home

func _ready() -> void:
	Global.CURRENT_DAY = 3
	Global.CURRENT_TIME = 3
	Global.ASSESSMENT_DATE = true
	bedroom_spot.setType(3)	

func _on_bedroom_portal_body_entered(body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-4/tutorial_day_4_bedroom_2.tscn")
