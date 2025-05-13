extends Node2D

@onready var cafeAnimation = $Object/CafeObject/CafeItem/AnimationPlayer

func _ready() -> void:
	cafeAnimation.play("CafeAnimation")

func _on_exit_body_entered(body: Node2D) -> void:
	PlayerStatus.toMainroadFrom = "cafe"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")
