extends Node
class_name ObjectStateController

var object : Node

func _init(object : Node ) -> void:
	self.object = object
	#print("instantiateed object with state controller.")

func _ready() -> void:
	object.play_animation_idle()
	object.check_priority()
	object.check_avaibility()

func _set_hit_object() -> void:
	object.play_animation_active()

func _set_while_interact() -> void:
	object.play_animation_idle()
