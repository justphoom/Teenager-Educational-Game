extends Node2D

#@onready var exit_glowspot = $Exit/GlowingSpot_Exit
@onready var arcade = $Arcade

func _ready() -> void:
	#exit_glowspot.setType(3)
	arcade.hide()
	Global.CURRENT_DAY = 2
	Global.CURRENT_TIME = 0
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day3/day3-mainroad-1.dialogue"))

func show_arcade() -> void:
	arcade.show()

func _on_arcade_portal_body_entered(_body: Node2D) -> void:
	ScenceTransition.change_scene("res://mini-game-arcade/arcade.tscn")
