extends Node2D

@onready var cafe_glow = $GlowingSpot_Cafe

func _ready() -> void:
	var initPosition = Vector2(450, 700)
	$Player.set_position(initPosition)
	cafe_glow.setType(3)
	Global.CURRENT_DAY = 1
	Global.CURRENT_TIME = 1

func _on_cafe_portal_body_entered(_body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_cafe_1.tscn")
