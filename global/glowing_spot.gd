extends Node2D

@onready var sprite = $SpotSprite
@onready var anim = $AnimationPlayer

var redGlow  = preload("res://assets/Misc/GrowingSpot_Red.png")
var yellowGlow  = preload("res://assets/Misc/GrowingSpot_Yellow.png")
var greenGlow  = preload("res://assets/Misc/GrowingSpot_Green.png")
var whiteGlow = preload("res://assets/Misc/GrowingSpot_White.png")
var blackGlow = preload("res://assets/Misc/GrowingSpot_Black.png")

func _ready():
	setType(5)
	
func setType(typeValue: int):
	match typeValue:
		3 : #green
			sprite.texture = greenGlow
			anim.play("type_3")
		2 : #yellow
			sprite.texture = yellowGlow
			anim.play("type_2")
		1 : #red
			sprite.texture = redGlow
			anim.play("type_1")
		0 : #black
			sprite.texture = blackGlow
			anim.play("type_0")
		4 :  #white
			sprite.texture = whiteGlow
			anim.play("type_default")
		_ : #no color
			sprite.texture = null
