extends Node2D

#@onready var girl_anim = $GirlAnimatedSprite
@onready var boy_anim = $BoySprite
@onready var girl_anim = $GirlSprite
@onready var start_button = $Start

var playerGender : String = ""

func _ready():
	boy_anim.play("default")
	girl_anim.play("default")
	start_button.hide()

func _on_girl_pressed() -> void:
	playerGender = "GIRL"
	boy_anim.play("default")
	girl_anim.play("GirlSelectedAnimation")
	start_button.show()

func _on_boy_pressed() -> void:
	playerGender = "BOY"
	boy_anim.play("BoySelectedAnimation")
	girl_anim.play("default")
	start_button.show()

func _on_start_pressed() -> void:
	PlayerStatus.playerGender = playerGender
	get_tree().change_scene_to_file("res://main-game-scenes/bedroom.tscn")
