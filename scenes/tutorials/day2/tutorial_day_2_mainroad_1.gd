extends Node2D

@onready var classroom_spot = $ClassroomPortal/GlowingSpot_Classroom

func _ready() -> void:
	var initPosition = Vector2(150, 900)
	$Player.set_position(initPosition)
	classroom_spot.setType(3)
	Global.CURRENT_DAY = 1

func _on_classroom_portal_body_entered(body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_classroom_1.tscn")
