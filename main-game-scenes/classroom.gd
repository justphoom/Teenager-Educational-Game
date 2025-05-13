extends Node2D

@onready var friendSprite = $Object/FriendObject/FriendObject/Sprite2D
@onready var classroomAnimation = $Object/ClassroomObject/ClassroomObject/AnimationPlayer
@onready var bookshelfAnimation = $Object/BookshelfObject/ClassroomObject/AnimationPlayer

var boyImg  = preload("res://assets/MainCharacter/Boy/Down/Down1.png")
var girlImg  = preload("res://assets/MainCharacter/Girl/Down/Down1.png")

func _ready() -> void:
	classroomAnimation.play("ClassroomAnimation")
	classroomAnimation.play("ClassroomGrowingAnimation")
	bookshelfAnimation.play("BookshelfAnimation")
	bookshelfAnimation.play("GrowingAnimation")
	if PlayerStatus.playerGender == 'BOY':
		friendSprite.texture = girlImg
	elif PlayerStatus.playerGender == 'GIRL':
		friendSprite.texture = boyImg

func _on_exit_body_entered(body: Node2D) -> void:
	PlayerStatus.toMainroadFrom = "classroom"
	get_tree().change_scene_to_file("res://main-game-scenes/mainroad.tscn")
