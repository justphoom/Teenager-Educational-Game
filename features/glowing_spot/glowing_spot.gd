extends Node2D
class_name GLOWING_SPOT

@onready var sprite = $SpotSprite
@onready var animation = $AnimationPlayer

enum {
	normal,
	caution,
	danger,
	unavailable,
	highlight,
	texture,
	animation_type
}

var glowing_type : Dictionary = {
	normal : {
		texture : preload("res://assets/Misc/GlowingSpot/GrowingSpot_Green.png"),
		animation_type : "type_3"
	},
	caution : {
		texture : preload("res://assets/Misc/GlowingSpot/GrowingSpot_Yellow.png"),
		animation_type : "type_2"
	},
	danger : {
		texture : preload("res://assets/Misc/GlowingSpot/GrowingSpot_Red.png"),
		animation_type : "type_1"
	},
	unavailable : {
		texture : preload("res://assets/Misc/GlowingSpot/GrowingSpot_Black.png"),
		animation_type : "type_0"
	},
	highlight : {
		texture : preload("res://assets/Misc/GlowingSpot/GrowingSpot_White.png"),
		animation_type : "type_default"
	}
}

func _ready():
	self.setType(highlight)

func setType(type : int):
	if type not in glowing_type.keys() :
		sprite.texture = null
		animation.play("RESET")
		return
	sprite.texture = glowing_type.get(type).get(texture)
	animation.play(glowing_type.get(type).get(animation_type))
