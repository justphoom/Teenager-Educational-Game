extends Node2D

@onready var animationPlayer = $AnimationPlayer
var stateController : ObjectStateController

@onready var glowSpot = $GlowingSpot

var AVAILABILITY_LIST : Array[int] = [
	CONSTANT.GAME_TIME.MORNING,
	CONSTANT.GAME_TIME.AFTERNOON,
]

func _ready() -> void:
	self.stateController = ObjectStateController.new(self)
	Signals.object_entered.connect(_on_object_entered, 1)
	Signals.object_exited.connect(_on_object_exited)
	stateController._ready()

func _on_object_entered(activeObject : String) -> void:
	if activeObject != self.name:
		return
	stateController._set_hit_object()

func _on_object_exited() -> void:
	stateController._ready()

func play_animation_idle() -> void:
	animationPlayer.play("idle")

func play_animation_active() -> void:
	animationPlayer.play("active")

func check_priority() -> void:
	match PlayerStatus.mentalLevel:
		CONSTANT.PLAYER_BEHAVIOR_SOCRE.AWFUL:
			glowSpot.setType(GLOWING_SPOT.danger)
		CONSTANT.PLAYER_BEHAVIOR_SOCRE.BAD:
			glowSpot.setType(GLOWING_SPOT.caution)
		_ :
			glowSpot.setType(GLOWING_SPOT.normal)

func check_avaibility() -> void:
	if Global.CURRENT_TIME not in self.AVAILABILITY_LIST:
		#print("is not in active time")
		pass
	else:
		pass
		#print("active time")

#extends Node2D
#
#@onready var interactionButton = $InteractionButton
#@onready var animPlayer = $AnimationPlayer
#var is_in_object_area : bool = false
#var is_active : bool = false
#
#var schedulePrefab = preload("res://other-gameplay/bookshelf.tscn")
#
#var AVAILABILITY_LIST : Array[int] = [Global.GAME_TIME_MORNING, Global.GAME_TIME_AFTERNOON]
#
##basic properties : show button, input actions
#func show_interact_button():
	#is_in_object_area = true
	#interactionButton.show()
#
#func hide_interact_button():
	#is_in_object_area = false
	#interactionButton.hide()
#
#func check_availability() -> bool:
	#return AVAILABILITY_LIST.has(Global.CURRENT_TIME)
#
#func glow_type_from_player_status() -> int:
	##temp return no checking status
	#if !check_availability():
		#return 0
	## to be add with the computing type logic
	#return 3
#
#func _input(event):
	#if event is InputEventKey and event.pressed:
		#if event.keycode == KEY_Z && is_in_object_area:
			#self.bookshelf_object_interaction()
#
#func _on_interact_button_pressed() -> void:
	#self.bookshelf_object_interaction()
#
##state control : on hit, out of hit, standing by, inactive (test date & tutorial)
## not test date : 
#func _on_area_2d_body_entered(_body: Node2D) -> void:
	#if is_active:
		#animPlayer.play("active")
		#self.show_interact_button()
#
#func _on_area_2d_body_exited(_body: Node2D) -> void:
	#if is_active:
		#animPlayer.play("idle")
		#self.hide_interact_button()
		#self.standing_by()
		#var glowing_spot = $GlowingSpot
		#glowing_spot.show()
#
#func standing_by():
	#is_active = true
	#self.update_avialability()
#
#func update_avialability() -> void:
	#var glowing_spot = $GlowingSpot
	#glowing_spot.setType(self.glow_type_from_player_status())
#
#func on_using_item():
	#self.hide_interact_button()
	#var glowing_spot = $GlowingSpot
	#glowing_spot.hide()
#
## on test date & tutorial script
#func inactive_mode():
	#print("inactive mode")
	#is_active = false
	#is_in_object_area = false
	#interactionButton.hide()
	#var glowing_spot = $GlowingSpot
	#glowing_spot.setType(10)
#
##on load
#func _ready() -> void:
	#self.hide_interact_button()
	#if Global.ASSESSMENT_DATE:
		#print("is assessment date")
		#self.inactive_mode()
		#return
	#self.standing_by()
#
##action control
#func bookshelf_object_interaction():
	#animPlayer.play("idle")
	#if Tutorial.is_tutorial_state:
		#Global.CURRENT_TIME = 1
		#print("classroom tutorial")
		#DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day2/day2-bookshelf-1.dialogue"))
		#self.inactive_mode()
	#else:
		#print("classroom object interaction")
		#self.on_using_item()
		#if Global.CURRENT_TIME == Global.GAME_TIME_NIGHT:
			#DialogueManager.show_dialogue_balloon(load("res://dialogues/sleep-time.dialogue"))
			#return
		#if !check_availability():
			#print("not avaiable")
			#DialogueManager.show_dialogue_balloon(load("res://dialogues/object-unavialable.dialogue"))
			#return
		#DialogueManager.show_dialogue_balloon(load("res://dialogues/temp.dialogue"))
		#Global.day_time_update()
		#self.sence_call_update_avialability()
#
#func sence_call_update_avialability():
	#var parent_scene = $".."
	#parent_scene.update_avialability()
#
#func show_object():
	#var obj = schedulePrefab.instantiate()
	#add_child(obj)
