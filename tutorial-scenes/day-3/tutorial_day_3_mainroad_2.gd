extends Node2D

#@onready var exit_glowspot = $Exit/GlowingSpot_Exit
@onready var sport = $Sport

func _ready() -> void:
	#exit_glowspot.setType(3)
	sport.hide()
	Global.CURRENT_DAY = 2
	Global.CURRENT_TIME = 1
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day3/day3-mainroad-2.dialogue"))

func show_sport() -> void:
	sport.show()

func _on_sport_portal_body_entered(body: Node2D) -> void:
	ScenceTransition.change_scene("res://mini-game-sport/sport.tscn")
