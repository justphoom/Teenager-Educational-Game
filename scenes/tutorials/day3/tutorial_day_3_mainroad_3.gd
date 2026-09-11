extends Node2D

@onready var home_glowspot = $GlowingSpot_Home

func _ready() -> void:
	#exit_glowspot.setType(3)
	Global.CURRENT_DAY = 2
	Global.CURRENT_TIME = 2
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day3/day3-mainroad-3.dialogue"))

func show_bedroom() -> void:
	home_glowspot.setType(3)

func _on_bedroom_portal_body_entered(body: Node2D) -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-3/tutorial_day_3_bedroom_2.tscn")
