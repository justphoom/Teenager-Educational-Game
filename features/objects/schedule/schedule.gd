extends Node2D

@onready var animationPlayer = $AnimationPlayer
var stateController : ObjectStateController

#make this one dynamic via composition style
@onready var glowSpot = $GlowingSpot

var AVAILABILITY_LIST : Array[int] = [
	CONSTANT.GAME_TIME.MORNING,
	CONSTANT.GAME_TIME.AFTERNOON,
	CONSTANT.GAME_TIME.EVENING,
]

func _ready() -> void:
	self.stateController = ObjectStateController.new(self)
	Signals.object_entered.connect(_on_object_entered, 1)
	Signals.object_exited.connect(_on_object_exited)
	stateController._ready()


func _on_object_entered(name : String) -> void:
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
		print("is not in active time")
		pass
	else:
		print("active time")

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
