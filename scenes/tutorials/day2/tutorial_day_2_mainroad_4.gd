extends Node2D

@onready var home_spot = $GlowingSpot_Home

func _ready() -> void:
	var initPosition = Vector2(1520, 900)
	$Player.set_position(initPosition)
	Global.CURRENT_DAY = 1
	Global.CURRENT_TIME = 3
	home_spot.setType(3)

func _on_bedroom_portal_body_entered(body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_bedroom_2.tscn")
