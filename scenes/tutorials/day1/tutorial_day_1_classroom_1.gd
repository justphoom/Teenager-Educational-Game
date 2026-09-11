extends Node2D

@onready var classroom_object = $classroomObject
@onready var friend_object = $friendObject
@onready var player_joystick = $Player/Joystick/Stats
var namingPrefab = preload("res://other-gameplay/naming.tscn")

var is_show_exit: bool = false
@onready var exit_spot = $Exit/GlowingSpot_Exit

func _ready() -> void:
	classroom_object.hide()
	classroom_object.inactive_mode()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-classroom-1.dialogue"))

func day1_classroom_naming() -> void:
	var namingObj = namingPrefab.instantiate()
	add_child(namingObj)

func day1_classrrom_show_classroom_object() -> void:
	print("after naming")
	friend_object.inactive_mode()
	classroom_object.show()
	classroom_object.standing_by()

func day1_classroom_get_archive() -> void:
	player_joystick.show()

func day1_classroom_show_exit() -> void:
	is_show_exit = true
	exit_spot.setType(3)

func _on_exit_body_entered(_body: Node2D) -> void:
	if is_show_exit:
		ScenceTransition.change_scene("res://tutorial-scenes/day-1/tutorial_day_1_mainroad_2.tscn")
