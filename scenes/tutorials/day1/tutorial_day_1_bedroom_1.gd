extends Node2D

@onready var exit_item = $Exit
@onready var exit_item_glow = $Exit/GlowingSpot_Exit
@onready var exit_item_shoud = $Exit/ExitSound
var exitDelay : float = 0.15
var isExitHide : bool

func _ready() -> void:
	hide_exit()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-bedroom-1.dialogue"))

func _on_exit_body_entered(_body: Node2D) -> void:
	if !isExitHide:
		exit_item_shoud.play()
		await get_tree().create_timer(Global.exitDelay).timeout
		ScenceTransition.change_scene("res://tutorial-scenes/day-1/tutorial_day_1_mainroad_1.tscn")

func hide_exit():
	isExitHide = true
	exit_item.hide()

func show_exit():
	isExitHide = false
	exit_item.show()
	exit_item_glow.setType(2)
