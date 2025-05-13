extends Node2D

@onready var cinemaAnimation = $Object/CinemaObject/CinemaItem/AnimationPlayer

func _ready() -> void:
	cinemaAnimation.play("CinemaAnimation")

func _on_exit_body_entered(body: Node2D) -> void:
	PlayerStatus.toMainroadFrom = "cinema"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")

func _on_exit_2_body_entered(body: Node2D) -> void:
	PlayerStatus.toMainroadFrom = "cinema"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")
