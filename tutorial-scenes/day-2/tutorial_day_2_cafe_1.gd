extends Node2D

@onready var cafeObject = $cafeObject

var isClosedCafe : bool = false
@onready var exit_glow = $GlowingSpot_Exit

func _ready() -> void:
	Global.CURRENT_DAY = 1
	Global.CURRENT_TIME = 1
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day2/day2-cafe-1.dialogue"))

func show_cafe():
	cafeObject.show_object()

func after_cafe():
	self.isClosedCafe = true
	exit_glow.setType(3)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day2/day2-cafe-3.dialogue"))

func _on_exit_body_entered(_body: Node2D) -> void:
	if isClosedCafe:
		ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_mainroad_3.tscn")
