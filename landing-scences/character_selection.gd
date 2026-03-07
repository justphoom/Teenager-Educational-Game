extends Node2D

#@onready var girl_anim = $GirlAnimatedSprite
@onready var boy_anim = $BoySprite
@onready var girl_anim = $GirlSprite
@onready var start_button = $Start
@onready var boy_button = $Boy
@onready var girl_button = $Girl

var playerGender : String = ""

func _ready():
	boy_anim.hide()
	boy_button.hide()
	boy_anim.play("default")
	girl_anim.hide()
	girl_button.hide()
	girl_anim.play("default")
	start_button.hide()
	DialogueManager.show_dialogue_balloon(load("res://dialogues/CharacterSelection/first-landing.dialogue"))

func show_character() -> void:
	boy_anim.show()
	boy_button.show()
	girl_anim.show()
	girl_button.show()	

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
	DialogueManager.show_dialogue_balloon(load("res://dialogues/CharacterSelection/character-confirmation.dialogue"))

func cancel_selection() -> void:
	boy_anim.play("default")
	girl_anim.play("default")
	start_button.hide()

func start_game_confirmation() -> void:
	ScenceTransition.change_scene("res://tutorial-scenes/day-1/tutorial_day_1_bedroom_1.tscn")
