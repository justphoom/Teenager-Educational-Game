extends Node2D

@onready var home_spot = $GlowingSpot_Home

func _ready() -> void:
	home_spot.setType(3)

func _on_bedroom_portal_body_entered(_body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-1/tutorial_day_1_bedroom_2.tscn")
