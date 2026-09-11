extends Node2D
class_name GLOWING_SPOT

@onready var sprite = $SpotSprite
@onready var animation = $AnimationPlayer

var red_glow  = preload("res://assets/Misc/GlowingSpot/GrowingSpot_Red.png")
var yellow_glow  = preload("res://assets/Misc/GlowingSpot/GrowingSpot_Yellow.png")
var green_glow  = preload("res://assets/Misc/GlowingSpot/GrowingSpot_Green.png")
var white_glow = preload("res://assets/Misc/GlowingSpot/GrowingSpot_White.png")
var black_glow = preload("res://assets/Misc/GlowingSpot/GrowingSpot_Black.png")

enum {
	normal,
	caution,
	danger,
	unavailable,
	highlight,
}

func _ready():
	self.setType(highlight)

func setType(type : int):
	match type:
		normal :
			sprite.texture = green_glow
			animation.play("type_3")
		caution :
			sprite.texture = yellow_glow
			animation.play("type_2")
		danger : 
			sprite.texture = red_glow
			animation.play("type_1")
		unavailable :
			sprite.texture = white_glow
			animation.play("type_0")
		highlight :
			sprite.texture = black_glow
			animation.play("type_default")
		_ :
			sprite.texture = null
			animation.play("RESET")
