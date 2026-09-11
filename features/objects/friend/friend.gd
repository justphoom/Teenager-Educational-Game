extends Node2D

@onready var friendSprite = $Sprite2D
@onready var interactionButton = $InteractionButton
@onready var animPlayer = $AnimationPlayer
var is_in_object_area : bool = false
var is_active : bool = false

var AVAILABILITY_LIST : Array[int] = [Global.GAME_TIME_MORNING, Global.GAME_TIME_AFTERNOON]

#basic properties : show button, input actions
func show_interact_button():
	is_in_object_area = true
	interactionButton.show()

func hide_interact_button():
	is_in_object_area = false
	interactionButton.hide()

func check_availability() -> bool:
	return AVAILABILITY_LIST.has(Global.CURRENT_TIME)

func glow_type_from_player_status() -> int:
	#temp return no checking status
	if !check_availability():
		return 0
	# to be add with the computing type logic
	return 3

func _input(event):
	if event is InputEventKey and event.pressed: #for test in pc with key-input
		if event.keycode == KEY_Z && is_in_object_area:
			friend_object_interaction()

func _on_interact_button_pressed() -> void:
	friend_object_interaction()

#state control : on hit, out of hit, standing by, inactive (test date & tutorial)
# not test date : 
func _on_area_2d_body_entered(_body: Node2D) -> void:
	if is_active:
		if PlayerStatus.playerGender == "BOY":
			animPlayer.play("active_girl")
		else:
			animPlayer.play("active_boy")
		self.show_interact_button()

func _on_area_2d_body_exited(_body: Node2D) -> void:
	if is_active:
		if PlayerStatus.playerGender == "BOY":
			print("show girl")
			animPlayer.play("idle_girl")
		else:
			animPlayer.play("idle_boy")
		self.hide_interact_button()
		self.standing_by()
		var glowing_spot = $GlowingSpot
		glowing_spot.show()

func standing_by():
	is_active = true
	self.update_avialability()

func update_avialability() -> void:
	var glowing_spot = $GlowingSpot
	glowing_spot.setType(self.glow_type_from_player_status())

func on_using_item():
	self.hide_interact_button()
	var glowing_spot = $GlowingSpot
	glowing_spot.hide()

# on test date & tutorial script
func inactive_mode():
	print("inactive mode")
	is_active = false
	is_in_object_area = false
	interactionButton.hide()
	var glowing_spot = $GlowingSpot
	glowing_spot.setType(10)

#on load
func _ready() -> void:
	#if PlayerStatus.playerGender == "BOY":
		#animPlayer.play("idle_girl")
	#else:
		#animPlayer.play("idle_boy")
	self.hide_interact_button()
	if Global.ASSESSMENT_DATE:
		print("is assessment date")
		self.inactive_mode()
		return
	self.standing_by()

#action control
func friend_object_interaction():
	self.on_using_item()
	if PlayerStatus.playerGender == "BOY":
		animPlayer.play("idle_girl")
	else:
		animPlayer.play("idle_boy")
	if Tutorial.is_tutorial_state:
		print("friend tutorial")
		Global.CURRENT_TIME = 1
		DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-friend-1.dialogue"))
	else:
		print("friend object interaction")
		if Global.CURRENT_TIME == Global.GAME_TIME_NIGHT:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/sleep-time.dialogue"))
			return
		if !check_availability():
			print("not avaiable")
			DialogueManager.show_dialogue_balloon(load("res://dialogues/object-unavialable.dialogue"))
			return
		DialogueManager.show_dialogue_balloon(load("res://dialogues/temp.dialogue"))
		Global.day_time_update()
		self.sence_call_update_avialability()

func sence_call_update_avialability():
	var parent_scene = $".."
	parent_scene.update_avialability()
