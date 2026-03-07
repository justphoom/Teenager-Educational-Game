extends Node2D

@onready var cinemaObject = $cinemaObject

var isClosedCinema : bool = false
@onready var exit_glow = $GlowingSpot_Exit
@onready var exit_glow2 = $GlowingSpot_Exit2

func _ready() -> void:
	Global.CURRENT_DAY = 1
	Global.CURRENT_TIME = 2
	setPlayerPosition(PlayerStatus.PREV_SCENE)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day2/day2-cinema-1.dialogue"))
	
func setPlayerPosition(place: String) -> void:
	var initPosition: Vector2
	match place:
		'cinema1' :
			initPosition = Vector2(1720, 720)
		'cinema2' :
			initPosition = Vector2(200, 720)
		_ :
			initPosition = Vector2(200, 720)
	$Player.set_position(initPosition)

func show_cinema():
	cinemaObject.show_object()

func after_cinema():
	self.isClosedCinema = true
	exit_glow.setType(3)
	exit_glow2.setType(3)
	DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day2/day2-cafe-3.dialogue"))

func _on_exit_body_entered(_body: Node2D) -> void:
	if self.isClosedCinema:
		ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_mainroad_4.tscn")

func _on_exit_2_body_entered(_body: Node2D) -> void:
	if self.isClosedCinema:
		ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_mainroad_4.tscn")
