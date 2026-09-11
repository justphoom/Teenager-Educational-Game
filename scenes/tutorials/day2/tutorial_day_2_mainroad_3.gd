extends Node2D

@onready var cinema_spot1 = $GlowingSpot_Cinema1
@onready var cinema_spot2 = $GlowingSpot_Cinema2

func _ready() -> void:
	var initPosition = Vector2(1660, 380)
	$Player.set_position(initPosition)
	Global.CURRENT_DAY = 1
	Global.CURRENT_TIME = 2
	cinema_spot1.setType(3)
	cinema_spot2.setType(3)

func _on_cinema_portal_body_entered(_body: Node2D) -> void:
	PlayerStatus.PREV_SCENE = 'cinema1'
	ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_cinema_1.tscn")

func _on_cinema_portal_2_body_entered(_body: Node2D) -> void:
	PlayerStatus.PREV_SCENE = 'cinema2'
	ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_cinema_1.tscn")
