extends Node2D

@onready var animationPlayer = $AnimationPlayer
var stateController : ObjectStateController

@onready var glowSpot = $GlowingSpot

var AVAILABILITY_LIST : Array[int] = [
	CONSTANT.GAME_TIME.NIGHT
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

#func check_availability() -> bool:
	#return AVAILABILITY_LIST.has(Global.CURRENT_TIME)
#
#func glow_type_from_player_status() -> int:
	##temp return no checking status
	#if !self.check_availability():
		#return 0
	## to be add with the computing type logic
	#return 3
#
#
#func _on_interact_button_pressed() -> void:
	#self.tutorial_object_interaction()
#
#func standing_by():
	##is_active = true
	#self.update_avialability()
#
#func update_avialability() -> void:
	#var glowing_spot = $GlowingSpot
	#glowing_spot.setType(self.glow_type_from_player_status())
#
#func on_using_item():
	#var glowing_spot = $GlowingSpot
	#glowing_spot.hide()
#
## on test date & tutorial script
#func inactive_mode():
	#print("inactive mode")
	##is_active = false
	##interactionButton.hide()
	#var glowing_spot = $GlowingSpot
	#glowing_spot.setType(10)
#
##on load
	##self.hide_interact_button()
	##if Global.ASSESSMENT_DATE:
		##print("is assessment date")
		##self.inactive_mode()
		##return
	##self.standing_by()
#
##action control
#func tutorial_object_interaction():
	#animPlayer.play("idle")
	#if Tutorial.is_tutorial_state:
		#print("tutorial tutorial")
		#self.inactive_mode()
		#DialogueManager.show_dialogue_balloon(load("res://dialogues/Tutorial/Day1/day1-schedule-1.dialogue"))
	#else:
		#print("tutorial object interaction")
		#self.on_using_item()
		#if Global.CURRENT_TIME == Global.GAME_TIME_NIGHT:
			#DialogueManager.show_dialogue_balloon(load("res://dialogues/sleep-time.dialogue"))
			#return
		#if !check_availability():
			#print("not avaiable")
			#DialogueManager.show_dialogue_balloon(load("res://dialogues/object-unavialable.dialogue"))
			#return
		#DialogueManager.show_dialogue_balloon(load("res://dialogues/temp.dialogue"))
		#self.show_schedule()
		#Global.day_time_update()
		#self.sence_call_update_avialability()
#
#func sence_call_update_avialability():
	#var parent_scene = $".."
	#parent_scene.update_avialability()
#
#func show_schedule():
	#pass
	##var obj = schedulePrefab.instantiate()
	##add_child(obj)


#extends Node2D
#
#@onready var interactionButton = $InteractionButton
#@onready var animPlayer = $AnimationPlayer
#var is_in_object_area: bool = false
#var is_active: bool = false
#
#var AVAILABILITY_LIST : Array[int] = [Global.GAME_TIME_NIGHT]
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
			#self.bedroom_object_interaction()
#
#func _on_interact_button_pressed() -> void:
	#self.bedroom_object_interaction()
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
	#glowing_spot.setType(10)
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
	#animPlayer.play("idle")
	#self.hide_interact_button()
	## if Global.ASSESSMENT_DATE:
	## 	print("is assessment date")
	## 	self.inactive_mode()
	## 	return
	#self.standing_by()
#
##action control
#func bedroom_object_interaction():
	#animPlayer.play("idle")
	#if Tutorial.is_tutorial_state:
		#print("bedroom tutorial")
		#match Global.CURRENT_DAY:
			#0:
				#ScenceTransition.change_scene("res://tutorial-scenes/day-1/tutorial_day_1_sleeping_1.tscn")
			#1:
				#ScenceTransition.change_scene("res://tutorial-scenes/day-2/tutorial_day_2_sleeping_1.tscn")
			#2:
				#ScenceTransition.change_scene("res://tutorial-scenes/day-3/tutorial_day_3_sleeping_1.tscn")
			#3:
				#ScenceTransition.change_scene("res://tutorial-scenes/day-4/tutorial_day_4_sleeping_1.tscn")
			#_:
				#print("sleep in main game")
				#ScenceTransition.change_scene("res://main-game-scenes/sleeping.tscn")
	#else:
		#print("bedroom object interaction")
		#self.on_using_item()
		#if !check_availability():
			#print("not avaiable")
			#DialogueManager.show_dialogue_balloon(load("res://dialogues/object-unavialable.dialogue"))
			#return
		##DialogueManager.show_dialogue_balloon(load("res://dialogues/temp.dialogue"))
		#ScenceTransition.change_scene("res://main-game-scenes/sleeping.tscn")
		#Global.day_time_update()
